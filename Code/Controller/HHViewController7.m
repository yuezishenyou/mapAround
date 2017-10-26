//
//  HHViewController7.m
//  ALa4Map
//
//  Created by maoziyue on 2017/10/18.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHViewController7.h"
#import "ALTrueAnnotation.h"
#import "ALTureAnnotationView.h"
#import "ALFalseAnnotation.h"
#import "ALFalseAnnotationView.h"
#import "ALAnimatedAnnotation.h"
#import "ALAnimatedAnnotatinView.h"


@interface HHViewController7 ()<AMapGeoFenceManagerDelegate,MAMapViewDelegate>

@property (nonatomic, strong) AMapGeoFenceManager *geoFenceManager;

@property (nonatomic, strong) MAPointAnnotation *annotation1;

@property (nonatomic, strong) MAPointAnnotation *annotation2;

@property (nonatomic, strong) MAPointAnnotation *annotation3;

@property (nonatomic, strong) MAAnimatedAnnotation *annotation4;

@property (nonatomic, strong) NSMutableArray *circles;

@end

@implementation HHViewController7

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"地理围栏";
    
    [self setupMap];
    
    //[self setupFence];
    
    [self initAnnotation];
    
    [self initCircles];
    
    
}

- (void)setupMap
{
    self.mapView = [[MAMapView alloc]initWithFrame:self.view.bounds];
    
    self.mapView.delegate = self;
    
    self.mapView.zoomLevel = 16.5;
    
    [self.view addSubview:self.mapView];
    
    [self.view sendSubviewToBack:self.mapView];
    
}





- (void)initAnnotation
{
    CLLocationCoordinate2D c2d =  CLLocationCoordinate2DMake(31.196457,121.289531);
    
    CLLocationCoordinate2D coordinate1 = CLLocationCoordinate2DMake(31.196457,121.289531);
    
    CLLocationCoordinate2D coordinate2 = CLLocationCoordinate2DMake(31.190457,121.289531);
    
    CLLocationCoordinate2D coordinate3 = CLLocationCoordinate2DMake(31.198457,121.289531);
    
    CLLocationCoordinate2D coordinate4 = CLLocationCoordinate2DMake(31.196457,121.286531);
    
    CGFloat dis1 = [self gdistanceBetween:c2d and:coordinate1];
    CGFloat dis2 = [self gdistanceBetween:c2d and:coordinate2];
    CGFloat dis3 = [self gdistanceBetween:c2d and:coordinate3];
    CGFloat dis4 = [self gdistanceBetween:c2d and:coordinate4];
    
    [self setupAnnotation:dis1 coordinate:coordinate1];
    [self setupAnnotation:dis2 coordinate:coordinate2];
    [self setupAnnotation:dis3 coordinate:coordinate3];
    [self setupAnimatedAnnotation:dis4 coordinate:coordinate4];
    
    
}

- (void)setupAnimatedAnnotation:(CGFloat)distance coordinate:(CLLocationCoordinate2D)coordinate
{
    if (distance > 500)
    {
       
    }
    else
    {
        ALAnimatedAnnotation *tureAnnotation = [[ALAnimatedAnnotation alloc]init];
        tureAnnotation.coordinate = coordinate;
        tureAnnotation.title = [NSString stringWithFormat:@"-(%f)-",distance];
        [self.mapView addAnnotation:tureAnnotation];
    }
}

- (void)setupAnnotation:(CGFloat)distance coordinate:(CLLocationCoordinate2D)coordinate
{
    if (distance > 500)
    {
        ALFalseAnnotation *falseAnnotation = [[ALFalseAnnotation alloc]init];
        falseAnnotation.coordinate = coordinate;
        falseAnnotation.title = [NSString stringWithFormat:@"-(%f)-",distance];
        [self.mapView addAnnotation:falseAnnotation];
    }
    else
    {
        ALTrueAnnotation *tureAnnotation = [[ALTrueAnnotation alloc]init];
        tureAnnotation.coordinate = coordinate;
        tureAnnotation.title = [NSString stringWithFormat:@"-(%f)-",distance];
        [self.mapView addAnnotation:tureAnnotation];
    }
}










- (void)initCircles
{
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(31.196457,121.289531);
    
    self.circles = [[NSMutableArray alloc]init];
    
    MACircle *circle = [MACircle circleWithCenterCoordinate:coordinate radius:500];
    
    [self.circles addObject:circle];
    
    [self.mapView addOverlays:self.circles];
    

    
    MACoordinateRegion regoin = MACoordinateRegionMakeWithDistance(coordinate, 1000, 1000);
    
    [self.mapView setRegion:regoin animated:YES];
    
    
    
}





#pragma mark ----delegate
- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id<MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MACircle class]]) {
        
        MACircleRenderer *circleRenderer = [[MACircleRenderer alloc]initWithOverlay:overlay];
        
        circleRenderer.lineWidth = 3.f;
        circleRenderer.strokeColor = [UIColor blueColor];
        
        circleRenderer.fillColor = [UIColor clearColor];
        
        return circleRenderer;
    }
    
    return nil;
}


- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    //自定义
    if ([annotation isKindOfClass:[ALTrueAnnotation class]]) {
        
        static NSString *pointIdentifier = @"pointIdentifier1";
        
        ALTureAnnotationView *annotationView = (ALTureAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pointIdentifier];
        if (annotationView == nil) {
            annotationView = [[ALTureAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:pointIdentifier];
        }
        
        annotationView.canShowCallout = NO;
        annotationView.draggable = NO;
        annotationView.portrait = [UIImage imageNamed:@"little_car"];
        //annotationView.selected = YES;
    
        return annotationView;
    }
    
    
    
  
    if ([annotation isKindOfClass:[ALFalseAnnotation class]]) {
        
        static NSString *pointIdentifier = @"pointIdentifier2";
        
        ALFalseAnnotationView *annotationView = (ALFalseAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pointIdentifier];
        if (annotationView == nil) {
            annotationView = [[ALFalseAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:pointIdentifier];
        }
    
        annotationView.canShowCallout = NO;
        annotationView.draggable = NO;
        annotationView.portrait = [UIImage imageNamed:@"sscar"];
        
        return annotationView;
    }
    
    //没有自定义
    if ([annotation isKindOfClass:[ALAnimatedAnnotation class]]) {
        
        static NSString *pointIdentifier = @"pointIdentifier3";
        
        ALAnimatedAnnotatinView *annotationView = (ALAnimatedAnnotatinView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pointIdentifier];
        if (annotationView == nil) {
            annotationView = [[ALAnimatedAnnotatinView alloc]initWithAnnotation:annotation reuseIdentifier:pointIdentifier];
        }
        
        annotationView.image = [UIImage imageNamed:@"little_car"];
        return annotationView;
        
    }
    
    
    
    
    
    return nil;
    
}

























- (void)setupFence
{
    self.geoFenceManager = [[AMapGeoFenceManager alloc] init];
    self.geoFenceManager.delegate = self;
    self.geoFenceManager.activeAction = AMapGeoFenceActiveActionInside | AMapGeoFenceActiveActionOutside | AMapGeoFenceActiveActionStayed; //设置希望侦测的围栏触发行为，默认是侦测用户进入围栏的行为，即AMapGeoFenceActiveActionInside，这边设置为进入，离开，停留（在围栏内10分钟以上），都触发回调
    self.geoFenceManager.allowsBackgroundLocationUpdates = YES;  //允许后台定位
    
    
    //31.196457,121.289531
    //31.232155,121.365567
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(31.196457,121.289531);
    
    [self.geoFenceManager addCircleRegionForMonitoringWithCenter:coordinate radius:500 customID:@"circle_1"];
    
}

#pragma mark ----delegate
- (void)amapGeoFenceManager:(AMapGeoFenceManager *)manager didAddRegionForMonitoringFinished:(NSArray<AMapGeoFenceRegion *> *)regions customID:(NSString *)customID error:(NSError *)error
{
    if (error) {
        NSLog(@"创建失败 %@",error);
    } else {
        NSLog(@"创建成功");
    }
}

- (void)amapGeoFenceManager:(AMapGeoFenceManager *)manager didGeoFencesStatusChangedForRegion:(AMapGeoFenceRegion *)region customID:(NSString *)customID error:(NSError *)error {
    if (error) {
        NSLog(@"---error:%@----",error);
    }else{
        NSLog(@"---success:%@----",[region description]);
    }
}



- (void)dealloc
{
    [self.geoFenceManager removeAllGeoFenceRegions];
    //    - (void)removeTheGeoFenceRegion:(AMapGeoFenceRegion *)region; //移除指定围栏
    //    - (void)removeGeoFenceRegionsWithCustomID:(NSString *)customID; //移除指定customID的围栏
    //    - (void)removeAllGeoFenceRegions;  //移除所有围栏
}





@end
