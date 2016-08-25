//
//  HideNavBarViewController.h
//  CustomNav
//
//  Created by 杨宗磊 on 16/7/25.
//  Copyright © 2016年 laoshilaile. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define headerImgHeight 200 // 头部图片刚开始显示的高度（实际高度并不是200）
#define topBarHeight 64  // 导航栏加状态栏高度
#define switchBarHeight 40

@interface HideNavBarViewController : CustomNavigationController

@end
