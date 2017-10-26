//
//  ALFalseAnnotationView.h
//  ALa4Map
//
//  Created by maoziyue on 2017/10/19.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>

@interface ALFalseAnnotationView : MAAnnotationView

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) UIImage *portrait;

@property (nonatomic, strong) UIView *calloutView;



@end
