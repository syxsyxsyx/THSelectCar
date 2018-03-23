//
//  LTSelectCarViewController.m
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/22.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//
const int SEARCHVIEW_HEIGHT = 50;
const int SELECT_CAR_TYPE_FROMX = 50;  //点击分类时候,左边的tableview与左边的间距

#import "LTSelectCarViewController.h"
#import "LTCarStoreSearchView.h"
#import "LTNavigationView.h"
#import "LTSelectCarTypeView.h"
#import "LTSelectCarInfoView.h"
#import "LTSelectCarMainView.h"
#import "LTSelectCarMainView.h"

@interface LTSelectCarViewController ()< LTCarStoreSearchViewDelegate, LTSelectCarTypeViewDelegate, LTSelectCarMainViewDelegate>
//最底层的tableview的布局和数据源
@property (strong, nonatomic) LTSelectCarMainView *selectCarMainView;
@property (strong, nonatomic) LTCarStoreSearchView *ltSearchView;
@property (strong, nonatomic) LTNavigationView *navigationView;


//点击了一个某一个汽车品牌从右边左滑进来的View
@property (strong, nonatomic) LTSelectCarTypeView *selectCarTypeView;

//点击了某品牌汽车的某类型的View;
@property (strong, nonatomic) LTSelectCarInfoView *selectCarInfoView;

@end

@implementation LTSelectCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _backIndex = 0;

    self.navigationItem.leftBarButtonItem= [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBackgroundImage:[LTColorUtil createImageWithColor:COLOR_CF000E] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar addSubview:self.navigationView];
    [self.view addSubview:self.ltSearchView];
    [self.view addSubview:self.selectCarMainView];
}

#pragma mark leak load
- (LTNavigationView *)navigationView{
    if (!_navigationView){
        _navigationView = [[LTNavigationView alloc] initWithFrame:CGRectMake(50, 0, LTScreenWidth-100, 44)];
    }
    return _navigationView;
}

- (LTCarStoreSearchView *)ltSearchView{
    if (!_ltSearchView){
        _ltSearchView = [[LTCarStoreSearchView alloc] initWithFrame:CGRectMake(0, 0, LTScreenWidth, SEARCHVIEW_HEIGHT)];
        _ltSearchView.delegate = self;
        [self.view addSubview:self.ltSearchView];
    }
    return _ltSearchView;
}

- (LTSelectCarTypeView *) selectCarTypeView{
    if (!_selectCarTypeView){
        //创建
        _selectCarTypeView = [[LTSelectCarTypeView alloc] initWithFrame:CGRectMake(LTScreenWidth, 0, LTScreenWidth-SELECT_CAR_TYPE_FROMX, LTScreenHeight)];
        _selectCarTypeView.isFirstShow = YES; //是首次显示
        _selectCarTypeView.delegate = self;
    }
    return _selectCarTypeView;
}

- (LTSelectCarMainView *) selectCarMainView{
    if (!_selectCarMainView){
        _selectCarMainView = [[LTSelectCarMainView alloc] initWithFrame:CGRectMake(0, SELECT_CAR_TYPE_FROMX, LTScreenWidth, LTScreenHeight-SELECT_CAR_TYPE_FROMX)];
        _selectCarMainView.delegate = self;
    }
    return _selectCarMainView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark LTCarStoreSearchViewDelegate
- (void) clickSearchView{
    NSLog(@"%s",__func__);
}

#pragma SelectCarMainView delegate
- (void)selectRowInSelectCarMainView:(NSIndexPath *)indexPath{
    [self.view addSubview:self.selectCarTypeView];
    if (_selectCarTypeView.isFirstShow){
        _backIndex ++;
        [_selectCarTypeView annimationOriginX:@"show"];
    }
}

#pragma mark SelectCarTypeView delegate
- (void) selectRowInLTSelectCarTypeView:(NSIndexPath *)indexPath{
     _backIndex ++;
    [self.view addSubview:self.selectCarInfoView];
    if (_selectCarInfoView.isFirstShow){
        [_selectCarInfoView animationOriginX:@"show"];
    }
}

#pragma mark 点击了某品牌汽车的某类型的View;
- (LTSelectCarInfoView *)selectCarInfoView{
    if (!_selectCarInfoView){
        _selectCarInfoView = [[LTSelectCarInfoView alloc] initWithFrame:CGRectMake(0, 0, LTScreenWidth, LTScreenHeight)];
    }
    return _selectCarInfoView;
}

#pragma mark 点击返回的处理逻辑
- (void)backAction{
    if (_backIndex == 0){
        NSLog(@"退回");
    }else if (_backIndex == 1){
        _backIndex --;
        [_selectCarTypeView annimationOriginX:@"hide"];
    }else if (_backIndex == 2){
        _backIndex --;
        [_selectCarInfoView animationOriginX:@"hide"];
    }else if (_backIndex > 2){
        [_selectCarInfoView animationOriginTableX:@"hide" backInde:_backIndex];
    }
}

@end
