//
//  ViewController2.swift
//  DriveBuddyTestProject
//
//  Created by Çağlar Uslu on 30.10.2018.
//  Copyright © 2018 Çağlar Uslu. All rights reserved.
//

import UIKit
import DriveBuddySDK

class EnablingSDKViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        DriveBuddy.enable { (success) in
            if success{
                print("Automatic driving detection enabled.")
            }
        }
    }
    


}
