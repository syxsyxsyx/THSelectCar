//
//  UILabel+LTLabelWithAttribute.h
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/22.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LTLabelWithAttribute)

- (void)labelWithAttr:(NSString *)text
                color:(NSString *)color
                 font:(NSInteger)font
            textAlign:(NSTextAlignment)align;

- (void) labelWithAttributedFont:(NSString *)str
                         paraStr:(NSString *)para
                        paraFont:(NSInteger)font;

- (void) labelWithAttributedColor:(NSString *)str
                          paraStr:(NSString *)para
                        paraColor:(NSString *)paraColor;

- (void) labelWithAttributedFont:(NSString *)str
                            para:(NSString *)para
                    paraBoldFont:(NSInteger)font;

- (void) labelWithAttributedFontAndColor:(NSString *)str
                                 paraStr:(NSString *)para
                               paraColor:(NSString *)paraColor
                            paraBoldFont:(NSInteger)font;

//根据Label的高度获取Label的宽
- (CGFloat)getLabelWidth:(CGFloat)height font:(CGFloat)fontSize lineSpacing:(CGFloat)lineSpacing;

@end

