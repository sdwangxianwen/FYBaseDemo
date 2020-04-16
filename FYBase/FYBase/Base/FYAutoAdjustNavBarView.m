//
//  FYAutoAdjustNavBarView.m
//  FYBase
//
//  Created by wang on 2020/4/16.
//  Copyright © 2020 wang. All rights reserved.
//

#import "FYAutoAdjustNavBarView.h"

@implementation FYAutoAdjustNavBarView

- (void)addSubview:(UIView *)view {
    [super addSubview:view];
    
   
    [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse
                                    usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                        if ([obj isKindOfClass:[FYTranslucentNavigationBar class]]) {
                                            [self bringSubviewToFront:obj];    // 保证在增加完新subView时,自定义的navigationBar总是在最顶层
                                            *stop = YES;
                                        }
    }];
}

@end
