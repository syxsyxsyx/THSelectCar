//
//  UILabel+LTLabelWithAttribute.m
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/22.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//

#import "UILabel+LTLabelWithAttribute.h"

@implementation UILabel (LTLabelWithAttribute)


- (void)labelWithAttr:(NSString *)text
                color:(NSString *)color
                 font:(NSInteger)font
            textAlign:(NSTextAlignment)align{
    self.font = [UIFont systemFontOfSize:font];
    self.textColor = [LTColorUtil colorWithHexString:color];
    self.text = text;
    self.textAlignment = align;
}

- (void) labelWithAttributedFont:(NSString *)str
                         paraStr:(NSString *)para
                        paraFont:(NSInteger )font{
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange redRange = NSMakeRange([[attribute string] rangeOfString:para].location, [[attribute string] rangeOfString:para].length);
    [attribute addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font]  range:redRange];
    self.attributedText = attribute;
}

- (void) labelWithAttributedColor:(NSString *)str
                     paraStr:(NSString *)para
                   paraColor:(NSString *)paraColor{
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange redRange = NSMakeRange([[attribute string] rangeOfString:para].location, [[attribute string] rangeOfString:para].length);
    [attribute addAttribute:NSForegroundColorAttributeName value:[LTColorUtil colorWithHexString:paraColor] range:redRange];
    self.attributedText = attribute;
}

- (void) labelWithAttributedFont:(NSString *)str
                            para:(NSString *)para
                    paraBoldFont:(NSInteger )font{
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange redRange = NSMakeRange([[attribute string] rangeOfString:para].location, [[attribute string] rangeOfString:para].length);
    [attribute addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:font]  range:redRange];
    self.attributedText = attribute;
}


- (void) labelWithAttributedFontAndColor:(NSString *)str
                     paraStr:(NSString *)para
                   paraColor:(NSString *)paraColor
                paraBoldFont:(NSInteger)font{
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange redRange = NSMakeRange([[attribute string] rangeOfString:para].location, [[attribute string] rangeOfString:para].length);
    [attribute addAttribute:NSForegroundColorAttributeName value:[LTColorUtil colorWithHexString:paraColor] range:redRange];
    [attribute addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:font]  range:redRange];
    self.attributedText = attribute;
}

- (CGFloat)getLabelWidth:(CGFloat)height font:(CGFloat)fontSize lineSpacing:(CGFloat)lineSpacing{
    //文字的字体
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    //将text转化为NSMutableAttributedString类型
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text attributes:attribute];
    //设置行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    
    //获得UILabel的size，其中，296和93是size的限定值
    CGSize DateSize = [attributedString boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  context:nil].size;
    return DateSize.width;
}
@end

