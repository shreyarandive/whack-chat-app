//
//  MessageService.swift
//  Whack
//
//  Created by Shreya Randive on 6/13/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static let instance = MessageService()
    
    var channels = [Channel]()
    var messages = [Message]()
    var unreadChannels = [String]()
    var selectedChannel: Channel?

    func findChannels(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                do {
                    if let json = try JSON(data: data).array {
                        for item in json {
                            let name = item["name"].stringValue
                            let channelDesc = item["description"].stringValue
                            let id = item["_id"].stringValue
                            
                            let channel = Channel(id: id, name: name, description: channelDesc)
                            self.channels.append(channel)
                        }
                        NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                        completion(true)
                    }
                } catch {
                    
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func findAllMessages(channelID: String, completion: @escaping CompletionHandler) {
        Alamofire.request("\(URL_GET_MESSAGES)\(channelID)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                self.clearMessages()
                
                guard let data = response.data else { return }
                do {
                    if let json = try JSON(data: data).array {
                        for item in json {
                            let messageBody = item["messageBody"].stringValue
                            let timeStamp = item["timeStamp"].stringValue
                            let userId = item["_id"].stringValue
                            let channelId = item["channelId"].stringValue
                            let userName = item["userName"].stringValue
                            let userAvatarName = item["userAvatar"].stringValue
                            let userAvatarColor = item["userAvatarColor"].stringValue
                            
                            let currentMessage = Message(message: messageBody, id: userId, name: userName, avatarColor: userAvatarColor, avatarName: userAvatarName, channelID: channelId, timestamp: timeStamp)
                            self.messages.append(currentMessage)
                        }
                        print(self.messages)
                        completion(true)
                    }
                } catch {
                    
                }
            } else {
                print(response.result.error as Any)
                completion(false)
            }
        }
    }
    
    func clearMessages() {
            messages.removeAll()
    }
    
    func clearChannels() {
        channels.removeAll()
    }
}
