//
//  FYBaseViewController+FY.m
//  FYBase
//
//  Created by wang on 2020/4/16.
//  Copyright © 2020 wang. All rights reserved.
//

#import "FYBaseViewController+FY.h"
#import <objc/runtime.h>
#import "FYAutoAdjustNavBarView.h"
#import "SCAutoScrollBackView.h"
#import "FYTranslucentColorBackgroundNavigationBar.h"

#define kLargeButtonFontSize 24
#define kCUITextFieldHeight 46
#define MAX_BACK_BUTTON_WIDTH 160.0

static const void *kAnimateBackViewKey = &kAnimateBackViewKey;
static const void *kTranslucentNavigationBar = &kTranslucentNavigationBar;

@implementation FYBaseViewController (FY)
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (BOOL) needNavigationBar {
    return NO;
}

- (FYViewControllerBackViewAnimateType) backViewColorType {
    return FYViewControllerBackViewDeep;
}

- (FYViewControllerNavigationColorType)navigationBarColorType {
    return FYViewControllerNavigationColorClear;
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL) defaultNavigationBarAnimation {
    return YES;
}

- (BOOL)needTranslucentNaviBar {
    return YES;
}

- (BOOL)needTranslucentNaviBarShadow {
    return YES;
}

CGRect SNNavigationFrame() {
    // application所在Rect的高度
    //    CGRect frame = ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) ? [UIScreen mainScreen].bounds : [UIScreen mainScreen].applicationFrame;
    CGRect frame = [UIScreen mainScreen].bounds;
    CGFloat toolbarHeight = kBottomLineHeight ;
    CGRect rect =  CGRectMake(0, 0, frame.size.width, frame.size.height - toolbarHeight);
    return rect;
}
- (CGRect)getViewFrame {
    return SNNavigationFrame(); // self.wantsFullScreenLayout ? SNScreenBounds() :
}
-(void)loadView {
    if (nil != self.nibName) {
        [super loadView];
        
    } else {
         CGRect frame = [self getViewFrame];
         self.view = [[FYAutoAdjustNavBarView alloc] initWithFrame:frame];
        self.view.autoresizesSubviews = YES;
        self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.view.backgroundColor = [UIColor colorWithHexString:@"0x07a2ee"];
//                                     generateDynamicColor:[UIColor colorWithHexString:@"0x07a2ee"] darkColor:[UIColor colorWithHexString:@"0x07a2ee"]];
        if ([self backViewColorType] == FYViewControllerBackViewDeep) {
            SCAutoScrollDeepBackView *animatBackView = [[SCAutoScrollDeepBackView alloc] initWithFrame: frame];
            
            animatBackView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            [self.view addSubview: animatBackView];
            self.animateBackView = animatBackView;
        } else if ([self backViewColorType] == FYViewControllerBackViewLight){
            SCAutoScrollLightBackView *animatBackView = [[SCAutoScrollLightBackView alloc] initWithFrame: frame];
            
            animatBackView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            [self.view addSubview: animatBackView];
            self.animateBackView = animatBackView;
        }
        
        if ([self needTranslucentNaviBar]) {
            if ([self navigationBarColorType] == FYViewControllerNavigationColorBlue) {
                FYTranslucentColorBackgroundNavigationBar *translucentBar = [FYTranslucentColorBackgroundNavigationBar defaultBar];
                if (![self needTranslucentNaviBarShadow]) {
                    translucentBar.shadowImage = nil;
                }
                translucentBar.title = self.title;
                self.translucentNavigationBar = translucentBar;
                [self.view addSubview: translucentBar];
            }else {
                FYTranslucentNavigationBar *translucentBar = [[FYTranslucentNavigationBar alloc] initWithFrame: CGRectMake(0, 0,CGRectGetWidth(frame), (kNavBarHight + kStatusBarHeight))];
                translucentBar.title = self.title;
                self.translucentNavigationBar = translucentBar;
                [self.view addSubview: translucentBar];
            }
        }
    }
    
    NSArray* viewStack = self.navigationController.viewControllers;
    
    // 除了首页，其他页面都需要"Back　Button"
    if ([viewStack count] > 1 && [self showBackButtonIfNecessary]) {
        NaviButton* backButton = [self createBackButton: YES]; // YES
        backButton.isLeftButton = YES;
        [self setLeftNavigationItem: [[UIBarButtonItem alloc] initWithCustomView:backButton]];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 3. 首页NavigationBar被隐藏，但是其他页面需要NavigationBar
    if ([self needNavigationBar]) {
        if (self.navigationController.navigationBarHidden) {
            [self.navigationController setNavigationBarHidden:NO animated: [self defaultNavigationBarAnimation]];
        }
        
    } else {
        if (!self.navigationController.navigationBarHidden) {
            [self.navigationController setNavigationBarHidden:YES animated: [self defaultNavigationBarAnimation]];
        }
    }
    
}

- (void)setAnimateBackView:(id<FYAutoScrollBackViewDelegate>)animateBackView {
    [self.view insertSubview:(UIView *)animateBackView belowSubview:(UIView *)self.animateBackView];
    [(UIView *)self.animateBackView removeFromSuperview];
    objc_setAssociatedObject(self, kAnimateBackViewKey, animateBackView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id <FYAutoScrollBackViewDelegate>)animateBackView {
    return objc_getAssociatedObject(self, kAnimateBackViewKey);
}

- (void)setTranslucentNavigationBar:(FYTranslucentNavigationBar *)translucentNavigationBar {
    objc_setAssociatedObject(self, kTranslucentNavigationBar, translucentNavigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FYTranslucentNavigationBar*)translucentNavigationBar {
    return objc_getAssociatedObject(self, kTranslucentNavigationBar);
}
- (void)showCustomLoading:(BOOL)show {
    [self showLoading:show withStatus: nil];
}
-(void)showLoading:(BOOL)show {
    if (show) {
//            if (!self.loadingView) {
//
//                SCLoadingBearView *loadingView = [[SCLoadingBearView alloc] initWithFrame: self.view.bounds];
//                self.loadingView = loadingView;
//
//                [self.view addSubview: self.loadingView];
//                if (self.translucentNavigationBar) {
//                    [self.view insertSubview: self.translucentNavigationBar aboveSubview: self.loadingView];
//                }
//            }
//            SCLoadingBearView *loadingView = (SCLoadingBearView*)self.loadingView;
//    //        loadingView.labelText = [status isNonEmpty]?status:@"加载中...";
//            loadingView.isAnimating = YES;
//
//        } else {
//
//            SCLoadingBearView *loadingView = (SCLoadingBearView*)self.loadingView;
//            loadingView.isAnimating = NO;
        }
}
@end

@implementation FYBaseViewController(NavigationButtons)

- (NaviButton*) createBackToMainButton: (CGRect) frame {
    // 返回首页的NavigationBar Button
    
    NaviButton* backButton = [NaviButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = frame;
    backButton.isLeftButton = NO;
    
    UIImageView* homeButton = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, 27, 23)];
    homeButton.image = [UIImage imageNamed:@"back_to_main_button"];

    [backButton addSubview: homeButton];
    
    [backButton addTarget:self action:@selector(backToMain:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage: [UIImage imageNamed:@"NaviButtonNormal"]
                          forState: UIControlStateNormal];
    return backButton;
}

- (UIBarButtonItem*) createNavigationButtonItem: (NSString*) title selector: (SEL) selector isLeft: (BOOL) isLeft {
    NaviButton* button = [self createNavigateButton:title selector: selector];
    button.isLeftButton = isLeft;
    [button setTitleColor: [UIColor lightGrayColor] forState: UIControlStateDisabled];
    [button setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
    //    [button setTitleColor: RGBCOLOR_HEX(0xff8200) forState: UIControlStateHighlighted];
    [button setTitleColor: [UIColor lightTextColor] forState: UIControlStateHighlighted];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
- (void) setLeftNavigationButtonItem: (NSString*) title selector: (SEL) selector {
    UIBarButtonItem* item = [self createNavigationButtonItem:title selector:selector isLeft: YES];
    [self setLeftNavigationItem: item];
}
//
// 添加指定title和selector的NavigationBar
//
- (void)setRightNavigationButtonItem: (NSString*) title selector: (SEL) selector {
    UIBarButtonItem* item = [self createNavigationButtonItem:title selector:selector isLeft: NO];
    [self setRightNavigationItem: item];
}
//
// 将button添加到右侧的NavigationBar上, 允许用户定制Button的样式，事件
//
- (void) setRightNavigationButton: (NaviButton*) button {
    button.isLeftButton = NO;
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithCustomView: button];
    [self setRightNavigationItem: item];
}

- (void) setLeftNavigationButton: (NaviButton*) button {
    button.isLeftButton = YES;
    
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithCustomView: button];
    [self setLeftNavigationItem: item];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NaviButton*) createNavigateButton: (NSString*) title selector: (SEL) selector {
    NaviButton* button = [NaviButton buttonWithType:UIButtonTypeCustom];
    
    button.titleLabel.font = [UIFont systemFontOfSize:11];
    button.titleLabel.textColor = [UIColor whiteColor];
    // 不需要阴影
    //    button.titleLabel.shadowOffset = kNavigationButtonShadowOffset;
    //    button.titleLabel.shadowColor = kNavigationButtonTextShadowColor;
    button.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    //button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    
//    CGSize textSize = [title sizeWithFont:button.titleLabel.font];
    CGSize textSize = [title sizeWithAttributes: @{NSFontAttributeName : button.titleLabel.font}];
    
    UIEdgeInsets inset = button.titleEdgeInsets;
    CGFloat tmpWidth = textSize.width + MAX(0, inset.left) + MAX(0, inset.right);
    CGFloat width = MAX(MIN(tmpWidth, MAX_BACK_BUTTON_WIDTH), 59);
    
    button.frame = CGRectMake(0, 0, width, kNavBarHight);
    
    
    [button setTitle: title forState: UIControlStateNormal];
    
    if (selector) {
        [button addTarget:self action: selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    // 导航栏按钮的样式
    //    [button setBackgroundImage: [BGResource loadStretch:@"navi_btn.png" capWidth:30 capHeight:0]
    //                      forState: UIControlStateNormal];
    
    return button;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIButton*) createCompactNavigateButton: (NSString*) title selector: (SEL) selector {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.titleLabel.font = [UIFont systemFontOfSize:11];
    button.titleLabel.textColor = [UIColor whiteColor];
    //    button.titleLabel.shadowOffset = kNavigationButtonShadowOffset;
    //    button.titleLabel.shadowColor = kNavigationButtonTextShadowColor;
    button.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 6);
    
//    CGSize textSize = [title sizeWithFont:button.titleLabel.font];
    CGSize textSize = [title sizeWithAttributes: @{NSFontAttributeName : button.titleLabel.font}];
    
    UIEdgeInsets inset = button.titleEdgeInsets;
    CGFloat tmpWidth = textSize.width + MAX(0, inset.left) + MAX(0, inset.right);
    CGFloat width = MAX(MIN(tmpWidth, MAX_BACK_BUTTON_WIDTH), 40);
    
    button.frame = CGRectMake(0, 0, width, kNavBarHight);
    
    
    [button setTitle: title forState: UIControlStateNormal];
    
    if (selector) {
        [button addTarget:self action: selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    //    [button setBackgroundImage:  [BGResource loadStretch:@"navi_btn.png" capWidth:30 capHeight:0]
    //                      forState: UIControlStateNormal];
    
    return button;
}

- (void)setTitle:(NSString *)title {
    [super setTitle: title];
    if ([self needTranslucentNaviBar]) {
        self.translucentNavigationBar.title = title;
    }
}

- (void)setLeftNavigationItem:(UIBarButtonItem*)item {
    if ([self needTranslucentNaviBar]) {
        self.translucentNavigationBar.leftNavigationView = item.customView;
    }else {
        self.navigationItem.leftBarButtonItem = item;
    }
}

- (void)setRightNavigationItem:(UIBarButtonItem*)item {
    if ([self needTranslucentNaviBar]) {
        self.translucentNavigationBar.rightNavigationView = item.customView;
    }else {
        self.navigationItem.rightBarButtonItem = item;
    }
}

- (BOOL)showBackButtonIfNecessary {
    return YES;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)backToMain: (id)sender {
    // 直接回到主页面
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Back Button Customize
///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)backToLastController: (id)sender {
    // 返回上一个ViewController
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) disMissController:(id) sender {
    [self.navigationController dismissViewControllerAnimated: YES
                                                  completion: NULL];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL) hidesBackButton {
    return self.navigationItem.hidesBackButton;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NaviButton*) createBackButton:(BOOL)leftArrow {
    return [self createBackButton:leftArrow title: @"返回"];
}

////////////////////////////////3///////////////////////////////////////////////////////////////////
- (NaviButton*) createBackButton:(BOOL)leftArrow title: (NSString*) title {
    // leftArrow: YES(为正常的返回按钮), NO: ModelView等情况
    NaviButton* button = [NaviButton buttonWithType:UIButtonTypeCustom];
    button.isLeftButton = YES;
    button.frame = CGRectMake(0, 0, 50, 35);
    
    [button setImage: [UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    if (@available(iOS 13.0, *)) {
        [button setImage: [[UIImage imageNamed:@"back"] imageWithTintColor: [UIColor colorWithHexString:@"0x323232"]] forState:UIControlStateHighlighted];
    } else {
        // Fallback on earlier versions
    }
    // 在设置返回按钮时，距左有10的间距，图片32*32因此要几乎顶到头 （50-32）*.5 = 9
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -9, 0, 0)];
    //    [button setBackgroundImage: [BGResource loadStretch:@"navi_btn_selected.png" capWidth:13 capHeight:0] forState: UIControlStateHighlighted];
    
    SEL selector = leftArrow ? @selector(backToLastController:) : @selector(disMissController:);
    [button        addTarget: self
                      action: selector
            forControlEvents: UIControlEventTouchUpInside];
    
    return button;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(void) setText:(NSString*)text onBackButton:(UIButton*)backButton leftCapWidth: (CGFloat) capWidth {
    
//    CGSize textSize = [text sizeWithFont:backButton.titleLabel.font];
    CGSize textSize = [text sizeWithAttributes: @{NSFontAttributeName : backButton.titleLabel.font}];
    
    UIEdgeInsets inset = backButton.titleEdgeInsets;
    CGFloat tmpWidth = textSize.width + MAX(0, inset.left) + MAX(0, inset.right);
    CGFloat width = MAX(MIN(tmpWidth, MAX_BACK_BUTTON_WIDTH), 40);
    
    // NSLog(@"BackButton Width: %.3f, Title: %@, TextSize: %.3f", width, text, textSize.width);
    
    const CGRect rect = backButton.frame;
    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;
    
    backButton.frame = CGRectMake(x, y, width, rect.size.height);
    [backButton setTitle:text forState:UIControlStateNormal];
}

- (void) setDisMissBackStyle {
    NaviButton *bacKBtn = [self createBackButton: YES];
    [bacKBtn addTarget: self
                action: @selector(onDisMissBtnPressed:)
      forControlEvents: UIControlEventTouchUpInside];
    [self setLeftNavigationButton: bacKBtn];
}

- (void) onDisMissBtnPressed:(UIButton*) sender {
    [self dismissViewControllerAnimated: YES
                             completion: NULL];
}



@end
