//
//  SCAutoScrollBackView.h
//  backAnmition
//
//  Created by wang on 2020/4/15.
//  Copyright © 2020 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCAutoScrollBackView : UIView

@end

@protocol FYAutoScrollBackViewDelegate <NSObject>

- (void)pause;
- (void)resume;

@end

@interface SCAutoScrollDeepBackView : UIView <FYAutoScrollBackViewDelegate>


@end

@interface SCAutoScrollLightBackView : UIView <FYAutoScrollBackViewDelegate>

@end

NS_ASSUME_NONNULL_END
