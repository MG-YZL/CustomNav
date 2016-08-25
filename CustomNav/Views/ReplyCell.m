//
//  ReplyCell.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/28.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import "ReplyCell.h"

@implementation ReplyCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.replyBtn];
        [self layoutPageSubviews];
        
        
    }
    return self;
    
}
- (void)layoutPageSubviews
{
    self.replyBtn.frame = CGRectMake(10, 10, 60, 30);
    
}
- (void)replyBtnAction:(UIButton *)sender
{
    NSLog(@"回复");
    if (self.delegate && [self.delegate respondsToSelector:@selector(getReplyAction)]) {
        //回调
        [self.delegate getReplyAction];
        
    }
}
-(UIButton *)replyBtn
{
    if (!_replyBtn) {
        _replyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _replyBtn.backgroundColor = [UIColor orangeColor];
        [_replyBtn setTitle:@"回复" forState:UIControlStateNormal];
        [_replyBtn addTarget:self action:@selector(replyBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _replyBtn;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
