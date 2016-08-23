//
//  ViewController2.m
//  JXTextAlignmentLabelDemo
//
//  Created by JiongXing on 16/8/23.
//  Copyright © 2016年 JiongXing. All rights reserved.
//

#import "ViewController2.h"
#import "JXTextAlignmentButton.h"

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试Button";
    self.view.backgroundColor = [UIColor whiteColor];
    
    JXTextAlignmentButton *button1 = [self generateButtonWithTitle:@"您好"];
    JXTextAlignmentButton *button2 = [self generateButtonWithTitle:@"谢谢您"];;
    JXTextAlignmentButton *button3 = [self generateButtonWithTitle:@"辛1苦2了"];
    
    CGFloat vPadding = 15;
    CGFloat orginY = 64 + vPadding;
    CGFloat height = 45;
    CGFloat width = 200;
    CGFloat x = (CGRectGetWidth(self.view.frame) - width) / 2.0;
    button1.frame = CGRectMake(x, orginY + (vPadding + height) * 0, width, height);
    button2.frame = CGRectMake(x, orginY + (vPadding + height) * 1, width, height);
    button3.frame = CGRectMake(x, orginY + (vPadding + height) * 2, width, height);
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
}

- (JXTextAlignmentButton *)generateButtonWithTitle:(NSString *)title {
    JXTextAlignmentButton *button = [JXTextAlignmentButton buttonWithType:UIButtonTypeCustom];
    button.jxTextAligment = JXTextAlignmentFull;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    button.layer.borderWidth = 1;
    return button;
}

@end
