//
//  NaviButton.m
//  FYBase
//
//  Created by wang on 2020/4/16.
//  Copyright © 2020 wang. All rights reserved.
//

#import "NaviButton.h"

@implementation NaviButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}


- (UIEdgeInsets)alignmentRectInsets {
    UIEdgeInsets insets = UIEdgeInsetsZero;
    CGFloat edge = 9.0;
    if (_isLeftButton) {
        insets = UIEdgeInsetsMake(0, edge, 0, 0);
    }
    else { // IF_ITS_A_RIGHT_BUTTON
        insets = UIEdgeInsetsMake(0, 0, 0, edge);
    }
    
    return insets;
}

//
// naviBtn的点击区域过大导致用户手误，这里对电机区域做了限制
//
- (BOOL) beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint point = [touch locationInView: self];
    return CGRectContainsPoint(self.bounds, point);
}


@end

@implementation NaviView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (UIEdgeInsets)alignmentRectInsets {
    UIEdgeInsets insets = UIEdgeInsetsZero;    
    CGFloat edge = 9.0;
    if (_isLeftButton) {
        insets = UIEdgeInsetsMake(0, edge, 0, 0);
    }
    else { // IF_ITS_A_RIGHT_BUTTON
        insets = UIEdgeInsetsMake(0, 0, 0, edge);
    }
    
    return insets;
}


@end
