//
//  SFJStatusBarHUD.m
//  SFJStatusBarHUD
//
//  Created by ZhaoWei on 16/12/11.
//  Copyright © 2016年 ZhaoWei. All rights reserved.
//

#import "SFJStatusBarHUD.h"

/** 信息字体大小 */
#define SFJMessageFont [UIFont systemFontOfSize:12]
/** 背景颜色 */
#define SFJBGColor [UIColor blackColor]

/** 消息的停留时间 */
static CGFloat const SFJMessageDuration = 2.0;
/** 消息显示\隐藏的动画时间 */
static CGFloat const SFJAnimationDuration = 0.25;
/** HUD's height */
static CGFloat const SFJHUDHeight = 20;

@implementation SFJStatusBarHUD
/** 全局的窗口 */
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;

/**
 * 显示窗口
 */
+ (void)p_showWindow{
    // frame数据
    CGFloat windowH = SFJHUDHeight;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 显示窗口
    window_.hidden = YES;
    window_ = nil;
    
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = SFJBGColor;
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;

    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:SFJAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    // 显示窗口
    [self p_showWindow];
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = SFJMessageFont;
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    // 定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:SFJMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
}

+ (void)showMessage:(NSString *)msg{
    [self showMessage:msg image:nil];
}

+ (void)showSuccess:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"SFJStatusBarHUD.bundle/success"]];
}

+ (void)showError:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"SFJStatusBarHUD.bundle/error"]];
}

+ (void)showLoading:(NSString *)msg{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 显示窗口
    [self p_showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = SFJMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    // 添加菊花
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    // 文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : SFJMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * .5 - 20;
    CGFloat centerY = window_.frame.size.height * .5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}
/**
 * 隐藏
 */
+ (void)hide{
    [UIView animateWithDuration:SFJAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = -frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}



@end
