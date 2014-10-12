//
//  ViewController.m
//  TMKLocationChaser
//
//  Created by ryutamaki on 2014/10/09.
//  Copyright (c) 2014年 Ryu Tamaki. All rights reserved.
//

#import "MainViewController.h"
#import "TMKLocationManager.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startChasingLocation:(id)sender {
    TMKLocationManager *locationManager = [TMKLocationManager sharedLocationManager];
    if (locationManager.isChasing) {
        UIAlertView *alertView =[[UIAlertView alloc] initWithTitle:@"!!"
                                                           message:@"It has already started chasing"
                                                          delegate:nil
                                                 cancelButtonTitle:@"ok"
                                                 otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    // start chasing location if it has not started chasing
    [locationManager startChasingLocation];
}

- (IBAction)stopChasingLocation:(id)sender {
    TMKLocationManager *locationManager = [TMKLocationManager sharedLocationManager];
    if (!locationManager.isChasing) {
        UIAlertView *alertView =[[UIAlertView alloc] initWithTitle:@"!!"
                                                           message:@"It has not started chasing"
                                                          delegate:nil
                                                 cancelButtonTitle:@"ok"
                                                 otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    // stop chasing location if it has already started chasing
    [locationManager stopChasingLocation];
}

@end
