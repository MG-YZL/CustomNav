//
//  EvalInputContentView.h
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/28.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvalInputContentView : UIView<UITextViewDelegate>
{
   UIControl *control;
}

@property (nonatomic, strong)UITextView * contentTextView;
@property (nonatomic, strong)UIImageView * bgImageView;  //背景
@property (nonatomic, strong)UIImageView * textViewBgImageView;  

@property (nonatomic, strong)UILabel * placeholderLable;  //

@property (nonatomic, strong)UIButton * sendBtn;


- (id)initWithFrame:(CGRect)frame superView:(UIView *)view;
- (void)createBgBaseView:(NSString * )name;
@end
