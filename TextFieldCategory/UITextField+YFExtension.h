//
//  UITextField+Extension.h
//  TextFieldCategory
//
//  Created by apple on 17/7/13.
//  Copyright © 2017年 BigShow1949. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)

/**
*  添加附件键盘, 在键盘右上侧添加"完成"按钮
*
*  @param completionBlock 点击完成按钮回调block
*/
- (void)addAccessoryKeyboardCompletion:(void (^)())completionBlock;

/**
 *  抖动效果
 */
- (void)shake;

- (void)shakeWithCompletion:(void (^)())completion;

/**
 *  增加左边间隔,默认15
 */
- (void)addLeftPadding;
- (void)addLeftPadding:(CGFloat)leftPadding;

@end
