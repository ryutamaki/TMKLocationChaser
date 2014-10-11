//
//  Location.h
//  TMKLocationChaser
//
//  Created by ryutamaki on 2014/10/12.
//  Copyright (c) 2014年 Ryu Tamaki. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Location : NSManagedObject

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) double speed;
@property (nonatomic) double course;
@property (nonatomic) double altitude;
@property (nonatomic) double floor;
@property (nonatomic) double horizontalAccuracy;
@property (nonatomic) double verticalAccuracy;
@property (nonatomic, retain) NSDate *date;

@end
