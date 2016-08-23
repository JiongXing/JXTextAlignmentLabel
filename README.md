# JXTextAlignmentLabel
#### 经常遇到这样的需求：文字两端对齐，填满整行
![文字两端对齐，填满整行.gif](https://github.com/JiongXing/JXTextAlignmentLabel/raw/master/screenshots/文字两端对齐，填满整行.gif)
#### 简单用法
```objc
#import "JXTextAlignmentLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试Label";
    
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
@end
```
