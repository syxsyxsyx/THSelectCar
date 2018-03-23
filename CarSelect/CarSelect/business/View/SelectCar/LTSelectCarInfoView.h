//
//  LTSelectCarInfoView.h
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/23.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTSelectCarInfoTable.h"

@interface LTSelectCarInfoView : UIView<LTSelectCarInfoTableDelegate>

@property (strong, nonatomic) UIView *topTileView;  //上面的titleView;
@property (strong, nonatomic) LTSelectCarInfoTable *tableViewOne;
@property (strong, nonatomic) LTSelectCarInfoTable *tableViewTwo;
@property (strong, nonatomic) LTSelectCarInfoTable *tableViewThree;

@property (strong, nonatomic) UILabel *labelOne;
@property (strong, nonatomic) UILabel *labelTwo;
@property (strong, nonatomic) UILabel *labelThree;

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (nonatomic) BOOL isFirstShow;

- (void) animationOriginX:(NSString *)type;
- (void)animationOriginTableX:(NSString *)type backInde:(int)backIndex;
@end
