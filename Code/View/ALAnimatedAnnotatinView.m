//
//  ALAnimatedAnnotatinView.m
//  ALa4Map
//
//  Created by maoziyue on 2017/10/20.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "ALAnimatedAnnotatinView.h"

#define kw (44)   //44
#define kh (72)   //72

@implementation ALAnimatedAnnotatinView

- (instancetype)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier]) {
        
        NSLog(@"---%@---",NSStringFromCGRect(self.bounds));
        
        self.bounds = CGRectMake(0, 0, kw, kh);
        
        //self.backgroundColor = [UIColor lightGrayColor];
        
        [self setup];
        
    }
    
    return self;
}


- (void)setup
{
    
    self.imageV = [[UIImageView alloc]initWithFrame:self.bounds];

    [self addSubview:self.imageV];
    
}
















@end
