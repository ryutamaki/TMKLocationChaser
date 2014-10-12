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
    }
    return self;
}

- (void)startChasingLocation
{
    [_locationManager startUpdatingLocation];
}

- (void)stopChasingLocation
{
    [_locationManager stopUpdatingLocation];
}


#pragma mark -
#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusNotDetermined) {
        [manager requestWhenInUseAuthorization];
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation*)newLocation fromLocation:(CLLocation*)oldLocation {
    TMKCoreDataManager *coreDataManager = [TMKCoreDataManager sharedCoreDataManager];
    /*
    NSMutableArray *fetchResult = [coreDataManager fetch:@"Location" sortKey:@"date" limit:0];
    NSLog(@"%@", fetchResult);
     */
    Location *location = (Location *)[coreDataManager entityForInsert:@"Location"];
    location.latitude = [NSNumber numberWithDouble:newLocation.coordinate.latitude];
    location.longitude = [NSNumber numberWithDouble:newLocation.coordinate.longitude];
    location.speed = [NSNumber numberWithDouble:newLocation.speed];
    location.course = [NSNumber numberWithDouble:newLocation.course];
    location.floor = [NSNumber numberWithInteger:newLocation.floor.level];
    location.horizontalAccuracy = [NSNumber numberWithDouble:newLocation.horizontalAccuracy];
    location.verticalAccuracy = [NSNumber numberWithDouble:newLocation.verticalAccuracy];
    location.date = newLocation.timestamp;
    NSLog(@"%@", location);

    [coreDataManager saveContext];
}

@end
