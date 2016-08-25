//
//  HideHeaderViewController.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/20.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import "HideHeaderViewController.h"
#import "ReplyCell.h"

@interface HideHeaderViewController ()
@property (nonatomic ,strong)UITableView * tableView;

@end

@implementation HideHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.evalContentView = [[EvalInputContentView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50) superView:self.view];
    
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bgImageView];
    [self.bgImageView addSubview:self.navgationBgImageView];
    [self.bgImageView addSubview:self.backBtn];
    
    
    [self layoutPageSubviews];
    
    
    
}
- (void)layoutPageSubviews
{
    CGFloat navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    self.bgImageView.frame = CGRectMake(0, 0, ScreenWidth, navigationBarHeight + OffsetHeight);
    self.navgationBgImageView.frame = CGRectMake(0, 0, ScreenWidth, navigationBarHeight + OffsetHeight);
    self.backBtn.frame = CGRectMake(0, OffsetHeight, 51, navigationBarHeight);
    self.tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
#pragma mark - 实现代理中的方法
- (void)getReplyAction
{
    NSLog(@"实现代理中的方法");
    [self.evalContentView createBgBaseView:@"回复"];
    [self.evalContentView.contentTextView becomeFirstResponder];
    
    
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 19;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = @"cell";
    ReplyCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[ReplyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.delegate = self;
//    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}
#pragma mark - UITableViewDelegate
#pragma mark - HeaderView
- (UIView *)getHeaderView
{
    UIImageView * headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
    headerView.backgroundColor = [UIColor greenColor];
    
    return headerView;
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint contentOffset = scrollView.contentOffset;
    NSLog(@" contentOffset.x = %f , contentOffset.y = %f",contentOffset.x,contentOffset.y);
    CGFloat offset_height = contentOffset.y;
//    CGFloat navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    if (offset_height > 0) {
        CGFloat alpha = offset_height / (200 - (44 + OffsetHeight));
        if (alpha > 1) {
            alpha = 1.0;
        }
        if (alpha == 1.0) {
            
        }
        self.navgationBgImageView.alpha = alpha;
        self.navgationBgImageView.backgroundColor = [UIColor whiteColor];
    }else{
        self.navgationBgImageView.alpha = 0;
        self.navgationBgImageView.backgroundColor = [UIColor whiteColor];
        
    }
    
}

#pragma mark - backAction
- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [UIImageView new];
        _bgImageView.backgroundColor = [UIColor clearColor];
        _bgImageView.userInteractionEnabled = YES;
        
    }
    return _bgImageView;
    
}
-(UIImageView *)navgationBgImageView
{
    if (!_navgationBgImageView) {
        _navgationBgImageView = [UIImageView new];
        _navgationBgImageView.backgroundColor = [UIColor clearColor];
        _navgationBgImageView.userInteractionEnabled = YES;
        _navgationBgImageView.alpha = 0;
    }
    return _navgationBgImageView;
    
}
-(UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.backgroundColor = [UIColor grayColor];
        [_backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = [self getHeaderView];
        
    }
    return _tableView;
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
