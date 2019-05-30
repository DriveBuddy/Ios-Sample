//
//  ViewController2.swift
//  DriveBuddyTestProject
//
//  Created by Çağlar Uslu on 30.10.2018.
//  Copyright © 2018 Çağlar Uslu. All rights reserved.
//

import UIKit
import DriveBuddySDK

class EnableSDKViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // TAP TO START DRIVING, TAP AGAIN TO STOP
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.view.addGestureRecognizer(tap)
        
        DriveBuddy.enable(automaticDrivingDetection: false) { (success) in
            if success{
                print("Enabled")
            }
        }
        
        
        
        
        // FOR AUTOMATIC DRIVING DETECTION REMOVE ALL RELATED LINES AND UNCOMMENT FOLLOWING BLOCK
        
//        DriveBuddy.enable { (success) in
//            if success{
//                print("Automatic driving detection enabled.")
//            }
//        }
        
        
    }
    
    var counter = 0
    
    @objc func tapped(){
        
        if counter % 2 == 0{
            
            DriveBuddy.startDrivingActivity { (success) in
                if success{
                    print("started")
                }
            }
            
        }else{
            
            DriveBuddy.stopDrivingActivity()
            
        }
        
        counter += 1
        
    }
    


}
