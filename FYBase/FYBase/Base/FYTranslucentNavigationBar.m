//
//  FYTranslucentNavigationBar.m
//  FYBase
//
//  Created by wang on 2020/4/16.
//  Copyright © 2020 wang. All rights reserved.
//

#import "FYTranslucentNavigationBar.h"

@implementation FYTranslucentNavigationBar {
    UILabel *_titleLabel;
    
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        id appearance = [UINavigationBar appearance];
        UIColor *color = [UIColor whiteColor];
        if ([appearance titleTextAttributes][NSForegroundColorAttributeName]) {
            color = [appearance titleTextAttributes][NSForegroundColorAttributeName];
        }
        
        UIFont *font = [UIFont systemFontOfSize: 11];
        if ([appearance titleTextAttributes][NSFontAttributeName]) {
            font = [appearance titleTextAttributes][NSFontAttributeName];
        }
        
        _titleLabel = [UILabel labelWithFrame: CGRectMake(50, kStatusBarHeight, self.fy_width-100, kNavBarHight)
                                     fontSize: 11
                                    fontColor: color
                                         text: @""];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = font;
        [self addSubview: _titleLabel];
        
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    
    if (_titleView) {
        [_titleView removeFromSuperview];
    }
    if (_titleLabel.hidden) {
        _titleLabel.hidden = NO;
    }
    _titleLabel.text = title;
    
    [self checkTitleViewBlock];
}

- (NSString*)title {
    return _titleLabel.text;
}

CGFloat SNLeftEdge(CGFloat wholeWidth, CGFloat localWidth) {
    return (wholeWidth - localWidth)/2.0;
}


- (void)setLeftNavigationView:(UIView *)leftNavigationView {
    if (leftNavigationView != _leftNavigationView) {
        [_leftNavigationView removeFromSuperview];
        
        _leftNavigationView = leftNavigationView;
        leftNavigationView.left = 10;
        leftNavigationView.top = SNLeftEdge(kNavBarHight, leftNavigationView.fy_height)+kStatusBarHeight;
        
        [self addSubview: leftNavigationView];
        
        [self checkTitleViewBlock];
    }
}

- (void)setTitleView:(UIView *)titleView{
    if (_titleView != titleView) {
        if (_titleView) {
            [_titleView removeFromSuperview];
        }
        
        _titleLabel.hidden= YES;
        
        _titleView = titleView;
        _titleView.fy_centerX = self.fy_centerX;
        // 上面高度20；
        _titleView.fy_centerY = self.fy_height *0.5 + kStatusBarHeight*0.5;
        [self addSubview:_titleView];
    }
}



- (void)setRightNavigationView:(UIView *)rightNavigationView {
    if (rightNavigationView != _rightNavigationView) {
        [_rightNavigationView removeFromSuperview];
        
        _rightNavigationView = rightNavigationView;
        rightNavigationView.right = self.fy_width-10;
        rightNavigationView.top = SNLeftEdge(kNavBarHight, rightNavigationView.fy_height)+kStatusBarHeight;
        
        [self addSubview: rightNavigationView];
        
        [self checkTitleViewBlock];
    }
}

// 检查titleView是不是被挡住了
- (void)checkTitleViewBlock {
    CGFloat edge = _titleView.left;
    if (_leftNavigationView && _leftNavigationView.right>edge) {
        edge = _leftNavigationView.right;
    }
    
    if (_rightNavigationView && self.fy_width-_rightNavigationView.left>edge) {
        edge = self.fy_width-_rightNavigationView.left;
    }
    
    _titleLabel.frame = CGRectMake(edge+10, _titleLabel.top, self.fy_width-2*(edge+10), _titleLabel.fy_height);
}


@end
