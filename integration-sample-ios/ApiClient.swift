//
//  ApiClient.swift
//  integration-sample-ios
//
//  Created by Hiromasa Ohno on 12/4/15.
//  Copyright © 2015 xoyip. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ApiClient: NSObject {
    static let sharedInstance = ApiClient()
    let endpoint : String = "\(Constants.SERVER_URL)/api"
    
    func get(path: String, parameters: Dictionary<String, String>, onSuccess: (JSON)->Void, onFailure: (NSError)->Void) {
        guard let url = NSURL(string: endpoint + path) else {
            return
        }
       
        let headers = [
            "Authorization": "Bearer \(Auth.sharedInstance.accessToken()!)"
        ]
        
        Alamofire.request(.GET, url, headers: headers, parameters: parameters).responseJSON { response in
            if response.result.isSuccess {
                if let value = response.result.value {
                    onSuccess(JSON(value))
                }
            } else {
                if let error = response.result.error {
                    onFailure(error)
                }
            }
        }
    }
}
