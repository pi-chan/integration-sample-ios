//
//  ViewController.swift
//  integration-sample-ios
//
//  Created by Hiromasa Ohno on 12/4/15.
//  Copyright © 2015 xoyip. All rights reserved.
//

import UIKit
import p2_OAuth2
import KeychainAccess

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let keychain = KeychainAccess.Keychain(service: Constants.SERVICE_NAME)
        if let accessToken = try! keychain.get(Constants.ACCESS_TOKEN) {
            print(accessToken)
            ApiClient.sharedInstance.get("/user", parameters: [:], onSuccess: { json in
                print(json)
                let alertController = UIAlertController(title: "ログイン成功", message: "\(json["name"])\nとしてログインしました", preferredStyle: .Alert)
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(defaultAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            }, onFailure: { error in
                print(error)
            })
        } else {
            Auth.sharedInstance.oauth2?.authConfig.authorizeContext = self
            Auth.sharedInstance.oauth2?.authorize()
        }
    }
}

