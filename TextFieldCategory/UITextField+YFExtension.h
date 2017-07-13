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
 *  是否点击"完成",键盘自动消失, 默认是YES
 *
 */
@property (nonatomic, assign) BOOL isAutoHidden;

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

/**
 *  添加左边图片 注意:调用此方法, self要有frame
 *
 *  @param imgName 图片名字
 *  @param imgWH   图片宽高(应该小于self的宽高)
 */
- (void)addImg:(NSString *)imgName imgHW:(CGFloat)imgWH;


/**
 *  限制最大输入长度
 */
@property (assign, nonatomic) NSInteger maxLength;

/**
 *  只输入数字
 */
@property(nonatomic,assign)BOOL isOnlyNumber;


@end
