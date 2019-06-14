//
//  Channel.swift
//  Whack
//
//  Created by Shreya Randive on 6/13/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import Foundation

struct Channel : Decodable{
    public private(set) var _id: String!
    public private(set) var name: String!
    public private(set) var description: String!
    public private(set) var __v: Int?
}
