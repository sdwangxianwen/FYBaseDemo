//
//  FYBaseViewController.h
//  FYBase
//
//  Created by wang on 2020/4/16.
//  Copyright © 2020 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYBaseViewController : UIViewController
@property (nonatomic, retain) UIBarButtonItem * backNavigationButton;

/**
 * 判断是否需要ScrollView
 */
@property (nonatomic, readonly) BOOL needScrollView;

@property (nonatomic) BOOL canGesturePoped;                                         // 是否可以跟手关闭界面
@property (nonatomic) BOOL canCustomGesturePoped;                                   // 是否可以用自定义的swipeGesture
@property (nonatomic, strong) UISwipeGestureRecognizer *customPopGesture;        // 如果左滑的跟手关闭了，手动加一个手势

@property (nonatomic, strong) UIView *loadingView;

- (BOOL) needNavigationBar;

/**
 * show laoding animation
 */
- (void) showLoading:(BOOL)show;
- (void)showLoading:(BOOL)show withStatus:(NSString *)status;
- (void) showCustomLoading:(BOOL)show;

@property (nonatomic, strong) UIView *resignResponderView;
//
// 放一个setEdit：No的button在view上面
//
- (void) setResignViewBehind:(UIView*) view show:(BOOL) show;
@end

NS_ASSUME_NONNULL_END
