//
//  MainController.swift
//  Twitch
//
//  Created by Tonny Gammer on 8/16/19.
//  Copyright © 2019 Blancovery. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    @IBOutlet weak var btnLogin: loginButton!
    @IBOutlet weak var btnSignup: loginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
}
