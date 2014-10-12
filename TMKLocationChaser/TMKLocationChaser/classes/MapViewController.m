//
//  MapViewController.m
//  TMKLocationChaser
//
//  Created by ryutamaki on 2014/10/12.
//  Copyright (c) 2014年 Ryu Tamaki. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    TMKCoreDataManager *coreDataManager = [TMKCoreDataManager sharedCoreDataManager];
    NSMutableArray *locations = [coreDataManager fetch:@"Location" sortKey:@"date" limit:0];
    [self renderPolyLineWithLocations:locations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Private Methods

- (void)renderPolyLineWithLocations:(NSMutableArray *)locations {
    CLLocationCoordinate2D points[[locations count]];
    for (NSInteger i = 0; i < [locations count]; i++) {
        Location *location = locations[i];
        points[i] = CLLocationCoordinate2DMake(location.latitude.floatValue, location.longitude.floatValue);
    }
    MKPolyline *path = [MKPolyline polylineWithCoordinates:points count:2];
    [self.mapView addOverlay:path];
}


#pragma mark - MKMapViewDelegate

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolylineRenderer *aRenderer = [[MKPolylineRenderer alloc] initWithPolyline:(MKPolyline *)overlay];
        aRenderer.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:0.2];
        aRenderer.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];
        aRenderer.lineWidth = 5;
        return aRenderer;
    }
    return nil;
}

@end
