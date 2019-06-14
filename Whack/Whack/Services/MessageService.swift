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

    func findChannels(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
//                do {
//                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
//                } catch let error {
//                    debugPrint(error as Any)
//                }
                do {
                    if let json = try JSON(data: data).array {
                        for item in json {
                            let name = item["name"].stringValue
                            let channelDesc = item["description"].stringValue
                            let id = item["id"].stringValue
                            
                            let channel = Channel(id: id, name: name, description: channelDesc)
                            self.channels.append(channel)
                        }
                        completion(true)
                    }
                } catch {
                    
                }
                print(self.channels)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
