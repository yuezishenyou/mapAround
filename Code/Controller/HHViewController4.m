//
//  HHViewController4.m
//  ALa4Map
//
//  Created by maoziyue on 2017/10/18.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHViewController4.h"

@interface HHViewController4 ()<MAMapViewDelegate>

@property (nonatomic, strong) NSMutableArray *overlays;

@property (nonatomic, assign) MACoordinateRegion boundary;


@end

@implementation HHViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设定变界";
    
    
    [self setupMap];
    
    
    [self initBoundaryOberlay];
    

}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self.mapView addOverlays:self.overlays];

    //不要在viewwillappear设置
    [self.mapView setLimitRegion:self.boundary];
    
}




- (void)initBoundaryOberlay
{
    
    self.overlays = [NSMutableArray array];
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(31.232155,121.365567);
    
    _boundary = MACoordinateRegionMakeWithDistance(coordinate, 1000, 1000);
    
    MAMapRect mapRect = MAMapRectForCoordinateRegion(_boundary);
    
    MAMapPoint points[5];
    
    points[0].x = mapRect.origin.x;
    points[0].y = mapRect.origin.y;
    
    points[1].x = mapRect.origin.x;
    points[1].y = mapRect.origin.y + mapRect.size.height;
    
    points[2].x = mapRect.origin.x + mapRect.size.width;
    points[2].y = mapRect.origin.y + mapRect.size.height;;
    
    points[3].x = mapRect.origin.x + mapRect.size.width;;
    points[3].y = mapRect.origin.y;
    
    points[4].x = mapRect.origin.x;
    points[4].y = mapRect.origin.y;
    
    MAPolyline *polyline = [MAPolyline polylineWithPoints:points count:5];
    [self.overlays addObject:polyline];
    
    
}

- (void)mapView:(MAMapView *)mapView didAddOverlayRenderers:(NSArray *)overlayRenderers
{
    NSLog(@"renderers :%@", overlayRenderers);
}


- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id<MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MAPolyline class]]) {
        
        MAPolylineRenderer *polylineView = [[MAPolylineRenderer alloc]initWithPolyline:overlay];
        
        polylineView.lineWidth = 6.f;
        
        polylineView.strokeColor = [UIColor redColor];
        
        return polylineView;
    }
    return nil;
}












@end
