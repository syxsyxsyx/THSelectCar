//
//  LTSelectCarMainView.h
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/23.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotbrandsCell.h"
#import "XuanCheDataModel.h"

@protocol LTSelectCarMainViewDelegate<NSObject>
- (void) selectRowInSelectCarMainView:(NSIndexPath *)indexPath;
@end

@interface LTSelectCarMainView : UIView<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) id<LTSelectCarMainViewDelegate> delegate;
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) UILabel *sectionTitleView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) NSArray<branditemsModel*>* allListModel;
@property (nonatomic) NSMutableArray* indexArray;
@property (nonatomic) NSMutableArray* stortArray;
@property (nonatomic) NSArray<hotbrandsModel*>* allHotbrands;

@end
