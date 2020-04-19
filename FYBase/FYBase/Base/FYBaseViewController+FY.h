//
//  FYBaseViewController+FY.h
//  FYBase
//
//  Created by wang on 2020/4/16.
//  Copyright © 2020 wang. All rights reserved.
//

#import "FYBaseViewController.h"
#import "NaviButton.h"
@class FYTranslucentNavigationBar;

NS_ASSUME_NONNULL_BEGIN

// viewcontroller默认有一层背景
typedef NS_ENUM(NSInteger, FYViewControllerBackViewAnimateType) {
    FYViewControllerBackViewNone,               // 不需要背景
    FYViewControllerBackViewDeep,               // 深色背景
    FYViewControllerBackViewLight,              // 浅色背景
};

typedef NS_ENUM(NSInteger, FYViewControllerNavigationColorType) {
    FYViewControllerNavigationColorClear,              // 透明，默认的
    FYViewControllerNavigationColorBlue,               // 颜色背景
};

@protocol FYAutoScrollBackViewDelegate;

@interface FYBaseViewController (FY)

// 是否需要NavigationBar? 默认返回YES
- (BOOL)defaultNavigationBarAnimation;
// 是否需要一个透明的bar放在上面
- (BOOL)needTranslucentNaviBar;
// 是否需要阴影
- (BOOL)needTranslucentNaviBarShadow;
- (CGRect)getViewFrame;
// controller有没有背景
- (FYViewControllerBackViewAnimateType)backViewColorType;
- (FYViewControllerNavigationColorType)navigationBarColorType;
@property (nonatomic, strong) id<FYAutoScrollBackViewDelegate> animateBackView;
// 半透明的bar
@property (nonatomic, strong) FYTranslucentNavigationBar *translucentNavigationBar;

@end

@interface FYBaseViewController (NavigationButtons)

@property (nonatomic, readonly) BOOL hidesBackButton; // 通过property来实现成员变量

- (NaviButton *) createBackToMainButton: (CGRect) frame;
- (NaviButton *) createBackButton:(BOOL)leftArrow; // 返回按钮(背景为尖角或者圆角)
- (NaviButton *) createBackButton:(BOOL)leftArrow title: (NSString*) title;

- (NaviButton *) createNavigateButton: (NSString*) title selector: (SEL) selector;
- (NaviButton *) createCompactNavigateButton: (NSString*) title selector: (SEL) selector;

//
// 给定标题和@selector, 创建一个UIBarButtonItem, 用于在NavigationBar上展示
//
// - (UIBarButtonItem*) createNavigationButtonItem: (NSString*) title selector: (SEL) selector;

//
// 添加指定title和selector的NavigationBar (Left Button)
//
- (void) setLeftNavigationButtonItem: (NSString*) title selector: (SEL) selector;
//
// 添加指定title和selector的NavigationBar (Right Button)
//
- (void) setRightNavigationButtonItem: (NSString*) title selector: (SEL) selector;

//
// 将button添加到右侧的NavigationBar上, 允许用户定制Button的样式，事件
//
- (void) setRightNavigationButton: (NaviButton*) button;

- (void) setLeftNavigationButton: (NaviButton*) button;


-(void) setText:(NSString*)text onBackButton:(UIButton*)backButton leftCapWidth: (CGFloat) capWidth;

//
// 返回上一级ViewController
//
-(void) backToLastController: (id)sender;

- (void) setDisMissBackStyle;

- (void)setLeftNavigationItem:(UIBarButtonItem*)item;
- (void)setRightNavigationItem:(UIBarButtonItem*)item;

- (BOOL)showBackButtonIfNecessary;

//
// 添加指定title和selector的NavigationBar (Left Button)
//
- (void) setLeftNavigationButtonItem: (NSString*) title selector: (SEL) selector;
//
// 添加指定title和selector的NavigationBar (Right Button)
//
- (void) setRightNavigationButtonItem: (NSString*) title selector: (SEL) selector;

//
// 将button添加到右侧的NavigationBar上, 允许用户定制Button的样式，事件
//
-(void) setRightNavigationButton: (NaviButton*) button;

- (void) setLeftNavigationButton: (NaviButton*) button;


-(void) setText:(NSString*)text onBackButton:(UIButton*)backButton leftCapWidth: (CGFloat) capWidth;

//
// 返回上一级ViewController
//
-(void) backToLastController: (id)sender;

- (void) setDisMissBackStyle;

- (void)setLeftNavigationItem:(UIBarButtonItem*)item;
- (void)setRightNavigationItem:(UIBarButtonItem*)item;

- (BOOL)showBackButtonIfNecessary;

@end

NS_ASSUME_NONNULL_END
