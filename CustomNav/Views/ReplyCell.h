//
//  ReplyCell.h
//  CustomNav
//
//  Created by 杨宗磊 on 15/8/28.
//  Copyright (c) 2015年 laoshilaile. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol replyActionDelegate <NSObject>

- (void)getReplyAction;


@end
@interface ReplyCell : UITableViewCell
@property (nonatomic, strong)UIButton * replyBtn;
@property (nonatomic, assign)id<replyActionDelegate>delegate;



@end
