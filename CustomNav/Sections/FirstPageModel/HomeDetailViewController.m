//
//  HomeDetailViewController.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/19.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

/**
 *  获得验证码
 *
 *  @param nonatomic 图片，视图
 *  @param strong
 *
 *  @return
 */
#import "HomeDetailViewController.h"

@interface HomeDetailViewController ()
@property (nonatomic, strong)UIImageView * aImageView; //背景图
@property (nonatomic, strong)UILabel * captchaLable;   //验证码
@property (nonatomic, strong)NSTimer * timer;
@property (nonatomic, assign)NSInteger time;

@end

@implementation HomeDetailViewController
@synthesize timer;
@synthesize time;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitleLable.text  = @"homeDetail";
    self.backTitleLable.text = @"返回";
    [self.view addSubview:self.aImageView];
    [self.aImageView addSubview:self.captchaLable];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(getCaptchaAction)];
    [self.captchaLable addGestureRecognizer:tap];
    
    
    
    [self layoutPageSubviews];

    
}
- (void)layoutPageSubviews
{
    self.aImageView.frame = CGRectMake(100, 100, 100, 30);
    self.captchaLable.frame = CGRectMake(0, 0, 100, 30);
}
/**
 *  获取验证码
 */
- (void)getCaptchaAction
{
    NSLog(@"获取验证码");
    [self.view endEditing:YES];
    [timer invalidate];
    time = 60;
    //获取验证码
    _captchaLable.userInteractionEnabled = NO;
    
    timer= [NSTimer  scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTime) userInfo:nil repeats:YES];

    
}
/**
 *  验证码时间的倒计时
 */
///Users/laoshilaile/Desktop/Demo/CustomNav/CustomNav/image.bundle/nav_image
- (void)onTime{
    time--;
    NSLog(@"----%ld",(long)time);
//    m_GetYzmButton.selected=YES;
    NSString *timeString = [NSString stringWithFormat:@"%ld秒后重发",(long)time];
    _aImageView.image = [UIImage imageNamed:@"yanzhengma_2"];
    _captchaLable.text = timeString;
//    [m_GetYzmButton setEnabled:NO];
    if (time <= 0) {
        _aImageView.image = [UIImage imageNamed:@"image.bundle/nav_image/yanzhengma"];
        _captchaLable.text = @"获取验证码";
//        m_GetYzmButton.selected=NO;
//        [m_GetYzmButton setEnabled:YES];
        [timer invalidate];
        time=60;
        _captchaLable.userInteractionEnabled = YES;
    }
}
/**
 *  返回到上一个页面的方法
 */
- (void)backButtonAction
{
    [super backButtonAction];
    [timer invalidate];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  getter方法
 *
 *  @return 返回视图
 */
- (UIImageView *)aImageView
{
    if (!_aImageView) {
        _aImageView = [UIImageView new];
        _aImageView.image = [UIImage imageNamed:@"image.bundle/nav_image/yanzhengma"];
        _aImageView.userInteractionEnabled = YES;
    }
    return _aImageView;
}
-(UILabel *)captchaLable
{
    if (!_captchaLable) {
        _captchaLable = [UILabel new];
        _captchaLable.backgroundColor = [UIColor clearColor];
        _captchaLable.text = @"获取验证码";
        _captchaLable.textColor = [UIColor whiteColor];
        _captchaLable.textAlignment = NSTextAlignmentCenter;
        _captchaLable.font = [UIFont systemFontOfSize:15.0];
        _captchaLable.userInteractionEnabled = YES;
    }
    return _captchaLable;
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
