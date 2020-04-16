//
//  FYTranslucentColorBackgroundNavigationBar.h
//  FYBase
//
//  Created by wang on 2020/4/16.
//  Copyright © 2020 wang. All rights reserved.
//

#import "FYTranslucentNavigationBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface FYTranslucentColorBackgroundNavigationBar : FYTranslucentNavigationBar
/**
 *  need a shadow image on the bottom of the navi
 */
@property (nonatomic, strong,nullable) UIImage *shadowImage;

/**
 *  a default bar pattern which contains a blue back ground and a shadow
 *  it's frame is cgreckmake(0,0,viewWidth,64)
 */
+ (instancetype)defaultBar;
@end

NS_ASSUME_NONNULL_END
