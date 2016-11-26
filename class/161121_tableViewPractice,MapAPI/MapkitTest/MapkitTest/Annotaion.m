//
//  Annotaion.m
//  MapkitTest
//
//  Created by david on 2016. 11. 24..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Annotaion.h"

@interface Annotaion()

@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;

@end

@implementation Annotaion

- (instancetype)initWithTitle:(NSString *)title AndCoordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    if (self)
    {
        self.title = title;
        self.coordinate = coordinate;
    }
    return self;
}

@end
