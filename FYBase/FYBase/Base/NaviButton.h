//
//  NaviButton.h
//  FYBase
//
//  Created by wang on 2020/4/16.
//  Copyright © 2020 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NaviButton : UIButton
@property (nonatomic, assign) BOOL isLeftButton;
@end

@interface NaviView: UIView
@property (nonatomic, assign) BOOL isLeftButton;

@end

NS_ASSUME_NONNULL_END
