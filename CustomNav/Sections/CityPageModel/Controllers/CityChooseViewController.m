//
//  CityChooseViewController.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/31.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import "CityChooseViewController.h"
#import "CityCell.h"
@interface CityChooseViewController ()
@property (nonatomic ,strong)UITableView * tableView;
@property (nonatomic, strong)NSArray * titleArray;
@property (nonatomic, strong)NSArray * cityArray;


@end

@implementation CityChooseViewController
@synthesize cityArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitleLable.text = @"城市选择";
    self.navBackBtn.hidden = NO;
    [self.view addSubview:self.tableView];
    [self layoutPageSubviews];
    
    self.titleArray = @[@"#",@"$",@"A"];
    self.cityArray = @[@"杭州",@"上海",@"南京",@"无锡",@"杭州",@"上海",@"南京"];
    
    
    
}
- (void)layoutPageSubviews
{
    self.tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 || section == 1) {
        return 1;
    }else{
        return 20;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSString * cellIdentifier = @"CityCell";
        CityCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[CityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier CityArray:cityArray];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        NSString * cellIdentifier = @"cell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }

    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.titleArray count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    if (section == 0) {
        return @"最近访问城市";
    }else if (section == 1){
        return @"热门城市";
    }else{
        return [self.titleArray objectAtIndex:section];
    }
    
    
}
//设置索引:
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.titleArray;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if ([cityArray count]%3 == 0) {
            
            return ([cityArray count]/3) * 50 ;
        }else{
            NSInteger height = [cityArray count] / 3;
//            NSInteger count = [cityArray count] % 3;
            return (height + 1)* 50;
        }
    }else{
        return 50;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? 50 : 30;
}

#pragma mark - getHeaderView
- (UIView *)getHeaderView
{
    UISearchBar * searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    searchBar.delegate = self;
    return searchBar;
}
#pragma mark - getter
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.tableHeaderView = [self getHeaderView];
    }
    return _tableView;
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
