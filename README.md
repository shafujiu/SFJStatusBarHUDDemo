# SFJStatusBarHUDDemo
状态栏的HUD

为了提高用户体验，有时候我们会选择从顶部弹出提醒框的方式。
这样的方式几乎不会影响用户的操作。现在QQ的账号管理切换提醒
就是采用这样的方式。

没有给用户提供自定义的空间
但是用户可以直接通过修改.m文件作简单的定制
```Objective-c
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
```
方法也是比较直观的
```Objective-c
/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;
/**
 * 显示普通信息
 */
+ (void)showMessage:(NSString *)msg;
/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;
/**
 * 显示失败信息
 */
+ (void)showError:(NSString *)msg;
/**
 * 显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg;
/**
 * 隐藏
 */
+ (void)hide;
```
> 我们是通过创建UIWindow，通过window来承载我们的提示框。
> 通过调整window的windowLevel使其保持在最上层。
> 每次的显示都会创建一个UIWindow对象。



