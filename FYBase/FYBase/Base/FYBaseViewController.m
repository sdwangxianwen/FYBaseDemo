//
//  FYBaseViewController.m
//  FYBase
//
//  Created by wang on 2020/4/16.
//  Copyright © 2020 wang. All rights reserved.
//

#import "FYBaseViewController.h"

UIRectEdge SNControllerEdgesForExtendedLayout;

@interface FYBaseViewController ()

@end

@implementation FYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
}


+ (void)setUpEdgesForExtendedLayout:(UIRectEdge)edge {
    SNControllerEdgesForExtendedLayout = edge;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
        _needScrollView = YES;
        self.canGesturePoped = YES;

//        [[NSNotificationCenter defaultCenter] addObserver: self
//                                                 selector: @selector(didEnterBackGround)
//                                                     name: UIApplicationDidEnterBackgroundNotification
//                                                   object: nil];
        
    }
    
    return self;
}

- (void) loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (BOOL) needNavigationBar {
    return YES;
}

//
// 放一个button点击后能让键盘消失
//
- (void) setResignViewBehind:(UIView*) view show:(BOOL) show {
    if (!self.resignResponderView) {
        UIButton *button = [[UIButton alloc] initWithFrame: self.view.bounds];
        button.backgroundColor = [UIColor clearColor];
        [button addTarget: self.view
                   action: @selector(endEditing:)
         forControlEvents: UIControlEventTouchUpInside];
        self.resignResponderView = button;
    }
    
    if (show) {
        if (view && [self.view.subviews containsObject: view]) {
            [self.view insertSubview: self.resignResponderView
                        belowSubview: view];
        } else {
            
            [self.view addSubview: self.resignResponderView];
        }
    } else {
        [self.resignResponderView removeFromSuperview];
    }
}

#pragma mark - show loading

- (void)showLoading:(BOOL)show withStatus:(NSString *)status {
//    NIDPRINTMETHODNAME();
//    if (show) {
//        if (!self.loadingView) {
//
//            MBProgressHUD *loadingView = [[MBProgressHUD alloc] initWithView: self.view];
//            loadingView.userInteractionEnabled = YES;
//            self.loadingView = loadingView;
//
//            loadingView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//
//            [self.view addSubview: self.loadingView];
//        }
//        MBProgressHUD *loadingView = (MBProgressHUD*)self.loadingView;
//        loadingView.labelText = [status isNonEmpty]?status:@"加载中...";
//        [loadingView show: NO];
//
//    } else {
//
//        MBProgressHUD *loadingView = (MBProgressHUD*)self.loadingView;
//        [loadingView hide: NO];
//    }
    
}

- (void) showLoading:(BOOL)show {
//    NIDPRINTMETHODNAME();
//    [self showLoading:show withStatus:nil];
}

- (void) showCustomLoading:(BOOL)show {
//    NIDPRINTMETHODNAME();
//    if (show) {
//        if (!self.loadingView) {
//
//            MBProgressHUD *loadingView = [[MBProgressHUD alloc] initWithView: self.view];
//            loadingView.userInteractionEnabled = YES;
//            self.loadingView = loadingView;
//            [self.view addSubview: self.loadingView];
//        }
//        MBProgressHUD *loadingView = (MBProgressHUD*)self.loadingView;
//        loadingView.labelText = @"加载中...";
//        [loadingView show: NO];
//
//    } else {
//
//        MBProgressHUD *loadingView = (MBProgressHUD*)self.loadingView;
//        [loadingView hide: NO];
//    }
}

@end
