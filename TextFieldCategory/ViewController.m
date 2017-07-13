//
//  ViewController.m
//  TextFieldCategory
//
//  Created by apple on 17/7/13.
//  Copyright © 2017年 BigShow1949. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+YFExtension.h"

@interface ViewController ()<UITextFieldDelegate>

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
    
    
    // 测试
    CGFloat y6 = CGRectGetMaxY(textfield5.frame)+ 15;
    UITextField *textfield6 = [[UITextField alloc] initWithFrame:CGRectMake(50, y6, w, h)];
    textfield6.placeholder = @"测试....";
    textfield6.delegate = self;
    textfield6.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:textfield6];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldEditChanged:) name:@"UITextFieldTextDidChangeNotification" object:textfield6];
    

}


//#pragma mark - UITextFieldDelegate
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    
//    NSLog(@"text=%@, string=%@", textField.text, string);
//    NSLog(@"location=%zd, length=%zd", range.location, range.length);
//    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
//    NSLog(@"toBeString = %@", toBeString);
//
//    if (toBeString.length > 3) {
//        return NO;
//    }
//    return YES;
//}



/*
 限制三个字, 输入"中国人"当输入ren的时候, e就输入不了,加入高亮判断
 */
-(void)textFieldEditChanged:(NSNotification *)obj{
    NSInteger kMaxLength = 3;
    
    UITextField *textField = (UITextField *)obj.object;
    NSString *toBeString = textField.text;
    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];       //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];

        if (position) {
            NSLog(@"高亮的时候不判断, 只有输入到textField的时候才判断");
        }else {
            if (toBeString.length > kMaxLength) {
                textField.text = [toBeString substringToIndex:kMaxLength];
            }
        }
    
    }else if (toBeString.length > kMaxLength) {
        // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        // 最后一个字符输入emoji表情时,显示乱码,改为如下
        if (toBeString.length > kMaxLength)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:kMaxLength];
            if (rangeIndex.length == 1)
            {
                textField.text = [toBeString substringToIndex:kMaxLength];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, kMaxLength)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
        

    }
    
    
}

















@end
