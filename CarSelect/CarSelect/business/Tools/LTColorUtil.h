//
//  LTColorUtil.h
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/22.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//

#define COLOR_F2F2F2 @"#F2F2F2"
#define COLOR_FFFFFF @"#FFFFFF"
#define COLOR_CF000E @"#CF000E"
#define COLOR_333333 @"#333333"
#define COLOR_333333 @"#333333"
#define COLOR_666666 @"#666666"
#define COLOR_999999 @"#999999"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LTColorUtil : NSObject

//将rgb(#f2f2f2)颜色转换成UIColor
+ (UIColor *) colorWithHexString: (NSString *)color;
//将rgb(#f2f2f2)颜色转换成UIImage
+ (UIImage *) createImageWithColor:(NSString *)colorString;
@end

#define CGFloatToDoulbe(par) [[[NSDecimalNumber alloc] initWithFloat:par] doubleValue]
#define  LTScreenWidth   [UIScreen mainScreen].bounds.size.width
#define  LTScreenHeight  [UIScreen mainScreen].bounds.size.height
#define GetViewOriginalX(view) view.frame.origin.x
#define GetViewRightOriginalX(view) GetViewOriginalX(view)+view.frame.size.width

#define LT_StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高度
#define LT_NavBarHeight 44.0
#define LT_TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49) //底部tabbar高度
#define LT_TopHeight (LT_StatusBarHeight + LT_NavBarHeight) //整个导航栏高度


