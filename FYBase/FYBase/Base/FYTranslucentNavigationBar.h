//
//  FYTranslucentNavigationBar.h
//  FYBase
//
//  Created by wang on 2020/4/16.
//  Copyright © 2020 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYTranslucentNavigationBar : UIView
@property (nonatomic, copy) NSString *title;

/**
 *  a title view which will be added to center of the navigation bar
 *  the difference between UINavigationBar's title view is that
 *  this title view's frame will not be reframed if the if it's bounds
 *  exceeded the bar;
 */
@property (nonatomic, strong) UIView *titleView;


@property (nonatomic, strong) UIView *leftNavigationView;

@property (nonatomic, strong) UIView *rightNavigationView;
@end

NS_ASSUME_NONNULL_END
