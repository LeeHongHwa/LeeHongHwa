//
//  ViewController.m
//  MapkitTest
//
//  Created by david on 2016. 11. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>


@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *map;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //좌표
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(37.5754, 126.9769);
    //반경
    MKCoordinateSpan span = MKCoordinateSpanMake(0.5, 0.5);
    //어떤지역 (좌표의 지점 센터, 반경)
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    [self.map setRegion:region];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
