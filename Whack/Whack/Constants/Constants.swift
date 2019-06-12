//
//  Constants.swift
//  Whack
//
//  Created by Shreya Randive on 6/8/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success : Bool) -> ()

//segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND =  "unwindToChannel"
let AVATAR = "toAvatarPicker"

//user defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//urls
let BASE_URL = "https://whackchat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

//headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

//colors
let smackPurplePlaceHolder = #colorLiteral(red: 0.5019607843, green: 0.07323310524, blue: 0.1168112829, alpha: 0.5)
 
