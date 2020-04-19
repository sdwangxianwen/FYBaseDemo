//
//  ViewController.m
//  FYSeeMore
//
//  Created by wang on 2020/4/18.
//  Copyright © 2020 wang. All rights reserved.
//

#import "ViewController.h"
#import "MLLinkLabel.h"
#import "NSString+MLLabel.h"
#import "UILabel+fy.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    MLLinkLabel *label = [[MLLinkLabel alloc] initWithFrame:CGRectMake(0, 88, [UIScreen mainScreen].bounds.size.width, 300)];
//    label.numberOfLines = 2;
//    label.text = @"人生若只如初见，何事秋风悲画扇。等闲变却故人心，http://baidu.com却😷😷😷😷";
//    NSLog(@"%lu", (unsigned long)label.text.lineCount);
//    [self.view addSubview:label];
    
    NSString *context = @".....查看更多查看更多人生若只如初见，何事秋风悲画扇。#等闲 #变却故人心，http://baidu.com当最后一行显示不全时，@需求 有时候需要改变省略号的位置，#系统并未提供，但我们可以通过coreText拿到每行的文字，然后将最后一行文字在指定的地方截断，再拼接省略号当最后一行显示不全时，需求有时候需要改变省略号的位置，系统并未提供，但我们可以通过coreText拿到每行的文字，然后将最后一行文字在指定的地方截断，再拼接省略号当最后一行显示不全时，需求有时候需要改变省略号的位置，系统并未提供，但我们可以通过coreText拿到每行的文字，然后将最后一行文字在指定的地方截断，再拼接省略号";
    NSLog(@" %lu ",(unsigned long)context.length);
    
//     UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 60.0f, self.view.frame.size.width - 20.0f, self.view.frame.size.height - 60)];
//        label.numberOfLines = 9;
//    label.text = context;
//        [self.view addSubview:label];
    
    MLLinkLabel *label = [[MLLinkLabel alloc] initWithFrame:CGRectMake(10.0f, 60.0f, self.view.frame.size.width - 20.0f, self.view.frame.size.height - 60)];
//    label.font = [UIFont systemFontOfSize:14.0f];
//    label.textAlignment = NSTextAlignmentLeft;
    label.dataDetectorTypes = MLDataDetectorTypeAll;
    label.numberOfLines = 11;
    [self.view addSubview:label];
    label.text = context;
    [label setReadMoreLabelContentMode];
////    label.backgroundColor = [UIColor brownColor];
//
//
////    [label addLinkWithType:(MLLinkTypeOther) value:@"查看更多" range:NSMakeRange(label.text.length - 4, 4)];
    [label setDidClickLinkBlock:^(MLLink *link, NSString *linkText, MLLinkLabel *label) {
        if (link.linkType == MLLinkTypeOther) {
            
        }

    }];
                     
////                     linkWithType:MLLinkTypeOther value:@"......查看更多" range:NSMakeRange(1, 2)];
//    more.linkTextAttributes = @{};
//    [label addLink:more];
  
}
-(void)labelTouchUpInside {
    
}


@end
