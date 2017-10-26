//
//  HHMainController.m
//  ALa4Map
//
//  Created by maoziyue on 2017/10/18.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHMainController.h"

@interface HHMainController ()<MAMapViewDelegate>

@property (nonatomic, strong) MAMapView *mapView;

@end

@implementation HHMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"显示地图";
    
    [self setupMap];
    
}

- (void)setupMap
{
    self.mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    
    self.mapView.delegate = self;
    
    self.mapView.showsUserLocation = YES;
    
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    self.mapView.zoomLevel = 16.5;
    
    [self.view addSubview:self.mapView];
    [self.view sendSubviewToBack:self.mapView];
}


- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    // 31.232155   121.365567
    CGFloat lat = userLocation.location.coordinate.latitude;
    CGFloat lon = userLocation.location.coordinate.longitude;
    NSLog(@"---(%f,%f)---",lat,lon);
    
}




@end
