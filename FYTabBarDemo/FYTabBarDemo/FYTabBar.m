//
//  FYTabBar.m
//  FYTabBarDemo
//
//  Created by wang on 2020/4/17.
//  Copyright © 2020 wang. All rights reserved.
//

#import "FYTabBar.h"
#import "ViewController.h"
#import "DemoViewController.h"

@interface FYTabBar ()
@property (nonatomic, strong)customBtn *missionEntranceButton;
@end

@implementation FYTabBar

-(void)viewDidLoad {
    
    ViewController *vc = [[ViewController alloc] init];
    vc.title = @"戴莫";
    [self addChildViewController:vc];
    DemoViewController *vc1 = [[DemoViewController alloc] init];
    vc1.title = @"戴莫1";
    vc1.view.backgroundColor = [UIColor brownColor];
    [self addChildViewController:vc1];
    
    // 任务入口
    _missionEntranceButton = [[customBtn alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100,  CGRectGetMaxY(self.view.frame) - 88 - 95, 100, 95)];
    _missionEntranceButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
//    _missionEntranceButton.hidden = YES;
    [self.view addSubview:_missionEntranceButton];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
     _missionEntranceButton.alpha = 0;
    
}
//-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
//    if ([item.title isEqualToString:@"戴莫1"]) {
//        _missionEntranceButton.alpha = 0;
//    } else {
//        _missionEntranceButton.alpha = 1;
//    }
//}



@end

















@interface customBtn ()

@property (nonatomic, strong) UIImageView *bearView;            // 会眨眼睛的熊View

@end

@implementation  customBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _bearView = [[UIImageView alloc] initWithFrame:self.bounds];
        _bearView.animationImages = @[[UIImage imageNamed:@"entrance_image1"],
                                      [UIImage imageNamed:@"entrance_image2"],
                                      [UIImage imageNamed:@"entrance_image1"],
                                      [UIImage imageNamed:@"entrance_image2"],
                                      [UIImage imageNamed:@"entrance_image1"],
                                      [UIImage imageNamed:@"entrance_image1"],
                                      [UIImage imageNamed:@"entrance_image1"]];
        _bearView.animationRepeatCount = 0; // infinite
        _bearView.animationDuration = 1.3;
        [_bearView startAnimating];
        [self addSubview:_bearView];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if (highlighted) {
        [_bearView stopAnimating];
        _bearView.image = [UIImage imageNamed:@"entrance_image_selected"];
    } else {
        [_bearView startAnimating];
    }
}
@end
