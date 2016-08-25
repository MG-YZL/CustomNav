//
//  HideNavBarViewController.m
//  CustomNav
//
//  Created by 杨宗磊 on 16/7/25.
//  Copyright © 2016年 laoshilaile. All rights reserved.
//

#import "HideNavBarViewController.h"
#import "BaseTableViewController.h"
#import "HMSegmentedControl.h"
#import "HideSubPageViewController.h"
#import "CityCell.h"
@interface HideNavBarViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    BOOL _stausBarColorIsBlack;

}
@property (nonatomic, strong)UITableView * tableView;
@property (nonatomic, weak) UIView *navView;
@property (nonatomic, strong) HMSegmentedControl *segCtrl;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, weak) UIViewController *showingVC;
@property (nonatomic, strong) NSMutableDictionary *offsetYDict; // 存储每个tableview在Y轴上的偏移量

@end

@implementation HideNavBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;

    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, headerImgHeight + switchBarHeight)];
    headerView.backgroundColor = [UIColor purpleColor];
    self.tableView = [UITableView new];
    self.tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = headerView;
    
    self.tableView.showsHorizontalScrollIndicator  = NO;

    if (self.tableView.contentSize.height < kScreenHeight + headerImgHeight - topBarHeight ) {
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, kScreenHeight + headerImgHeight - topBarHeight - self.tableView.contentSize.height, 0);
    }
    [self configNav];
//    [self addController];
//    [self addHeaderView];
//    [self segmentedControlChangedValue:_segCtrl];

    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES]; // 隐藏导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES]; // 隐藏导航栏

    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = nil;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return _stausBarColorIsBlack ? UIStatusBarStyleDefault : UIStatusBarStyleLightContent;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"%f", offsetY);
    if (offsetY > headerImgHeight - topBarHeight) {
        if (![_headerView.superview isEqual:self.view]) {
            [self.view insertSubview:_headerView belowSubview:_navView];
        }
        CGRect rect = self.headerView.frame;
        rect.origin.y = topBarHeight - headerImgHeight;
        self.headerView.frame = rect;
    } else {
        if (![_headerView.superview isEqual:_tableView]) {
            for (UIView *view in _tableView.subviews) {
                if ([view isKindOfClass:[UIImageView class]]) {
                    [_tableView insertSubview:_headerView belowSubview:view];
                    break;
                }
            }
        }
        CGRect rect = self.headerView.frame;
        rect.origin.y = 0;
        self.headerView.frame = rect;
    }
    
    
    if (offsetY>0) {
        CGFloat alpha = offsetY/136;
        self.navView.alpha = alpha;
        
        if (alpha > 0.6 && !_stausBarColorIsBlack) {
            self.navigationController.navigationBar.tintColor = [UIColor blackColor];
            _stausBarColorIsBlack = YES;
            [self setNeedsStatusBarAppearanceUpdate];
        } else if (alpha <= 0.6 && _stausBarColorIsBlack) {
            self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
            _stausBarColorIsBlack = NO;
            [self setNeedsStatusBarAppearanceUpdate];
        }
    } else {
        self.navView.alpha = 0;
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        _stausBarColorIsBlack = NO;
        [self setNeedsStatusBarAppearanceUpdate];
    }
    
}
#pragma mark - Private
- (void)configNav {
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    navView.backgroundColor = [UIColor orangeColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 32, kScreenWidth, 20)];
    titleLabel.text = @"我帮你打水";
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:titleLabel];
    navView.alpha = 0;
    [self.view addSubview:navView];
    
    _navView = navView;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HideSubPageViewController * hidevc = [HideSubPageViewController new];
    [self.navigationController pushViewController:hidevc animated:YES];
}

#pragma mark - UITableViewDelegate


#pragma mark - Getter/Setter
- (NSMutableDictionary *)offsetYDict {
    if (!_offsetYDict) {
        _offsetYDict = [NSMutableDictionary dictionary];
        for (BaseTableViewController *vc in self.childViewControllers) {
            NSString *addressStr = [NSString stringWithFormat:@"%p", vc];
            _offsetYDict[addressStr] = @(CGFLOAT_MIN);
        }
    }
    return _offsetYDict;
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
