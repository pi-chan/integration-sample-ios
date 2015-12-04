//
//  Auth.swift
//  integration-sample-ios
//
//  Created by Hiromasa Ohno on 12/4/15.
//  Copyright © 2015 xoyip. All rights reserved.
//

import UIKit
import p2_OAuth2
import SwiftyJSON
import KeychainAccess

class Auth {
    static let sharedInstance = Auth()
    
    var oauth2 : OAuth2CodeGrant?
    
    init() {
        let settings = [
            "client_id": Constants.APP_ID,
            "client_secret": Constants.APP_SECRET,
            "authorize_uri": Constants.SERVER_URL + "/oauth/authorize",
            "token_uri": Constants.SERVER_URL + "/oauth/token",
            "scope": "",
            "redirect_uris": ["integration-sample-ios://oauth-callback/ios"],
            "keychain": false,
            ] as OAuth2JSON
        
        oauth2 = OAuth2CodeGrant(settings: settings as OAuth2JSON)
        oauth2?.authConfig.authorizeEmbedded = true
        oauth2?.onAuthorize = { parameters in
            let json = JSON(parameters)
            let keychain = KeychainAccess.Keychain(service: Constants.SERVICE_NAME)
            try! keychain.set(json[Constants.ACCESS_TOKEN].stringValue, key: Constants.ACCESS_TOKEN)
        }
        oauth2?.onFailure = { error in
            print(error)
        }
    }
    
    func accessToken() -> String? {
        let keychain = KeychainAccess.Keychain(service: Constants.SERVICE_NAME)
        let token = try! keychain.get(Constants.ACCESS_TOKEN)
        return token
    }
}