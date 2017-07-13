//
//  UITextField+Extension.m
//  TextFieldCategory
//
//  Created by apple on 17/7/13.
//  Copyright © 2017年 BigShow1949. All rights reserved.
//

#import "UITextField+YFExtension.h"
#import <objc/runtime.h>

@interface UITextField ()
typedef void (^Completion)();
@property (nonatomic, copy) Completion completionBlock;
@end

@implementation UITextField (YFExtension)

#pragma mark - 附件键盘
static char const *completionKey = "comKey";

- (Completion)completionBlock {
    return objc_getAssociatedObject(self, completionKey);
}

- (void)setCompletionBlock:(Completion)completionBlock {
    objc_setAssociatedObject(self, completionKey, completionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)addAccessoryKeyboardCompletion:(void (^)())completionBlock {
    
    self.completionBlock = completionBlock;
    
    CGSize YFScreen = [UIScreen mainScreen].bounds.size;
    
    UIToolbar *tool = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, YFScreen.width, 44)];
    //    UIBarButtonItem *confirmbutton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(confirmAction)];
    UIBarButtonItem *confirmbutton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(confirmAction)];
    
    UIBarButtonItem *flexibleBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    tool.items = @[flexibleBtn, confirmbutton];
    self.inputAccessoryView = tool;
}

- (void)confirmAction{
    if (self.completionBlock) {
        self.completionBlock();
    }
    // 点击"完成"键盘默认退出
}

#pragma mark - 抖动效果
- (void)shake {
    CAKeyframeAnimation *keyAn = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [keyAn setDuration:0.5f];
    NSArray *array = [[NSArray alloc] initWithObjects:
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x-5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x+5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x-5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x+5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x-5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x+5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      nil];
    [keyAn setValues:array];
    
    NSArray *times = [[NSArray alloc] initWithObjects:
                      [NSNumber numberWithFloat:0.1f],
                      [NSNumber numberWithFloat:0.2f],
                      [NSNumber numberWithFloat:0.3f],
                      [NSNumber numberWithFloat:0.4f],
                      [NSNumber numberWithFloat:0.5f],
                      [NSNumber numberWithFloat:0.6f],
                      [NSNumber numberWithFloat:0.7f],
                      [NSNumber numberWithFloat:0.8f],
                      [NSNumber numberWithFloat:0.9f],
                      [NSNumber numberWithFloat:1.0f],
                      nil];
    [keyAn setKeyTimes:times];
    
    [self.layer addAnimation:keyAn forKey:@"TextAnim"];
}

- (void)shakeWithCompletion:(void (^)())completion {
    self.completionBlock = completion;
    [self _shake:10 direction:1 currentTimes:0 withDelta:5 andSpeed:0.03];
}

/**
 *  抖动动画
 *
 *  @param times     晃动的次数
 *  @param direction 标记:形变是往左还是往右
 *  @param current   已经晃动的次数
 *  @param delta     形变水平距离
 *  @param interval  每次晃动的时间
 */
- (void)_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval {
    
    [UIView animateWithDuration:interval animations:^{
        self.transform = CGAffineTransformMakeTranslation(delta * direction, 0);
    } completion:^(BOOL finished) {
        if(current >= times) {
            self.transform = CGAffineTransformIdentity;
            if (self.completionBlock) {
                self.completionBlock();
            }
            
        }else {
            
            [self _shake:(times - 1)
               direction:direction * -1
            currentTimes:current + 1
               withDelta:delta
                andSpeed:interval];
        }
    }];
}

#pragma mark - 增加左边间隔
- (void)addLeftPadding {
    
//    CGRect frame = f;//f表示你的textField的frame
//    frame.size.width = 15;//设置左边距的大小
//    UIView *leftview = [[UIView alloc] initWithFrame:frame];
//    textField.leftViewMode = UITextFieldViewModeAlways;//设置左边距显示的时机，这个表示一直显示
//    textField.leftView = leftview;
}

- (void)addLeftPadding:(CGFloat)leftPadding {
    [self setValue:[NSNumber numberWithInt:leftPadding] forKey:@"paddingLeft"];
}

@end
