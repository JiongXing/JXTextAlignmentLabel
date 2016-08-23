//
//  ViewController.m
//  JXTextAlignmentLabelDemo
//
//  Created by JiongXing on 16/8/23.
//  Copyright © 2016年 JiongXing. All rights reserved.
//

#import "ViewController.h"
#import "JXTextAlignmentLabel.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试Label";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(onRightItem)];
    
    JXTextAlignmentLabel *label1 = [self generateLabelWithTitle:@"您好"];
    JXTextAlignmentLabel *label2 = [self generateLabelWithTitle:@"谢谢您"];;
    JXTextAlignmentLabel *label3 = [self generateLabelWithTitle:@"辛1苦2了"];
    
    CGFloat vPadding = 15;
    CGFloat orginY = 64 + vPadding;
    CGFloat height = 45;
    CGFloat width = 200;
    CGFloat x = (CGRectGetWidth(self.view.frame) - width) / 2.0;
    label1.frame = CGRectMake(x, orginY + (vPadding + height) * 0, width, height);
    label2.frame = CGRectMake(x, orginY + (vPadding + height) * 1, width, height);
    label3.frame = CGRectMake(x, orginY + (vPadding + height) * 2, width, height);
    
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
}

- (JXTextAlignmentLabel *)generateLabelWithTitle:(NSString *)title {
    JXTextAlignmentLabel *label = [[JXTextAlignmentLabel alloc] init];
    label.jxTextAligment = JXTextAlignmentFull;
    label.text = title;
    label.layer.borderColor = [UIColor lightGrayColor].CGColor;
    label.layer.borderWidth = 1;
    return label;
}

- (void)onRightItem {
    ViewController2 *vc = [[ViewController2 alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
