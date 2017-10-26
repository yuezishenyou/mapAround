//
//  HHBaseController.m
//  ALa4Map
//
//  Created by maoziyue on 2017/10/18.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHBaseController.h"

@interface HHBaseController ()

@end

@implementation HHBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    width = [[UIScreen mainScreen]bounds].size.width;
    height = [[UIScreen mainScreen]bounds].size.height;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
}


- (void)setupMap
{
    self.mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.mapView.showsUserLocation = YES;
    
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    //self.mapView.zoomLevel = 16.5;
    
    //self.mapView.delegate = self;
    
    [self.view addSubview:self.mapView];
    [self.view sendSubviewToBack:self.mapView];
}

- (CGFloat)gdistanceBetween:(CLLocationCoordinate2D)coordinateA and:(CLLocationCoordinate2D)coordinateB
{
    
    
    MAMapPoint pointA = MAMapPointForCoordinate(coordinateA);
    
    MAMapPoint pointB = MAMapPointForCoordinate(coordinateB);
    
    CGFloat dis = 0;
    
    CLLocationDistance distance = MAMetersBetweenMapPoints(pointA,pointB);
    
    dis = distance;
    
    return dis;
}



























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"--xxxx--");
}



@end
