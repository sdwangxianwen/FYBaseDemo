//
//  UILabel+FY.h
//  FYBase
//
//  Created by wang on 2020/4/16.
//  Copyright © 2020 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (FY)
// 创建一个指定frame和字体的label
// 背景为透明，左对其, 颜色为系统默认(应该时黑色)
+ (UILabel*) labelWithFrame: (CGRect) frame fontSize: (CGFloat) fontsize text: (NSString*) text;
+ (UILabel*) labelWithFrame: (CGRect) frame fontSize: (CGFloat) fontsize fontColor: (UIColor*) color text: (NSString*) text;

+ (UILabel*) labelWithFontSize: (CGFloat)fontSize fontColor:(UIColor *)color text: (NSString *)text;

+ (UILabel*) labelWithFrame: (CGRect) frame
               boldFontSize: (CGFloat) fontsize
                  fontColor: (UIColor*) color
                       text: (NSString*) text;
@end

NS_ASSUME_NONNULL_END
