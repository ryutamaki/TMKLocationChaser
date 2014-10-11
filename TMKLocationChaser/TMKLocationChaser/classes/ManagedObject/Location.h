//
//  Location.h
//  TMKLocationChaser
//
//  Created by ryutamaki on 2014/10/12.
//  Copyright (c) 2014年 Ryu Tamaki. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <CoreLocation/CoreLocation.h>

@interface Location : NSManagedObject

@property (nonatomic) CLLocationDegrees latitude;
@property (nonatomic) CLLocationDegrees longitude;
@property (nonatomic) CLLocationSpeed speed;
@property (nonatomic) CLLocationDirection course;
@property (nonatomic) CLLocationDistance altitude;
@property (nonatomic) NSInteger floor;
@property (nonatomic) CLLocationAccuracy horizontalAccuracy;
@property (nonatomic) CLLocationAccuracy verticalAccuracy;
@property (nonatomic, retain) NSDate *date;

@end
