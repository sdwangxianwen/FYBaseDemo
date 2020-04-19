//
//  UILabel+fy.m
//  FYSeeMore
//
//  Created by wang on 2020/4/18.
//  Copyright © 2020 wang. All rights reserved.
//

#import "UILabel+fy.h"
#import <CoreText/CoreText.h>


@implementation MLLinkLabel (fy)
-(void)setReadMoreLabelContentMode {
    NSArray *contents = [self getLinesArrayOfLabelRows];
    if (contents.count <= 1) {
        self.userInteractionEnabled = NO; // 如果一行就不显示查看更多，同时取消手势响应
        return;
    }
    self.userInteractionEnabled=YES;
    
    NSUInteger cutLength = 20; // 截取的长度
    
    NSMutableString *contentText = [[NSMutableString alloc] init];
    if (contents.count <= self.numberOfLines || self.numberOfLines == 0) {
        self.attributedText = [[NSMutableAttributedString alloc] initWithString:self.text];
        return;
    }
    for (NSInteger i = 0; i < self.numberOfLines ; i++) {
        if (i == self.numberOfLines - 1) { // 最后一行 进行处理加上.....
            
            NSString *lastLineText = [NSString stringWithFormat:@"%@",contents[i]];
            NSUInteger lineLength = lastLineText.length;
            if (lineLength > cutLength) {
                lastLineText = [lastLineText substringToIndex:(lastLineText.length - cutLength)];
            }
//            [contentText appendString:[NSString stringWithFormat:@"%@.....",lastLineText]];
            
        } else {
            [contentText appendString:contents[i]];
        }
    }
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    NSDictionary *dictionary = @{
                                 NSForegroundColorAttributeName : self.textColor,
                                 NSFontAttributeName : self.font,
                                 NSParagraphStyleAttributeName : style
                                 };
    
    NSMutableAttributedString *mutableAttribText = [[NSMutableAttributedString alloc] initWithString:[contentText stringByAppendingString:@".....查看更多"] attributes:dictionary];
    [mutableAttribText addAttributes:@{
                                       NSFontAttributeName : [UIFont boldSystemFontOfSize:14.0f],
                                       NSForegroundColorAttributeName : [UIColor orangeColor]
                                       } range:NSMakeRange(contentText.length, 9)];
    self.attributedText = mutableAttribText;
    
    MLLink *link = [MLLink linkWithType:(MLLinkTypeOther) value:@".....查看更多" range:NSMakeRange(self.text.length - 9, 9)];
    link.linkTextAttributes = @{NSForegroundColorAttributeName:[UIColor blueColor]};
    [self addLink:link];
}

// 获取 Label 每行内容 得到一个数组
- (NSArray *)getLinesArrayOfLabelRows
{
    CGFloat labelWidth = self.frame.size.width;
    
    NSString *text = [self text];
    UIFont *font = [self font];
    if (text == nil) {
        return nil;
    }
    CTFontRef myFont = CTFontCreateWithName(( CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    [attStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attStr.length)];
    [attStr addAttribute:(NSString *)kCTFontAttributeName
                   value:(__bridge  id)myFont
                   range:NSMakeRange(0, attStr.length)];
    CFRelease(myFont);
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString(( CFAttributedStringRef)attStr);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,labelWidth,100000));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines = ( NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    for (id line in lines) {
        CTLineRef lineRef = (__bridge  CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString = [text substringWithRange:range];
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr,
                                       lineRange,
                                       kCTKernAttributeName,
                                       (CFTypeRef)([NSNumber numberWithFloat:0.0]));
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr,
                                       lineRange,
                                       kCTKernAttributeName,
                                       (CFTypeRef)([NSNumber numberWithInt:0.0]));
        [linesArray addObject:lineString];
    }
    CGPathRelease(path);
    CFRelease(frame);
    CFRelease(frameSetter);
    return (NSArray *)linesArray;
}

@end
