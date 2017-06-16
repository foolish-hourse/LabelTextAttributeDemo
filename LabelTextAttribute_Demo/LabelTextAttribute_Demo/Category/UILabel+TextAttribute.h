//
//  UILabel+TextAttribute.h
//  LabelTextAttribute_Demo
//
//  Created by YZL on 17/6/16.
//  Copyright © 2017年 YZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TextAttribute)
/// 设置label带有删除线
- (void)setLabelWithDelLine;
/// 设置label带有下划线
- (void)setLabelWithUnderLine;
/// 设置label文字的指定位置的文字颜色
- (void)setLabelText:(NSString *)str Color:(UIColor *)color Range:(NSRange)range;
/// 设置label指定位置的文字颜色(可设置多个位置)
- (void)setLabelText:(NSString *)str ColorArr:(NSArray <UIColor *>*)colorArr RangeArr:(NSArray <NSValue *>*)rangeArr;
/// 设置label指定位置的文字颜色
- (void)setLabelText:(NSString *)str Color:(UIColor *)color Font:(UIFont *)font Range:(NSRange)range;
/// 设置label指定位置的文字颜色及行间距
- (void)setLabelText:(NSString *)str Color:(UIColor *)color Font:(UIFont *)font Range:(NSRange)range LineSpaceWithSpace:(float)space;
/// 改变行间距
- (void)changeLineSpaceWithSpace:(float)space;
@end
