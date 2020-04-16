//
//  UILabel+FY.m
//  FYBase
//
//  Created by wang on 2020/4/16.
//  Copyright © 2020 wang. All rights reserved.
//

#import "UILabel+FY.h"

@implementation UILabel (FY)

+ (UILabel*) labelWithFontSize: (CGFloat)fontSize fontColor:(UIColor *)color text: (NSString *)text {
    UILabel *label = [UILabel new];
    label.textColor = color;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.text = text;
    return label;
}

+ (UILabel*) labelWithFrame: (CGRect) frame
                   fontSize: (CGFloat) fontsize
                       text: (NSString*) text {

    UILabel* label = [[UILabel alloc] initWithFrame: frame];

    label.text = text;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize: fontsize];

    return label;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (UILabel*) labelWithFrame: (CGRect) frame
                   fontSize: (CGFloat) fontsize
                  fontColor: (UIColor*) color
                       text: (NSString*) text {

    UILabel* label = [[UILabel alloc] initWithFrame: frame];

    label.text = text;
    label.textColor = color;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize: fontsize];

    return label;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (UILabel*) labelWithFrame: (CGRect) frame
               boldFontSize: (CGFloat) fontsize
                  fontColor: (UIColor*) color
                       text: (NSString*) text {

    UILabel* label = [[UILabel alloc] initWithFrame: frame];

    label.text = text;
    label.textColor = color;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize: fontsize];

    return label;
}

@end
