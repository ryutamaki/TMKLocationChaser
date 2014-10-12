//
//  MapViewController.h
//  TMKLocationChaser
//
//  Created by ryutamaki on 2014/10/12.
//  Copyright (c) 2014年 Ryu Tamaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "TMKCoreDataManager.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
