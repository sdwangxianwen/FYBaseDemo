//
//  FYTranslucentColorBackgroundNavigationBar.m
//  FYBase
//
//  Created by wang on 2020/4/16.
//  Copyright © 2020 wang. All rights reserved.
//

#import "FYTranslucentColorBackgroundNavigationBar.h"

@implementation FYTranslucentColorBackgroundNavigationBar {
    UIView *_shadowView;
}

- (void)setShadowImage:(UIImage *)shadowImage{
    if (_shadowImage != shadowImage) {
        _shadowImage = shadowImage;
        if (!_shadowView) {
            _shadowView = [[UIView alloc] initWithFrame:CGRectZero];
            [self addSubview:_shadowView];
        }
        _shadowView.frame = CGRectMake(0, self.fy_height, self.fy_width, shadowImage.size.height);
        _shadowView.backgroundColor = [UIColor colorWithPatternImage:shadowImage];
    }
}

+ (instancetype)defaultBar{
    FYTranslucentColorBackgroundNavigationBar *naviBar = [[FYTranslucentColorBackgroundNavigationBar alloc] initWithFrame:CGRectMake(0, 0,kScreenw, (kNavBarHight + kStatusBarHeight))];
//    naviBar.backgroundColor = [UIColor colorWithPatternImage:[SCResource load:@"topBanner"]];
    naviBar.backgroundColor = [UIColor colorWithHexString:@"0x25B7FF"];
    naviBar.shadowImage = [UIImage imageNamed:@"topBannerShadow"];
    return naviBar;
}

@end
