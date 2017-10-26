//
//  HHViewController5.m
//  ALa4Map
//
//  Created by maoziyue on 2017/10/18.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHViewController5.h"
#import "JTBorderDotAnimation.h"

@interface HHViewController5 ()<UITextFieldDelegate>
{
    NSInteger _code;
    BOOL isSwitch;
}
@property (nonatomic, strong) UIImageView *imageV;

@property (nonatomic, strong) NSTimer * time;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) JTBorderDotAnimation *borderAnimation;

@property (nonatomic, strong) CAAnimationGroup *groups;

@property (nonatomic, strong) UIView *squareView;//




@end

@implementation HHViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"转动动画";
    
    _code = 1;
    isSwitch = NO;
    
    [self initSubViews];
    
    self.time = [NSTimer scheduledTimerWithTimeInterval:3.f target:self selector:@selector(animat) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.time forMode:NSRunLoopCommonModes];
    
    [self.time fire];
    
    
}

- (void)initSubViews
{
    //
    self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(100, 150, 30, 30 )];
    [self.view addSubview:self.imageV];
    
    //
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 260, width - 40, 60)];
    self.textField.placeholder = @"请输入";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
    
    self.borderAnimation = [[JTBorderDotAnimation alloc]init];
    self.borderAnimation.animatedView = self.textField;
    self.borderAnimation.numberPoints = 1;
    self.borderAnimation.pointColor = [UIColor lightGrayColor];
    

    //正方形
    self.squareView = [[UIView alloc]init];
    
    self.squareView.frame = CGRectMake(20, 400, width - 40, 100);
    
    self.squareView.layer.borderWidth = 3.f;
    
    self.squareView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    
    [self.view addSubview:self.squareView];
    
    
}


- (CAAnimationGroup *)groups {
    if (!_groups) {
        // 缩放动画
        CABasicAnimation * scaleAnim = [CABasicAnimation animation];
        scaleAnim.keyPath = @"transform.scale";
        scaleAnim.autoreverses = YES;
        scaleAnim.fromValue = @0.3;
        scaleAnim.toValue = @1;
        scaleAnim.duration = 3;
        // 透明度动画
        CABasicAnimation *opacityAnim=[CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnim.fromValue= @1;
        opacityAnim.toValue= @0.3;
        opacityAnim.duration= 3;
        // 创建动画组
        _groups =[CAAnimationGroup animation];
        _groups.animations = @[scaleAnim,opacityAnim];
        _groups.removedOnCompletion = NO;
        _groups.fillMode = kCAFillModeForwards;
        _groups.duration = 3;
        _groups.repeatCount = FLT_MAX;
    }
    return _groups;
}




- (void)animat
{
    
//    isSwitch = !isSwitch;
//
//    if (isSwitch)
//    {
//        [UIView animateWithDuration:3.f animations:^{
//            self.squareView.layer.borderColor = [UIColor lightGrayColor].CGColor;
//        }];
//
//    }
//    else
//    {
//        [UIView animateWithDuration:3.f animations:^{
//            self.squareView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
//        }];
//
//    }
    
    
    
    

     _imageV.alpha = 0.2f;
    [UIView animateWithDuration:3.f animations:^{
        _imageV.alpha = 1.f;
    } completion:^(BOOL finished) {
     
    }];
    
    _code = _code % 3 + 1;
    switch (_code) {
        case 1:
        {
           [_imageV setImage:[UIImage imageNamed:@"1"]];
        }
            break;
        case 2:
        {
            [_imageV setImage:[UIImage imageNamed:@"01"]];
        }
            break;
        case 3:
        {
            [_imageV setImage:[UIImage imageNamed:@"001"]];
        }
            break;
            
        default:
            break;
    }

}





- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.borderAnimation stop];
    [self.textField resignFirstResponder];
}


#pragma mark ---delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self.borderAnimation start];
    return YES;
}













@end
