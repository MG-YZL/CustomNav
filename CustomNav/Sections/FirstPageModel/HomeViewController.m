//
//  HomeViewController.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/19.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeDetailViewController.h"
#import "SecondViewController.h"
#import "NSString+Methods.h"
#import "UILabel+Methods.h"
#import "HomeNewDetailViewController.h"
#import "CustomAlertView.h"
#import "ZLShareView.h"
@interface HomeViewController ()<CustomAlertViewDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor orangeColor];
    
    self.navBackBtn.hidden = YES;
    self.navTitleLable.text = @"Home";
    self.navRightTitleLable.text = @"发送";
    [self showRequestResultInfo:@"homesadas"];

    UIButton * nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake(50, 200, 50, 30);
    nextBtn.backgroundColor = [UIColor orangeColor];
    [nextBtn addTarget:self action:@selector(nextPageAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    NSString * str  = @"字符串的类目sdadas的方法";
    UILabel * nameLable = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 0, 30)];
    nameLable.backgroundColor = [UIColor clearColor];
    nameLable.text = str;
//    nameLable.textColor = [UIColor redColor];
    nameLable.font = [UIFont fontWithName:nil size:16.0];
    [self.view addSubview:nameLable];
    NSString * str1 = @"类目";
    NSRange moneyRange =[str rangeOfString:@"类目"];

    [nameLable setAttributedChangeStr:str1 color:[UIColor purpleColor]];
//    [nameLable setLabelTextAttributeWithBeginLoaction:0 endLocation:2 fontName:nil fontSize:22.0];
    CGSize size = [nameLable.text getWidthWithFont:[UIFont systemFontOfSize:22.0] height:30];
    NSLog(@"size = %f", size.width);
    nameLable.frame = CGRectMake(nameLable.frame.origin.x, nameLable.frame.origin.y, size.width, nameLable.frame.size.height);
    UIImageView * aIamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 150, 80)];
    
    aIamgeView.image = [Utils getImageById:ICON_LECTURE_QUEST_FAILED directory:IMAGE_IN_DIR_DETAIL_IAMGE];
    [self.view addSubview:aIamgeView];
    
    
    
    
    [self showPredicateResultForZero];
    
    
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    self.navBackBtn.hidden = NO;

}
-(void)rightButtonAction
{
//    CustomAlertView * alertView = [[CustomAlertView alloc] initCustomAlertView];
//    alertView.delegate = self;
//    [alertView showAlert];
    UIWindow * window = [UIApplication sharedApplication].keyWindow;

    ZLShareView * shareView = [[ZLShareView alloc] init];
    [shareView initShowInView:window];
//    [shareView show];
    
    
}
#pragma mark - CustomAlertViewDelegate
- (void)touchBtnForAllowance
{
    NSLog(@"接受");
}



- (void)nextPageAction:(UIButton *)sender
{
//    HomeDetailViewController * detailVC = [HomeDetailViewController new];
//    SecondViewController * secondVC = [SecondViewController new];
    HomeNewDetailViewController * detailVC = [HomeNewDetailViewController new];
    
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
    
}
/**
 *  根据arrayFilter中的内容，找到arrayContents中存在的内容 （使用一次for循环）
 */
- (void)showPredicateResultForOne
{
    
    NSArray *arrayFilter = [NSArray arrayWithObjects:@"pict", @"blackrain", @"ip", nil];
    
    NSArray *arrayContents = [NSArray arrayWithObjects:@"I am a picture.", @"I am a guy", @"I am gagaga", @"ipad", @"iphone", nil];
    
    
    
    int i = 0, count = [arrayFilter count];
    
    for(i = 0; i < count; i ++)
        
    {
        
        NSString *arrayItem = (NSString *)[arrayFilter objectAtIndex:i];
        
        NSPredicate *filterPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", arrayItem];
                                        
        NSLog(@"Filtered array with filter %@, %@", arrayItem, [arrayContents filteredArrayUsingPredicate:filterPredicate]);
                                        
    }
    
    
}
/**
 *  arrayContent过滤出来的就是不包含 arrayFilter中的所有item了  （没有使用for循环）
 */
- (void)showPredicateResultForZero
{
    
    NSArray *arrayFilter = [NSArray arrayWithObjects:@"abc1", @"abc2", nil];
    
    NSMutableArray *arrayContent = [NSMutableArray arrayWithObjects:@"a1", @"abc1", @"abc4", @"abc2", nil];
    
    NSPredicate *thePredicate = [NSPredicate predicateWithFormat:@"NOT (SELF in %@)", arrayFilter];
    
    [arrayContent filterUsingPredicate:thePredicate];
    NSLog(@"arrayContent = %@", arrayContent);
    
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
