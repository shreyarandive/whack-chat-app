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
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND =  "unwindToChannel"
let AVATAR = "toAvatarPicker"
let CREATE_TO_REVEAL = "toRevealController"
let LOGIN_TO_REVEAL = "loginToRevealController"
let TO_PROFILE = "toProfile"

//user defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//urls
let BASE_URL = "https://whackchattychat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel/"
let URL_GET_MESSAGES = "\(BASE_URL)message/byChannel/"

//headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]

//colors
let whackPurplePlaceHolder = #colorLiteral(red: 0.5019607843, green: 0.07323310524, blue: 0.1168112829, alpha: 0.5)

//notifications
let NOTIF_USR_DATA_DID_CHANGE = Notification.Name("notifUsrDataChanged")
let NOTIF_CHANNELS_LOADED = Notification.Name("channelsLoaded")
let NOTIF_CHANNEL_SELECTED = Notification.Name("channelSelected")

