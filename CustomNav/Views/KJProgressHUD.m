//
//  KJProgressHUD.m
//  MiSiChu
//
//  Created by wangzhen on 15/10/10.
//  Copyright © 2015年 Vision.Wang. All rights reserved.
//

#import "KJProgressHUD.h"

@implementation KJProgressHUD

#pragma mark - progressHud Method

/**
*  背景图
*
*  @return 背景的隔板
*/
//- (UIView *)progressView {
//    if (!_progressView) {
//        _progressView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64)];
//        _progressView.backgroundColor = [UIColor purpleColor];
//        [MainWindow addSubview:_progressView];
//        [_progressView addSubview:self.progressShadowView];
//    }
//    [MainWindow bringSubviewToFront:_progressView];
//    return _progressView;
//}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor purpleColor];
        [self addSubview:self.progressShadowView];
        _progressShadowView.bounds = CGRectMake(0, 0, 40, 40);
        _progressShadowView.center = CGPointMake(frame.size.width / 2.0, frame.size.height / 2.0 );
        _progressHud.center = CGPointMake(_progressShadowView.frame.size.width / 2.0, _progressShadowView.frame.size.height / 2.0);

    }
    return self;
}
/**
 *  黑色蒙版
 *
 *  @return 黑色蒙版
 */
- (UIView *)progressShadowView {
    if (!_progressShadowView) {
        _progressShadowView = [[UIView alloc] init];

        _progressShadowView.backgroundColor = [UIColor orangeColor];
        [ToolKit setViewRadius:5 toView:_progressShadowView];
        [_progressShadowView addSubview:self.progressHud];
    }
    return _progressShadowView;
}

/**
 *  hud 菊花
 *
 *  @return hud 菊花视图
 */
- (UIActivityIndicatorView *)progressHud {
    if (!_progressHud) {
        _progressHud = [[UIActivityIndicatorView alloc] init];
    }
    return _progressHud;
}

/**
 *  显示菊花hud的方法
 */
- (void)showProgressHUD {
    self.progressView.hidden = NO;
    [self.progressHud startAnimating];
}


/**
 *  隐藏菊花hud的方法
 */
- (void)hiddenProgressHUD {
    self.progressView.hidden = YES;
    [self.progressHud stopAnimating];
    [self.progressView removeFromSuperview];
    [self.progressShadowView removeFromSuperview];
    [self.progressHud removeFromSuperview];
    self.progressView = nil;
    self.progressShadowView = nil;
    self.progressHud = nil;
}


@end
