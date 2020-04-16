//
//  UIColor+FYColor.h
//  quhuimai
//
//  Created by wang on 2019/4/1.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (FYColor)
+ (UIColor *) colorWithHexString:(NSString *)color;
+ (UIColor *) colorWithHexString:(NSString *)color aplha:(CGFloat)alpha;
+ (instancetype)colorRandom;
+(UIColor *)generateDynamicColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor;
@end

NS_ASSUME_NONNULL_END
