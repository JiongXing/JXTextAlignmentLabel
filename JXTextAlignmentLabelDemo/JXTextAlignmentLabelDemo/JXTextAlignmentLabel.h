//
//  JXTextAlignmentLabel.h
//  JXTextAlignmentLabelDemo
//
//  Created by JiongXing on 16/8/23.
//  Copyright © 2016年 JiongXing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JXTextAlignment) {
    JXTextAlignmentLeft = NSTextAlignmentLeft,
    JXTextAlignmentCenter = NSTextAlignmentCenter,
    JXTextAlignmentRight = NSTextAlignmentRight,
    JXTextAlignmentFull = 10
};

@interface JXTextAlignmentLabel : UILabel

@property (nonatomic, assign) JXTextAlignment jxTextAligment;

@end
