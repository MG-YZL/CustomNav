//
//  RootNewViewController.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/10/13.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import "RootNewViewController.h"
#import "AppDelegate.h"
#import "RootViewController.h"
#import "DetailPageViewController.h"

@interface RootNewViewController ()

@end

@implementation RootNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitleLable.text = @"home";
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

- (IBAction)oneAction:(UIButton *)sender {
    

    
    
    RootViewController * customNV = [[RootViewController alloc] init];
    customNV.selectedViewController = (UIViewController *)[(NSArray *)[customNV viewControllers] objectAtIndex:1];
    AppDelegate * app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    app.window.rootViewController = customNV;
    
}

- (IBAction)twoAction:(id)sender {
    RootViewController * customNV = [[RootViewController alloc] init];
    customNV.selectedViewController = (UIViewController *)[(NSArray *)[customNV viewControllers] objectAtIndex:2];
    AppDelegate * app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    app.window.rootViewController = customNV;
}

- (IBAction)threeAction:(id)sender {
}
@end
