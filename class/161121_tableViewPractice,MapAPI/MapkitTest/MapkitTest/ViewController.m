//
//  ViewController.m
//  MapkitTest
//
//  Created by david on 2016. 11. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "Annotaion.h"

@interface ViewController ()<CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *map;
@property CLLocationManager *locationManager;
@property CLLocationCoordinate2D coordinate;
@property MKCoordinateSpan span;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //좌표
    self.coordinate = CLLocationCoordinate2DMake(37.5754, 126.9769);
    

    //반경
    self.span = MKCoordinateSpanMake(0.5, 0.5);
    //어떤지역 (좌표의 지점 센터, 반경)
    MKCoordinateRegion region = MKCoordinateRegionMake(_coordinate, _span);
    [self.map setRegion:region];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
    
    [self.map setShowsUserLocation:YES];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *nowLocation = locations.lastObject;
    
    CLLocationDegrees latitude = nowLocation.coordinate.latitude;
    CLLocationDegrees longitude = nowLocation.coordinate.longitude;
    
    CLLocationCoordinate2D region = CLLocationCoordinate2DMake(latitude, longitude);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
    
    [self.map setRegion:MKCoordinateRegionMake(region, span)];
    
    [self.locationManager stopUpdatingHeading];
    
    Annotaion *anno = [[Annotaion alloc] initWithTitle:@"myPosition"
                                         AndCoordinate:region];
    [self.map addAnnotation:anno];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
