//
//  DemoViewController.m
//  FYBase
//
//  Created by wang on 2020/4/16.
//  Copyright © 2020 wang. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NaviButton *sharedbtn = [[NaviButton alloc] initWithFrame: CGRectMake(0, 0, kNavBarHight, kNavBarHight)];
    [sharedbtn setImage: [UIImage imageNamed:@"back"]
               forState: UIControlStateNormal];
////    [sharedbtn addTarget: self
//                  action: @selector(onShareBtnPressed:)
//        forControlEvents: UIControlEventTouchUpInside];
    [self setRightNavigationButton: sharedbtn];
    self.title = @"ceshi";
    
}
- (BOOL)canGesturePoped {
    return  YES;
}

- (void)loadView {
    [super loadView];
//    self.view.backgroundColor = [UIColor whiteColor];
}

-(FYViewControllerNavigationColorType)navigationBarColorType {
    return  FYViewControllerNavigationColorClear;
}

-(FYViewControllerBackViewAnimateType)backViewColorType {
    return FYViewControllerBackViewDeep;
}



@end
