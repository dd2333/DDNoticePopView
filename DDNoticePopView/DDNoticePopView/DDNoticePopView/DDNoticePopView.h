//
//  DDNoticePopView.h
//  Travel
//
//  Created by dd2333 on 2017/4/6.
//  Copyright © 2017年 dd2333. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDNoticePopView : UIView

+ (instancetype)sharedInstance;

- (void)show:(UIImage*)image btnClick:(void(^)(void))btnClick;

- (void)show:(UIImage*)image btnClick:(void(^)(void))btnClick closeClick:(void(^)(void))closeClick;

- (void)show:(UIImage*)image closeBtnHidden:(BOOL)isHidden btnClick:(void(^)(void))btnClick closeClick:(void(^)(void))closeClick;

- (void)hide;

@end
