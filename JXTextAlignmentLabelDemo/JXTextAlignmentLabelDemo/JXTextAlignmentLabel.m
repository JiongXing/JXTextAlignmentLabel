//
//  JXTextAlignmentLabel.m
//  JXTextAlignmentLabelDemo
//
//  Created by JiongXing on 16/8/23.
//  Copyright © 2016年 JiongXing. All rights reserved.
//

#import "JXTextAlignmentLabel.h"

@implementation JXTextAlignmentLabel

- (void)setJxTextAligment:(JXTextAlignment)jxTextAligment {
    _jxTextAligment = jxTextAligment;
    
    switch (jxTextAligment) {
        case JXTextAlignmentLeft:
            self.textAlignment = NSTextAlignmentLeft;
            break;
        case JXTextAlignmentRight:
            self.textAlignment = NSTextAlignmentRight;
            break;
        case JXTextAlignmentCenter:
            self.textAlignment = NSTextAlignmentCenter;
            break;
        default:
            break;
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if (self.jxTextAligment != JXTextAlignmentFull) {
        [super drawRect:rect];
        return;
    }
    
    // 至少两个字
    if (self.text.length < 2) {
        [super drawRect:rect];
        return;
    }
    
    // 字间距
    NSDictionary *sizeAttr = @{NSFontAttributeName : self.font};
    CGSize textSize = [self.text sizeWithAttributes:sizeAttr];
    CGFloat spacing = (CGRectGetWidth(self.bounds) - textSize.width) / (self.text.length - 1);
    if (spacing < 0) {
        [super drawRect:rect];
        return;
    }
    
    // 绘制
    NSDictionary *drawArrt = @{NSFontAttributeName : self.font,
                               NSForegroundColorAttributeName : self.textColor};
    CGFloat y = (CGRectGetHeight(self.bounds) - textSize.height) / 2.0;
    CGFloat x = 0;
    for (NSInteger index = 0; index < self.text.length; index ++) {
        NSString *aChar = [self.text substringWithRange:NSMakeRange(index, 1)];
        [aChar drawAtPoint:CGPointMake(x, y) withAttributes:drawArrt];
        x += (spacing + [aChar sizeWithAttributes:sizeAttr].width);
    }
}

@end
