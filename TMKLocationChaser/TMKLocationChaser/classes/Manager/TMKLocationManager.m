//
//  TMKLocationManager.m
//  TMKLocationChaser
//
//  Created by ryutamaki on 2014/10/09.
//  Copyright (c) 2014年 Ryu Tamaki. All rights reserved.
//

#import "TMKLocationManager.h"

@implementation TMKLocationManager

static TMKLocationManager* sharedLocationManager = nil;

+ (TMKLocationManager *)sharedLocationManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedLocationManager = [[TMKLocationManager alloc] init];
    });
    return sharedLocationManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        if (nil == _locationManager) {
            _locationManager = [[CLLocationManager alloc] init];
        }
        _locationManager.delegate = self;
        [_locationManager startUpdatingLocation];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    NSLog(@"called   %d", status);
    if (status == kCLAuthorizationStatusNotDetermined) {
        [manager requestWhenInUseAuthorization];
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation*)newLocation fromLocation:(CLLocation*)oldLocation {
    NSLog(@"%@", newLocation);
    NSLog(@"%@", oldLocation);
}

@end
