//
//  JXTextAlignmentButton.m
//  JXTextAlignmentLabelDemo
//
//  Created by JiongXing on 16/8/23.
//  Copyright © 2016年 JiongXing. All rights reserved.
//

#import "JXTextAlignmentButton.h"

@interface JXTextAlignmentButton ()

@property (nonatomic, strong) JXTextAlignmentLabel *alignmentLabel;
@property (nonatomic, copy) NSString *titleForNormal;
@property (nonatomic, copy) NSString *titleForHighlighted;
@property (nonatomic, copy) UIColor *colorForNormal;
@property (nonatomic, copy) UIColor *colorForHighlighted;

@end

@implementation JXTextAlignmentButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.titleLabel removeFromSuperview];
        [self.imageView removeFromSuperview];
        [self addSubview:self.alignmentLabel];
        
        [self addTarget:self action:@selector(onTouchDown) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(onTouchDown) forControlEvents:UIControlEventTouchDragEnter];
        [self addTarget:self action:@selector(onTouchCancel) forControlEvents:UIControlEventTouchCancel];
        [self addTarget:self action:@selector(onTouchCancel) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(onTouchCancel) forControlEvents:UIControlEventTouchUpOutside];
        [self addTarget:self action:@selector(onTouchCancel) forControlEvents:UIControlEventTouchDragExit];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat x = self.contentEdgeInsets.left;
    CGFloat width = CGRectGetWidth(self.bounds) - self.contentEdgeInsets.right - x;
    CGFloat y = self.contentEdgeInsets.top;
    CGFloat height = CGRectGetHeight(self.bounds) - self.contentEdgeInsets.bottom - y;
    self.alignmentLabel.frame = CGRectMake(x, y, width, height);
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    if (state == UIControlStateNormal) {
        self.alignmentLabel.text = title;
        self.titleForNormal = title;
    }
    else if (state == UIControlStateHighlighted) {
        self.titleForHighlighted = title;
    }
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state {
    [super setTitleColor:color forState:state];
    if (state == UIControlStateNormal) {
        self.alignmentLabel.textColor = color;
        self.colorForNormal = color;
    }
    else if (state == UIControlStateHighlighted) {
        self.colorForHighlighted = color;
    }
}

- (JXTextAlignmentLabel *)alignmentLabel {
    if (!_alignmentLabel) {
        _alignmentLabel = [[JXTextAlignmentLabel alloc] init];
    }
    return _alignmentLabel;
}

- (void)setJxTextAligment:(JXTextAlignment)jxTextAligment {
    self.alignmentLabel.jxTextAligment = jxTextAligment;
    [self.alignmentLabel setNeedsDisplay];
}

- (JXTextAlignment)fcTextAligment {
    return self.alignmentLabel.jxTextAligment;
}

- (void)onTouchDown {
    self.alignmentLabel.text = self.titleForHighlighted ?: self.titleForNormal;
    self.alignmentLabel.textColor = self.colorForHighlighted ?: self.colorForNormal;
    [self.alignmentLabel setNeedsDisplay];
}

- (void)onTouchCancel {
    self.alignmentLabel.text = self.titleForNormal;
    self.alignmentLabel.textColor = self.colorForNormal;
    [self.alignmentLabel setNeedsDisplay];
}

@end
