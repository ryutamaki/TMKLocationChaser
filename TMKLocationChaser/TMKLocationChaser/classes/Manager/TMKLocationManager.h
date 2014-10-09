//
//  TMKLocationManager.h
//  TMKLocationChaser
//
//  Created by ryutamaki on 2014/10/09.
//  Copyright (c) 2014年 Ryu Tamaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface TMKLocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager *locationManager;


+ (TMKLocationManager *)sharedLocationManager;

@end
