//
//  CityPageViewController.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/31.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import "CityPageViewController.h"
#import "CityChooseViewController.h"
@interface CityPageViewController ()

@end

@implementation CityPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitleLable.text = @"City";
    self.navBackBtn.hidden = YES;
    UIButton * nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake(50, 200, 100, 30);
    nextBtn.backgroundColor = [UIColor orangeColor];
    [nextBtn setTitle:@"城市页面" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextPageAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
}

/**
 *  点击进去下一个界面
 *
 *  @param sender button
 */
- (void)nextPageAction:(UIButton *)sender
{
    CityChooseViewController * cityChooseVC = [[CityChooseViewController alloc] init];
    cityChooseVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cityChooseVC animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
