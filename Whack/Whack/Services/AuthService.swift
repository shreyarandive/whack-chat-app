//
//  AuthService.swift
//  Whack
//
//  Created by Shreya Randive on 6/10/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedin : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowercaseEmail = email.lowercased()
       
        let body: [String: Any] = [
            "email": lowercaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowercaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowercaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                /*if let json = response.result.value as? Dictionary<String, Any> {
                    if let email = json["user"] as? String {
                        self.userEmail = email
                    }
                    if let token = json["token"] as? String {
                        self.authToken = token
                    }
                }*/
                //swiftyJSON
                
                guard let data = response.data else { return }
                
                do {
                    let json = try JSON(data: data)
                    
                    self.userEmail = json["user"].stringValue
                    self.authToken = json["token"].stringValue
                    
                    self.isLoggedin = true
                    completion(true)
                    
                } catch let error as NSError {
                    print(error)
                }
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        
        let lowercaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "name": name,
            "email": lowercaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        let header = [
            "Authorization": "Bearer \(AuthService.instance.authToken)",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            if response.result.error == nil {
                
                guard let data = response.data else { return }
                do {
                    let json = try JSON(data: data)
                    let id = json["_id"].stringValue
                    let avatarColor = json["avatarColor"].stringValue
                    let avatarName = json["avatarName"].stringValue
                    let name = json["name"].stringValue
                    let email = json["email"].stringValue
                    
                    UserDataService.instance.setUserData(id: id, avatarColor: avatarColor, avatarName: avatarName, email: email, name: name)
                } catch {
                    
                }
                
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
