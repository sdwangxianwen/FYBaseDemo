//
//  SCAutoScrollBackView.m
//  backAnmition
//
//  Created by wang on 2020/4/15.
//  Copyright © 2020 wang. All rights reserved.
//

#import "SCAutoScrollBackView.h"
#import "UIImage+Tint.h"


#define RGBCOLOR_HEX(hexColor) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: 1]

@implementation SCAutoScrollBackView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
#import "UIImage+Tint.h"

@implementation SCAutoScrollDeepBackView{
    CAEmitterLayer *_emitter;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)sprinkleWithImages:(NSArray <UIImage *> *)images
               WithColors:(NSArray <UIColor *>*)colors
                 duration:(NSTimeInterval)duration
                birthRate:(CGFloat)birthRate {
    if (!!_emitter) {
        return;
    }
    if (colors.count > 0) {
        
        CGFloat rectifyBirthRate = birthRate / colors.count;

        CGFloat newbirthRate = rectifyBirthRate;
        
        CAEmitterLayer *emitter = [CAEmitterLayer layer];
        
        emitter.emitterPosition = CGPointMake(self.fy_width / 2.0, self.fy_height+30);
        emitter.emitterSize = CGSizeMake(self.fy_width, 0.0);
        emitter.emitterMode    = kCAEmitterLayerOutline;
        emitter.emitterShape = kCAEmitterLayerLine;
        emitter.renderMode = kCAEmitterLayerOldestLast;
        
        NSMutableArray *cells = [NSMutableArray arrayWithCapacity:colors.count * images.count];
        
        for (NSInteger i = 0; i < images.count; i++) {
            UIImage *image = images[i];
            
            for (NSInteger j = 0; j < colors.count; j++) {
                
                UIColor *color = colors[j];
                
                UIImage *cellImage = [image imageWithTintColor:color];
                
                CAEmitterCell *cell = [CAEmitterCell emitterCell];
                
                cell.name = [NSString stringWithFormat:@"ribbonCell%ld",(unsigned long)cells.count];
                
                if (!i) {
                    if (j) {
                        cell.birthRate = newbirthRate;
                        cell.scale = 0.25;
                        cell.scaleRange = 0.3;
                    }else{
                        cell.birthRate = newbirthRate * 0.7;
                        cell.scale = 0.25;
                        cell.scaleRange = 0.3;
                    }
                    
                }else{
                    if (j) {
                        cell.birthRate = newbirthRate*0.2;
                        cell.scale = 0.25;
                        cell.scaleRange = 0.3;
                    }else {
                        cell.birthRate = newbirthRate*0.2;
                        cell.scale = 0.25;
                        cell.scaleRange = 0.3;
                    }
                }
                
                cell.velocity = 30;
                cell.velocityRange = 50;
                
                cell.emissionRange = 0.25 * M_PI;
                cell.yAcceleration = - 5;
                cell.lifetime = 20;
                cell.contents    = (id)[cellImage CGImage];
                cell.spin    = 0;
                cell.spinRange = 2;
                
                [cells addObject:cell];
        }
        }
        
        emitter.emitterCells = cells;
        [self.layer addSublayer:emitter];
        
        _emitter = emitter;
        
    }
}
- (void)didMoveToWindow{
    [self sprinkleWithImages:@[[UIImage imageNamed:@"animateCircle"],
                               [UIImage imageNamed:@"animateCube"],
                               [UIImage imageNamed:@"animateTriangle"],
                               ]
                  WithColors:@[
                               RGBCOLOR_HEX(0x1797e2),
                               RGBCOLOR_HEX(0x0babf8),
                               RGBCOLOR_HEX(0x04a9f4)
                               ]
                    duration:0
                   birthRate:1.5];
    
}
- (void)pause {
    
}

- (void)resume {
    
}

@end


@implementation SCAutoScrollLightBackView {
    UIView *_bottomView;
    /*
    UIView *_horalView;
     */
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        self.clipsToBounds = YES;
        self.backgroundColor = RGBCOLOR_HEX(0x57c5f6);
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.fy_height-103, self.fy_width, 103)];
        _bottomView.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"viewBackGroundBottom"]];
        _bottomView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [self addSubview: _bottomView];
        //        [self pause];
        
    }
    return self;
}

- (void)pause {
    
}

- (void)resume {
    
}

@end
