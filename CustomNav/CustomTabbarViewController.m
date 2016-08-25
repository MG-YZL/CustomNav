//
//  CustomTabbarViewController.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/19.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import "CustomTabbarViewController.h"

@interface CustomTabbarViewController ()

@end

@implementation CustomTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = VIEW_CONTROLLER_BG_COLOR;
    self.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    
    self.isShowBackImageView = YES;
    self.isShowBackTitleLable = NO;
    
    //左边Button
    self.navBackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.navBackBtn.frame = CGRectMake(0, 0, 71, 44);
    self.navBackBtn.backgroundColor = [UIColor clearColor];
    [self.navBackBtn addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navBackBtn addSubview:self.backIamgeView];
    [self.navBackBtn addSubview:self.backTitleLable];
    [self layoutPageSubviews];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.navBackBtn];
//    self.tabBarController.navigationItem.leftBarButtonItem =
    
    //右边Button
    //    UIView * rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 71, 44)];
    
    self.navRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.navRightBtn.frame = CGRectMake(0, 0, 71, 44);
    self.navRightBtn.backgroundColor = [UIColor clearColor];
    [self.navRightBtn addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.navRightBtn];
    
    self.navRightTitleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 71, 44)];
    self.navRightTitleLable.backgroundColor = [UIColor clearColor];
    self.navRightTitleLable.textColor = [UIColor whiteColor];
    self.navRightTitleLable.textAlignment = NSTextAlignmentRight;
    
    self.navRightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_navRightBtn.frame.size.width - 24, (44 - 23) / 2.0, 24, 23)];
    self.navRightImageView.backgroundColor = [UIColor clearColor];
    //    self.navRightImageView.image = [UIImage imageNamed:@""];
    
    [self.navRightBtn addSubview:self.navRightTitleLable];
    [self.navRightBtn addSubview:self.navRightImageView];
    
    
    //中间title
    self.navTitleLable = [[UILabel alloc] initWithFrame:CGRectMake((ScreenWidth-240)/2, 0, 240, 44)];
    self.navTitleLable.textAlignment = NSTextAlignmentCenter;
    self.navTitleLable.textColor = [UIColor whiteColor];
    self.navTitleLable.text = @"";
    self.navTitleLable.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = self.navTitleLable;
    
    
    //    if (isIOS7) {
    //        [self setNeedsStatusBarAppearanceUpdate];
    //    }
    //    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    //UI会上移动44的位置，
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;//UIRectEdgeAll
        //self.navigationController.navigationBar.translucent = NO;
    }
    
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage: forBarPosition: barMetrics:)]){
        UIImage *backgroundImage = [UIImage imageNamed:@"ios7_nav_bg"];
        [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
    } else if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]){
        UIImage *backgroundImage = [UIImage imageNamed:@"nav_bg"];
        [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    }
    
    
    


}
- (void)layoutPageSubviews
{
    self.backIamgeView.frame = CGRectMake(0, (44 - 18) / 2.0, 11, 18);
    self.backTitleLable.frame = CGRectMake(13, _backIamgeView.frame.origin.y, 65, _backIamgeView.frame.size.height);
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    if (self.isShowBackTitleLable) {
        if (self.isShowBackImageView) {
            self.backIamgeView.hidden = NO;
            [self layoutPageSubviews];
            
            
        }else{
            self.backIamgeView.hidden = YES;
            self.backTitleLable.frame = CGRectMake(0, _backIamgeView.frame.origin.y, 65, _backIamgeView.frame.size.height);
            
        }
    }else{
        self.backIamgeView.hidden = NO;
        [self layoutPageSubviews];
    }
}
#pragma mark - backAction
- (void)rightButtonAction
{
    NSLog(@"Right....");
}
- (void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
-(BOOL)prefersStatusBarHidden
{
    return NO;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
    
}

-(UIImageView *)backIamgeView
{
    if (!_backIamgeView) {
        _backIamgeView = [UIImageView new];
        _backIamgeView.backgroundColor = [UIColor clearColor];
        _backIamgeView.image = [UIImage imageNamed:@"back"];
        
    }
    return _backIamgeView;
    
}
-(UILabel *)backTitleLable
{
    if (!_backTitleLable) {
        _backTitleLable = [UILabel new];
        _backTitleLable.text = @"";
        _backTitleLable.textColor = [UIColor whiteColor];
        _backTitleLable.backgroundColor = [UIColor clearColor];
        _backTitleLable.textAlignment = NSTextAlignmentLeft;
        
        _backTitleLable.font = [UIFont systemFontOfSize:14.0];
        
    }
    return _backTitleLable;
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
