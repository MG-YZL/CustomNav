//
//  HomeNewDetailViewController.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/9/17.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import "HomeNewDetailViewController.h"
#import "KJProgressHUD.h"
@interface HomeNewDetailViewController ()
{
    KJProgressHUD * hud;
}
@property (nonatomic, strong)NSArray * dataArray;
@property (nonatomic, strong)NSMutableArray * noHundredArray;
@property (nonatomic, strong)NSMutableArray * hundredArray;
@property (nonatomic, strong)NSMutableArray * sortDataArray;
@end

@implementation HomeNewDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitleLable.text = @"NEW Detail";
    [self showRequestResultInfo:@"home"];
    
    self.dataArray = @[@"100", @"60",@"80",@"50",@"100"];
//    self.hundredArray = @[@"100",@"100"];
    
    for (int i = 0; i < [_dataArray count]; i++) {
        if ([[_dataArray objectAtIndex:i] isEqualToString:@"100"]) {
            [self.hundredArray addObject:[_dataArray objectAtIndex:i]];
        }else{
            [self.noHundredArray addObject:[_dataArray objectAtIndex:i]];
        }
    }
    self.sortDataArray = [NSMutableArray arrayWithArray:self.noHundredArray];

    BOOL needNext = YES;
    for (int i = 0; i < [_sortDataArray count] - 1 && needNext == YES; i++) {
        needNext = NO;
        for (int j = 0; j < [_sortDataArray count] - 1 - i; j++) {
            if ([[_sortDataArray objectAtIndex:j] floatValue] - [[_sortDataArray objectAtIndex:j + 1] floatValue] < 0) {
                needNext = YES;
                [_sortDataArray exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
    }
    [self.sortDataArray addObjectsFromArray:self.hundredArray];

    NSLog(@"%@", _sortDataArray);
    
    
    
    UITextField * tf = [[UITextField alloc] initWithFrame:CGRectMake(100, 500, 100, 30)];
    tf.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:tf];
    
    

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    hud = [[KJProgressHUD alloc] initWithFrame:CGRectMake(0, 0, self.aImageView.bounds.size.width, self.aImageView.bounds.size.height)];
    [self.aImageView addSubview:hud];
    [hud showProgressHUD];
}

-(NSMutableArray *)sortDataArray
{
    if (!_sortDataArray) {
        _sortDataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _sortDataArray;
}
-(NSMutableArray *)hundredArray
{
    if (!_hundredArray) {
        _hundredArray = [NSMutableArray arrayWithCapacity:1];
        
    }
    return _hundredArray;
}
-(NSMutableArray *)noHundredArray
{
    if (!_noHundredArray) {
        _noHundredArray = [NSMutableArray arrayWithCapacity:1];
        
    }
    return _noHundredArray;
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
