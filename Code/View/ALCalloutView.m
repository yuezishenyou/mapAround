//
//  ALCalloutView.m
//  ALa4Map
//
//  Created by maoziyue on 2017/10/20.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "ALCalloutView.h"
#import <QuartzCore/QuartzCore.h>

#define kArrorHeight    10

@implementation ALCalloutView

- (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    
    [self drawInContext:UIGraphicsGetCurrentContext()];
    
    self.layer.shadowColor = [[UIColor whiteColor] CGColor];
    //self.layer.shadowOpacity = 1.0;
    //self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
}


- (void)drawInContext:(CGContextRef)context
{
    
    CGContextSetLineWidth(context, 2.0);
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.4].CGColor);

    
    [self getDrawPath:context];
    
    CGContextFillPath(context);
    
}

- (void)getDrawPath:(CGContextRef)context
{
    CGRect rrect = self.bounds;
    CGFloat radius = 3.0;
    CGFloat minx = CGRectGetMinX(rrect),
    midx = CGRectGetMidX(rrect),
    maxx = CGRectGetMaxX(rrect);
    CGFloat miny = CGRectGetMinY(rrect),
    maxy = CGRectGetMaxY(rrect) - kArrorHeight;
    
    CGContextMoveToPoint(context, midx + kArrorHeight, maxy);
    CGContextAddLineToPoint(context,midx, maxy + kArrorHeight);
    CGContextAddLineToPoint(context,midx - kArrorHeight, maxy);
    
    CGContextAddArcToPoint(context, minx, maxy, minx, miny, radius);
    CGContextAddArcToPoint(context, minx, minx, maxx, miny, radius);
    CGContextAddArcToPoint(context, maxx, miny, maxx, maxx, radius);
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    CGContextClosePath(context);
}












@end
