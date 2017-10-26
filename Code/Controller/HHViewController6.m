//
//  HHViewController6.m
//  ALa4Map
//
//  Created by maoziyue on 2017/10/18.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHViewController6.h"

@interface HHViewController6 ()
{
    NSInteger code;
    NSInteger mswitch;
}

@property (nonatomic, strong) UIImageView *imageV;

@property (nonatomic, strong) NSTimer * time;

@end

@implementation HHViewController6

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"呼吸";
    
    [self initSubViews];
    
    code = 0;
    mswitch = -1;
    
    self.time = [NSTimer scheduledTimerWithTimeInterval:2.f target:self selector:@selector(animat) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.time forMode:NSRunLoopCommonModes];
    
    [self.time fire];
    
    
    
}


- (void)initSubViews
{
    
//    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(100, 150, 30, 30 )];
//    v.backgroundColor = [UIColor lightGrayColor];
//    v.center = CGPointMake(width / 2, height / 2);
//    [self.view addSubview:v];
    
    
    self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(100, 150, 30, 30 )];
    self.imageV.center = CGPointMake(width / 2, height / 2);
    self.imageV.image = [UIImage imageNamed:@"001"];
    [self.view addSubview:self.imageV];
    
    
}


- (void)animat
{
   
    
    mswitch  = mswitch * (-1);

    CGFloat wid = self.imageV.bounds.size.width;
    
    
    if (mswitch == -1)
    {
        //NSLog(@"----b----");
        
        [UIView animateWithDuration:2.f animations:^{

            CGRect rect = self.imageV.bounds;
            rect.size.width += 10;
            rect.size.height += 10;
            
            if (rect.size.width == wid) {
                rect.size.width = wid;
                rect.size.height = wid;
            }
            
            self.imageV.bounds = rect;
            self.imageV.alpha = 1.f;
            
            code = code % 3 + 1;
            
            switch (code) {
                case 1:
                    self.imageV.image = [UIImage imageNamed:@"1"];
                    break;
                case 2:
                    self.imageV.image = [UIImage imageNamed:@"01"];
                    break;
                case 3:
                    self.imageV.image = [UIImage imageNamed:@"001"];
                    break;
                    
                default:
                    break;
            }
            

        } completion:^(BOOL finished) {

        }];
    }
    else
    {
        
        //NSLog(@"----a----");
        
        [UIView animateWithDuration:2.f animations:^{

            CGRect rect = self.imageV.bounds;
            rect.size.width -= 10 ;
            rect.size.height -= 20 ;
            
            if (rect.size.width == 20) {
                rect.size.width = 20;
                rect.size.height = 20;
            }
            
            self.imageV.bounds = rect;
            self.imageV.alpha = 0.0f;
            
    
        } completion:^(BOOL finished) {
            
        }];
    }
    

}


























@end
