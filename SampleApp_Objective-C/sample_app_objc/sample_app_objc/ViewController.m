//
//  ViewController.m
//  drivebuddy_test_objc_4
//
//  Created by Çağlar Uslu on 24.05.2019.
//  Copyright © 2019 Çağlar Uslu. All rights reserved.
//

#import "ViewController.h"
#import "DriveBuddySDK-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [DriveBuddy authenticateWithSDKKey:@"YOUR_SDK_KEY" username:@"A_UNIQUE_USERNAME" firstName:nil lastName:nil email:nil phone:nil :^(BOOL authenticated) {
        
        if (authenticated){
            
            [DriveBuddy enableWithAutomaticDrivingDetection:NO :^(BOOL enabled) {
                
                if (enabled){
                    
                    NSLog(@"Enabled");
                    // It is now safe to call startDrivingActivity
                    
                }
                
            }];
            
        }
        
    }];
}

- (IBAction)startButtonClicked:(id)sender {
    
    [DriveBuddy startDrivingActivity:^(BOOL started) {
        if(started){
            NSLog(@"Driving activity is started");
        }
    }];
    
}


- (IBAction)stopButtonClicked:(id)sender {
    
    [DriveBuddy stopDrivingActivity];
    
}


@end
