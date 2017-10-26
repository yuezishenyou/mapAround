//
//  ALTureAnnotationView.m
//  ALa4Map
//
//  Created by maoziyue on 2017/10/19.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "ALTureAnnotationView.h"
#import "ALCalloutView.h"

#define kw (30)
#define kh (40)

#define kHoriMargin 5.f
#define kVertMargin 5.f

#define kPortraitWidth  50.f
#define kPortraitHeight 50.f

#define kCalloutWidth   150.f
#define kCalloutHeight  50.0



@interface ALTureAnnotationView ()

@property (nonatomic, strong) UIImageView *imageV;

@property (nonatomic, strong) UILabel *nameLab;

@end


@implementation ALTureAnnotationView

- (instancetype)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier]) {
        
        [self setup];
        
    }
    return self;
}


- (void)setup
{
    
    self.bounds = CGRectMake(0, 0, kw, kh);
    
    //self.backgroundColor = [UIColor yellowColor];
    
    self.imageV = [[UIImageView alloc]initWithFrame:self.bounds];
    
    [self addSubview:self.imageV];

}


- (UIImage *)portrait
{
    return self.imageV.image;
}

- (void)setPortrait:(UIImage *)portrait
{
    self.imageV.image = portrait;
}
















- (void)setSelected:(BOOL)selected
{
    [self setSelected:selected animated:NO];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if (self.selected == selected)
    {
        return;
    }
    
    if (selected)
    {
        if (self.calloutView == nil)
        {
            self.calloutView = [[ALCalloutView alloc] initWithFrame:CGRectMake(0, 0, kCalloutWidth, kCalloutHeight)];
            
            
            CGFloat centerX = CGRectGetWidth(self.bounds) / 2.f + self.calloutOffset.x;
            CGFloat centerY = CGRectGetHeight(self.calloutView.bounds) / 2.f + self.calloutOffset.y;
            self.calloutView.center = CGPointMake(centerX, -centerY);
            

            //子控件
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame = CGRectMake(0 , 0, 40, CGRectGetHeight(self.calloutView.bounds) - 10);
            [btn setTitle:@"Test" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
            [btn setBackgroundColor:[UIColor whiteColor]];
            [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
            [self.calloutView addSubview:btn];
            
            UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btn.frame),0, 100,  CGRectGetHeight(self.calloutView.bounds) - 10)];
            name.backgroundColor = [UIColor clearColor];
            name.textColor = [UIColor whiteColor];
            name.text = @"Hello word!";
            [self.calloutView addSubview:name];
            
        }
        
        [self addSubview:self.calloutView];
    }
    else
    {
        [self.calloutView removeFromSuperview];
    }
    
    [super setSelected:selected animated:animated];
}

- (void)btnAction
{
    CLLocationCoordinate2D coorinate = [self.annotation coordinate];
    
    NSLog(@"------{%f, %f}-----", coorinate.latitude, coorinate.longitude);
}












- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL inside = [super pointInside:point withEvent:event];

    if (!inside && self.selected)
    {
        inside = [self.calloutView pointInside:[self convertPoint:point toView:self.calloutView] withEvent:event];
    }
    
    return inside;
}











@end
