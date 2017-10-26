//
//  HHBaseController.h
//  ALa4Map
//
//  Created by maoziyue on 2017/10/18.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHBaseController : UIViewController
{
    CGFloat width ;
    CGFloat height ;
}


@property (nonatomic, strong) MAMapView *mapView;

- (void)setupMap;

- (CGFloat)gdistanceBetween:(CLLocationCoordinate2D)coordinateA and:(CLLocationCoordinate2D)coordinateB;;


@end
