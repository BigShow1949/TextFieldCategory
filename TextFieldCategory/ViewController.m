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
    [textfield3 addAccessoryKeyboardCompletion:^{
        NSLog(@"---点击了完成");
    }];
    [self.view addSubview:textfield3];
    [textfield3 addLeftPadding:15];
    


}




@end
