//
//  Constants.swift
//  integration-sample-ios
//
//  Created by Hiromasa Ohno on 12/4/15.
//  Copyright © 2015 xoyip. All rights reserved.
//

import UIKit

struct Constants {
    #if true
    static let APP_ID = "12ea28533c02c509e2790a0d7eef4e15e482807a655c68f688b8df1980f7feff"
    static let APP_SECRET = "3cec4acd711ffc73bf8041b34152b6e7f490047ef77b217e4c2e1fce21297916"
    static let SERVER_URL = "http://integration-sample-rails.192.168.11.4.xip.io"
    #else
    static let APP_ID = ""
    static let APP_SECRET = ""
    static let SERVER_URL = ""
    #endif
    
    static let SERVICE_NAME = "info.piyox.integration-sample-ios"
    static let ACCESS_TOKEN = "access_token"
}

