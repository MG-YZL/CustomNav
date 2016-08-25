//
//  RootViewController.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/19.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import "RootViewController.h"
#import "HomeViewController.h"
#import "DetailPageViewController.h"
#import "CityPageViewController.h"
#import "HideNavBarViewController.h"
#import "RootNewViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navBackBtn.hidden = YES;
    self.homeVC = [[HomeViewController alloc] init];
    _homeVC.title = @"home";
//    _homeVC.hidesBottomBarWhenPushed = YES;
    UINavigationController * nav = [[UINavigationController  alloc] initWithRootViewController:_homeVC];
    
//    RootNewViewController * rootNVC = [RootNewViewController new];
//    rootNVC.title = @"home";
//    rootNVC.hidesBottomBarWhenPushed = YES;
//    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:rootNVC];
    
    self.detailVC = [[DetailPageViewController alloc] init];
    self.detailVC.title = @"Detail";
    UINavigationController * nav1 = [[UINavigationController alloc] initWithRootViewController:_detailVC];
    CityPageViewController * cityVC = [[CityPageViewController alloc] init];
    cityVC.title = @"CityPage";
    UINavigationController * nav2 = [[UINavigationController alloc] initWithRootViewController:cityVC];
    
    HideNavBarViewController * hideVC = [[HideNavBarViewController alloc] init];
    hideVC.tabBarItem.title = @"我的";
    UINavigationController * nav3 = [[UINavigationController alloc] initWithRootViewController:hideVC];

    self.viewControllers = @[nav,nav1,nav2,nav3];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
