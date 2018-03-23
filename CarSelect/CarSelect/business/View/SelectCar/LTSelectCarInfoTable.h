//
//  LTSelectCarInfoTableView.h
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/23.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LTSelectCarInfoTableDelegate<NSObject>
@optional
- (void) selectRowInSelectCarInfoTable:(int)index indexPath:(NSIndexPath*)indexPath desc:(NSString *)desc;
- (void) panViewInSelectCarInfoTable:(int)index indexPath:(NSIndexPath*)indexPath;
@end

@interface LTSelectCarInfoTable : UIView<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) id<LTSelectCarInfoTableDelegate> delegate;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (nonatomic) BOOL isPanEnable; //拖动的手势是否有效
@property (nonatomic) int index; // 当前是哪一个tableview;

@end
