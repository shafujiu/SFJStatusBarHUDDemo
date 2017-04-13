//
//  ViewController.m
//  SFJStatusBarHUDDemo
//
//  Created by 沙缚柩 on 2017/4/13.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "ViewController.h"
#import "SFJStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)message:(id)sender {
    [SFJStatusBarHUD showMessage:@"普通消息"];
}

- (IBAction)success:(id)sender {
    
    [SFJStatusBarHUD showSuccess:@"成功消息"];
}
- (IBAction)failed:(id)sender {
    [SFJStatusBarHUD showError:@"失败消息"];
}

- (IBAction)loading:(id)sender {
    [SFJStatusBarHUD showLoading:@"loading..."];
}
- (IBAction)hide:(id)sender {
    [SFJStatusBarHUD hide];
}

- (void)dealloc{
    NSLog(@"released...");
}


@end
