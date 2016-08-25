//
//  EvalInputContentView.m
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/28.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import "EvalInputContentView.h"

@implementation EvalInputContentView

- (id)initWithFrame:(CGRect)frame superView:(UIView *)view
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewEdited:) name:UITextViewTextDidEndEditingNotification object:nil];
        
    }
    return self;
}

- (void)createBgBaseView:(NSString * )name
{
    NSLog(@"name = %@", name);
    self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.hidden = NO;
    self.backgroundColor = [UIColor clearColor];

    [self addSubview:self.bgImageView];
    [self.bgImageView addSubview:self.textViewBgImageView];
    
    [self.textViewBgImageView addSubview:self.contentTextView];
    [self.textViewBgImageView addSubview:self.sendBtn];
    
    
    [self layoutPageSubviews];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelView)];
    [self.bgImageView addGestureRecognizer:tap];
    
    [[[[UIApplication sharedApplication] windows] firstObject] addSubview:self];

    
}
- (void)layoutPageSubviews
{
    self.bgImageView.frame = self.frame;
    self.textViewBgImageView.frame = CGRectMake(0, self.frame.size.height - 40, self.bgImageView.frame.size.width , 40);
    self.contentTextView.frame = CGRectMake(5, 5, self.textViewBgImageView.frame.size.width - 60, 30);
    self.sendBtn.frame = CGRectMake(CGRectGetMaxX(_contentTextView.frame) + 5 , self.contentTextView.frame.origin.y, 45, 30);
    
}
- (void)cancelView
{
    if (self) {
        [self setHidden:YES];
    }
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}


#pragma mark - NSNotification
- (void)keyboardWillShow:(NSNotification *)notify
{
    CGRect rect = [[notify.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    _textViewBgImageView.frame = CGRectMake(0, self.frame.size.height - rect.size.height -40, self.bgImageView.frame.size.width, 40);
    [UIView commitAnimations];

    if (control == nil) {
        control = [[UIControl alloc] init];
    }
    control.backgroundColor = [UIColor clearColor];
    control.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - rect.size.height - 64) ;
    [control addTarget:self action:@selector(hideKeyBoard) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:control];
}

- (void)keyboardWillHide:(NSNotification *)notify
{
    [self cancelView];
}
- (void)textViewEdited:(NSNotification *)notify
{
    UITextView *textView = [notify object];
    NSLog(@"text = %@", textView.text);
    [self getEvaTextHeight];
    

}
- (CGFloat)getEvaTextHeight
{
    CGFloat contentHeight = 0.0;
    NSString *content = self.contentTextView.text;
    CGSize contentSize = [content sizeWithFont:[UIFont systemFontOfSize:16.0] constrainedToSize:CGSizeMake(_contentTextView.frame.size.width,MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    contentHeight = contentSize.height;
    
    if (contentHeight < 40.0) {
        contentHeight = 40.0;
    } else if (contentHeight > 100.0){
        contentHeight = 100.0;
    }
    
    self.textViewBgImageView.frame = CGRectMake(10, 5, self.frame.size.width - 20, contentHeight - 10);
    self.contentTextView.frame = CGRectMake(5, 5, self.bgImageView.frame.size.width-60, _textViewBgImageView.frame.size.height);
    self.sendBtn.frame = CGRectMake(CGRectGetMaxX(_contentTextView.frame) + 5 , self.contentTextView.frame.origin.y, 45, 30);

    
    return contentHeight;
}
- (void)hideKeyBoard
{
    [self.contentTextView resignFirstResponder];
    [self cancelView];
}
//UITextViewDelegate里面有这样一个代理函数：
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //点击发送
    if ([text isEqualToString:@"\n"]){
        
        [self.contentTextView resignFirstResponder];
//        [self replyEvalByInfo];
        
        return NO;
    }
    return YES;
}
#pragma mark - getter
-(UITextView *)contentTextView
{
    if (!_contentTextView) {
        _contentTextView = [UITextView new];
        _contentTextView.backgroundColor = [UIColor redColor];
        _contentTextView.delegate = self;
//        _contentTextView.inputAccessoryView = self.placeholderLable;
//        _contentTextView.inputView = self.placeholderLable;
        _contentTextView.returnKeyType = UIReturnKeySend;
        _contentTextView.font = [UIFont systemFontOfSize:16.0];
    }
    return _contentTextView;
    
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
-(UIImageView *)textViewBgImageView
{
    if (!_textViewBgImageView) {
        _textViewBgImageView = [UIImageView new];
        _textViewBgImageView.backgroundColor = [UIColor grayColor];
        _textViewBgImageView.userInteractionEnabled = YES;
    }
    return _textViewBgImageView;
}
-(UILabel *)placeholderLable
{
    if (!_placeholderLable) {
        _placeholderLable = [UILabel new];
        _placeholderLable.backgroundColor = [UIColor purpleColor];
        _placeholderLable.text = @"回复";
    }
    return _placeholderLable;
}
-(UIButton *)sendBtn
{
    if (!_sendBtn) {
        _sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendBtn.backgroundColor = [UIColor orangeColor];
        [_sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    }
    return _sendBtn;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
