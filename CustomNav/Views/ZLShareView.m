//
//  ZLShareView.m
//  CustomNav
//
//  Created by 杨宗磊 on 16/7/19.
//  Copyright © 2016年 laoshilaile. All rights reserved.
//

#import "ZLShareView.h"
#define bgHeight 210
@interface ZLShareView ()
{
    UIView * _backView;
}
@property (nonatomic, strong)UIView * contentBgView;

@end

@implementation ZLShareView

//-(instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        
//        [self viewAddToKeyWindow];
//
//        UIView * bgView = [UIView new];
//        bgView.frame = CGRectMake(0, 0, frame.size.width, bgHeight);
//        bgView.backgroundColor = [UIColor whiteColor];
//        [self addSubview:bgView];
//        
//    };
//    return self;
//
//}
- (void)initShowInView:(UIView *)superView
{
    [self viewAddToKeyWindow:superView];
    
    UILabel * bgView = [UILabel new];
    bgView.frame = CGRectMake(0, 0, ScreenWidth, bgHeight);
    bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bgView];
    [superView addSubview:self];
    
    CGFloat originY = [UIScreen mainScreen].bounds.size.height;
    self.frame = CGRectMake(0, originY, 0, bgHeight);
    [UIView animateWithDuration:0.25 animations:^{
        CGRect sF = self.frame;
        sF.origin.y = ScreenHeight - sF.size.height;
        self.frame = sF;
    }];



}
- (void)setFrame:(CGRect)frame{
    frame.size.width = [UIScreen mainScreen].bounds.size.width;
    if (frame.size.height <= 0) {
        frame.size.height = 00;
    }
    frame.origin.x = 0;
    [super setFrame:frame];
}

- (void)viewAddToKeyWindow:(UIView *)superView
{
    _backView = [[UIView alloc] init];
    _backView.frame = superView.bounds;
    _backView.backgroundColor = [UIColor blackColor];
    _backView.alpha = 0.4;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBg)];
    [_backView addGestureRecognizer:tap];
    [superView addSubview:_backView];
}
- (void)tapBg
{
    [_backView removeFromSuperview];
    _backView = nil;
    [UIView animateWithDuration:0.25 animations:^{
        CGRect sf = self.frame;
        sf.origin.y = [UIScreen mainScreen].bounds.size.height;
        self.frame = sf;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)show
{
    CGFloat originY = [UIScreen mainScreen].bounds.size.height;
    self.frame = CGRectMake(0, originY, 0, bgHeight);
    [UIView animateWithDuration:0.25 animations:^{
        CGRect sF = self.frame;
        sF.origin.y = [UIScreen mainScreen].bounds.size.height - sF.size.height;
        self.frame = sF;
    }];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
