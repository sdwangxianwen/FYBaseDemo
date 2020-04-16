//
//  UIImage+Tint.m
//  backAnmition
//
//  Created by wang on 2020/4/15.
//  Copyright © 2020 wang. All rights reserved.
//

#import "UIImage+Tint.h"
#define NIDPRINTMETHODNAME() NIDPRINT(@"%s", __PRETTY_FUNCTION__)

@implementation UIImage (Tint)
- (UIImage*) imageWithTintColor:(UIColor *)tintColor {
    return [self imageWithTintColor: tintColor blendMode:kCGBlendModeDestinationIn];
}
- (UIImage*) imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode) blendMode {
//    NIDPRINTMETHODNAME();

    // keep alpha, set opaque to NO
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);

    // Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];

    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }

    UIImage* tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return tintedImage;
}
@end
