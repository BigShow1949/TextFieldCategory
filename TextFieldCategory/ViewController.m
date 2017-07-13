//
//  ViewController.m
//  TextFieldCategory
//
//  Created by apple on 17/7/13.
//  Copyright © 2017年 BigShow1949. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+YFExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat w = 200;
    CGFloat h = 30;
    
    // 附件键盘
    UITextField *textfield1 = [[UITextField alloc] initWithFrame:CGRectMake(50, 30, w, h)];
    textfield1.placeholder = @"添加\"完成\"附件键盘";
    textfield1.borderStyle = UITextBorderStyleLine;
    [textfield1 addAccessoryKeyboardCompletion:^{
        NSLog(@"---点击了完成");
    }];
    [self.view addSubview:textfield1];
    
    // 抖动效果
    CGFloat y2 = CGRectGetMaxY(textfield1.frame)+ 15;
    UITextField *textfield2 = [[UITextField alloc] initWithFrame:CGRectMake(50, y2, w, h)];
    textfield2.placeholder = @"抖动效果";
    textfield2.borderStyle = UITextBorderStyleLine;
    typeof(textfield2) __weak weakSelf = textfield2;
    [textfield2 addAccessoryKeyboardCompletion:^{
        [weakSelf shakeWithCompletion:^{
            NSLog(@"---抖动完成");
        }];
    }];
    [self.view addSubview:textfield2];
    
    // 左边距
    CGFloat y3 = CGRectGetMaxY(textfield2.frame)+ 15;
    UITextField *textfield3 = [[UITextField alloc] initWithFrame:CGRectMake(50, y3, w, h)];
    textfield3.placeholder = @"添加左边距";
    textfield3.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:textfield3];
    [textfield3 addLeftPadding:15];
    

    // leftView
    CGFloat y4 = CGRectGetMaxY(textfield3.frame)+ 15;
    UITextField *textfield4 = [[UITextField alloc] initWithFrame:CGRectMake(50, y4, w, 45)];
    textfield4.placeholder = @"leftImg";
    textfield4.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:textfield4];
    [textfield4 addImg:@"key_login" imgHW:25];
    
    // 限制输入
    CGFloat y5 = CGRectGetMaxY(textfield4.frame)+ 15;
    UITextField *textfield5 = [[UITextField alloc] initWithFrame:CGRectMake(50, y5, w, h)];
    textfield5.placeholder = @"最多输入六个字符";
    textfield5.borderStyle = UITextBorderStyleLine;
    textfield5.maxLength = 6;
    [self.view addSubview:textfield5];

}




@end
