//
//  DetailPageViewController.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/19.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import "DetailPageViewController.h"
#import "HideHeaderViewController.h"
#import "KJProgressHUD.h"
#import "JQIndicatorView.h"
@interface DetailPageViewController ()
{
    KJProgressHUD * _hud;
    
}

@end

@implementation DetailPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.view.backgroundColor = [UIColor clearColor];
    self.navBackBtn.hidden = YES;
    [self.navRightBtn setTitle:@"指示器" forState:UIControlStateNormal];
    self.navTitleLable.text = @"DetailPage";
    
    UIButton * nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake(50, 200, 50, 30);
    nextBtn.backgroundColor = [UIColor orangeColor];
    [nextBtn addTarget:self action:@selector(nextPageAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    _hud = [[KJProgressHUD alloc]init];
    [_hud showProgressHUD];
    
    
}
- (void)nextPageAction:(UIButton *)sender
{
    HideHeaderViewController * hideVC = [[HideHeaderViewController alloc] init];
    hideVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:hideVC animated:YES];
    
}

-(void)rightButtonAction
{
    [super rightButtonAction];
    
    
//    JQIndicatorView * indicatorView = [[JQIndicatorView alloc] initWithType:nil tintColor:[UIColor orangeColor]];
    JQIndicatorView * indicatorView = [[JQIndicatorView alloc] initWithType:nil];

    indicatorView.center = self.view.center;
    [self.view addSubview:indicatorView];
    [indicatorView startAnimating];
    
    
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
