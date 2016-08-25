//
//  CityCell.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/9/1.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import "CityCell.h"

@implementation CityCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier CityArray:(NSArray *)cityArray
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.contentView.backgroundColor = [UIColor grayColor];
        CGFloat width = (ScreenWidth - 15) /3;
        NSLog(@"width = %f", width);
        for (int i = 0; i < [cityArray count];i++ ) {
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(width * (i % 3), 50 * (i / 3), width, 50);
            [btn setTitle:[cityArray objectAtIndex:i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.contentView addSubview:btn];
        }
        
        
        if ([cityArray count] <= 3) {
            
            UIImageView *vLineImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(width*1, 0, 0.5, 50)];
            vLineImageView1.backgroundColor = [UIColor grayColor];
            [self.contentView addSubview:vLineImageView1];
            
            UIImageView *vLineImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(width*2, 0, 0.5, 50)];
            vLineImageView2.backgroundColor = [UIColor grayColor];
            [self.contentView addSubview:vLineImageView2];
            
        } else if ([cityArray count] > 3 && [cityArray count] <= 6) {
            
            UIImageView *hlineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, ScreenWidth - 15, 0.5)];
            hlineImageView.backgroundColor = [UIColor grayColor];
            [self.contentView addSubview:hlineImageView];
            
            UIImageView *vLineImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(width*1, 0, 0.5, width)];
            vLineImageView1.backgroundColor = [UIColor grayColor];
            [self.contentView addSubview:vLineImageView1];
            
            UIImageView *vLineImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(width*2, 0, 0.5, width)];
            vLineImageView2.backgroundColor = [UIColor grayColor];
            [self.contentView addSubview:vLineImageView2];
            
        } else if ([cityArray count] > 6 && [cityArray count] <= 9) {
            
            UIImageView *hlineImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, ScreenWidth - 15, 0.5)];
            hlineImageView1.backgroundColor = [UIColor grayColor];
            [self.contentView addSubview:hlineImageView1];
            
            UIImageView *hlineImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth - 15, 0.5)];
            hlineImageView2.backgroundColor = [UIColor grayColor];
            [self.contentView addSubview:hlineImageView2];
            
            UIImageView *vLineImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(width*1, 0, 0.5, 150)];
            vLineImageView1.backgroundColor = [UIColor grayColor];
            [self.contentView addSubview:vLineImageView1];
            
            UIImageView *vLineImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(width*2, 0, 0.5, 150)];
            vLineImageView2.backgroundColor = [UIColor grayColor];
            [self.contentView addSubview:vLineImageView2];
        }
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
