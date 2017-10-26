//
//  ViewController.m
//  ALa4Map
//
//  Created by maoziyue on 2017/10/18.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tbView;

@property (nonatomic,copy) NSArray *dataSource;

@property (nonatomic,copy) NSArray *vcArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"vc";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initData];
    
    [self initSubViews];
    
}


- (void)initData
{
    self.dataSource = @[
                        @"1-显示地图",
                        @"2-显示定位",
                        @"3-圆形覆盖",
                        @"4-设定变界",
                        @"5-转动动画",
                        @"6-绘图",
                        @"7-圈里圈外",
                        
                        ];
    
    
    self.vcArray = @[
                     @"HHMainController",
                     @"HHViewController2",
                     @"HHViewController3",
                     @"HHViewController4",
                     @"HHViewController5",
                     @"HHViewController6",
                     @"HHViewController7",
                     ];
    
}

- (void)initSubViews
{
    self.tbView = [[UITableView alloc]initWithFrame:CGRectMake(0, kNAVIGATION_HEIGHT, kScreenW, kScreenH - kNAVIGATION_HEIGHT) style:UITableViewStylePlain];
    
    self.tbView.delegate = self;
    
    self.tbView.dataSource = self;
    
    self.tbView.rowHeight = 70;
    
    [self.view addSubview:self.tbView];
    
}


#pragma mark ----delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    NSString *vcStr = self.vcArray[indexPath.row];
    
    Class cl = NSClassFromString(vcStr);
    
    UIViewController *vc = [[cl alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}













@end
