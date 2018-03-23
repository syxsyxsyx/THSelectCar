//
//  LTSelectCarTypeView.h
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/22.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//选某一品牌的车的某一种车辆类型的View

#import <UIKit/UIKit.h>

@protocol LTSelectCarTypeViewDelegate<NSObject>
- (void)selectRowInLTSelectCarTypeView:(NSIndexPath *)indexPath;
@end

@interface LTSelectCarTypeView : UIView
@property (strong, nonatomic) id<LTSelectCarTypeViewDelegate> delegate;
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic) BOOL isFirstShow;

- (void) annimationOriginX:(NSString *)type;

@end
