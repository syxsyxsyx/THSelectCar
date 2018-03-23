//
//  UIView+LTUivewFrame.m
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/23.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//

#import "UIView+LTUivewFrame.h"

@implementation UIView (LTUivewFrame)

- (void) setViewOrginX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void) setViewWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

@end
