//
//  HHViewController3.m
//  ALa4Map
//
//  Created by maoziyue on 2017/10/18.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHViewController3.h"

@interface HHViewController3 ()<MAMapViewDelegate>

@property (nonatomic, strong) NSMutableArray *circles;

@end

@implementation HHViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"圆形";
    
    [self setupMap];
    
    self.mapView.delegate = self;
    
    [self initCircles];
    
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.mapView addOverlays:self.circles];
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(31.232155,121.365567);
    
    MACoordinateRegion regoin = MACoordinateRegionMakeWithDistance(coordinate, 1000, 1000);
    
    [self.mapView setRegion:regoin animated:YES];

}


- (void)initCircles
{
    self.circles = [[NSMutableArray alloc]init];
    
    MACircle *circle = [MACircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(31.232155,121.365567) radius:500];
    
    [self.circles addObject:circle];

}



#pragma mark ----delegate
- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id<MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MACircle class]]) {
        
        MACircleRenderer *circleRenderer = [[MACircleRenderer alloc]initWithOverlay:overlay];
        
        circleRenderer.lineWidth = 3.f;
        circleRenderer.strokeColor = [UIColor blueColor];
        
        circleRenderer.fillColor = [[UIColor redColor]colorWithAlphaComponent:0.1];
        
        return circleRenderer;
        
    }
    
    return nil;
}










@end
