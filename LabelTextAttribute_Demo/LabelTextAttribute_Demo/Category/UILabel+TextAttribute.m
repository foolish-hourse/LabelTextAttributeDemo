//
//  UILabel+TextAttribute.m
//  LabelTextAttribute_Demo
//
//  Created by YZL on 17/6/16.
//  Copyright © 2017年 YZL. All rights reserved.
//

#import "UILabel+TextAttribute.h"

@implementation UILabel (TextAttribute)
/* 设置label带有删除线 **/
- (void)setLabelWithDelLine {
    NSUInteger length = [self.text length];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
    //    [attri addAttribute:NSStrikethroughColorAttributeName value:UIColorFromRGB(0x999999) range:NSMakeRange(0, length)];
    [self setAttributedText:attri];
}

/* 设置label带有下划线 **/
- (void)setLabelWithUnderLine {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [self setAttributedText:str];
}

/* 设置label指定位置的文字颜色 **/
- (void)setLabelText:(NSString *)str Color:(UIColor *)color Range:(NSRange)range {
    if ([str isKindOfClass:[NSNull class]]) {
        str = @"";
    }
    NSMutableAttributedString *mutStr = [[NSMutableAttributedString alloc] initWithString:str];
    [mutStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = mutStr;
}

/* 设置label指定位置的文字颜色(可设置多个位置) **/
- (void)setLabelText:(NSString *)str ColorArr:(NSArray <UIColor *>*)colorArr RangeArr:(NSArray <NSValue *>*)rangeArr {
    if ([str isKindOfClass:[NSNull class]]) {
        str = @"";
    }
    if (colorArr.count == 0 || rangeArr.count == 0 || rangeArr.count != colorArr.count) {
        NSLog(@"colorArr或rangeArr为空或传入的颜色和范围数组不相等");
        return;
    }
    NSMutableAttributedString *mutStr = [[NSMutableAttributedString alloc] initWithString:str];
    for (int i = 0; i < colorArr.count; i++) {
        NSRange range = [rangeArr[i] rangeValue];
        [mutStr addAttribute:NSForegroundColorAttributeName value:colorArr[i] range:range];
    }
    self.attributedText = mutStr;
}

/* 设置label指定位置的文字颜色 **/
- (void)setLabelText:(NSString *)str Color:(UIColor *)color Font:(UIFont *)font Range:(NSRange)range {
    if ([str isKindOfClass:[NSNull class]]) {
        str = @"";
    }
    NSMutableAttributedString *mutStr = [[NSMutableAttributedString alloc] initWithString:str];
    [mutStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    [mutStr addAttribute:NSFontAttributeName value:font range:range];
    self.attributedText = mutStr;
}

/**
 *  改变行间距
 */
- (void)changeLineSpaceWithSpace:(float)space {
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText ? labelText : @""];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
}

/* 设置label指定位置的文字颜色及行间距 **/
- (void)setLabelText:(NSString *)str Color:(UIColor *)color Font:(UIFont *)font Range:(NSRange)range LineSpaceWithSpace:(float)space {
    if ([str isKindOfClass:[NSNull class]]) {
        str = @"";
    }
    NSMutableAttributedString *mutStr = [[NSMutableAttributedString alloc] initWithString:str];
    [mutStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    [mutStr addAttribute:NSFontAttributeName value:font range:range];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [mutStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    self.attributedText = mutStr;
}
@end
