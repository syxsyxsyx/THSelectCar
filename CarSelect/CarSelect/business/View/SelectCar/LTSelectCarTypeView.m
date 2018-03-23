//
//  LTSelectCarType.m
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/22.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//


#import "LTSelectCarTypeView.h"
#import "LTSelectCarModel.h"

@interface LTSelectCarTypeView()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UIView *tbHeaderView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end
@implementation LTSelectCarTypeView{
    CGFloat viewFromX;
    CGFloat beginX;
}

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        viewFromX = LTScreenWidth - frame.size.width;
        [self addSubview:self.tableView];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestView:)];
        [self addGestureRecognizer:pan];
    }
    return self;
}

- (UIView *)tbHeaderView{
    if (!_tbHeaderView){
        _tbHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 50)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 30, 30)];
        imageView.image = [UIImage imageNamed:@"icon_homepage_entertainmentCategory"];
        [_tbHeaderView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.size.width+imageView.frame.origin.x+15, 0, LTScreenWidth, CGRectGetHeight(_tbHeaderView.frame))];
        [label labelWithAttr:@"奥迪" color:COLOR_333333 font:12 textAlign:NSTextAlignmentCenter];
        [_tbHeaderView addSubview:label];
    }
    return _tbHeaderView;
}

- (UITableView *)tableView{
    if (!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, LTScreenWidth-viewFromX, LTScreenHeight-LT_TopHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.tbHeaderView;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"headerFooterView"];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray{
    _dataArray = [LTSelectCarTypeCarModel getCarType];
    return _dataArray;
}

#pragma mark UITableView
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    LTSelectCarTypeCarModel *model = self.dataArray[section];
    return model.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = @"奥迪";
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    LTSelectCarTypeCarModel *model = self.dataArray[section];
    NSString *typeName = model.typeName;
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerFooterView"];
    UILabel *label = [view viewWithTag:10];
    if (label == nil){
        label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.frame), 30)];
        label.tag = 10;
        [view addSubview:label];
    }
    [label labelWithAttr:typeName color:COLOR_333333 font:12 textAlign:NSTextAlignmentCenter];
    view.backgroundColor = [LTColorUtil colorWithHexString:COLOR_F2F2F2];
    return view;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(selectRowInLTSelectCarTypeView:)]){
        [self.delegate selectRowInLTSelectCarTypeView:indexPath];
    }
}

#pragma mark 手势事件,控制View的Origin.x
- (void)panGestView:(UIPanGestureRecognizer *)gest{
    CGPoint point = [gest locationInView:self];
    if (gest.state == UIGestureRecognizerStateBegan){
        beginX = point.x;
    }
    
    if (gest.state == UIGestureRecognizerStateChanged){
        CGRect frame = self.frame;
        CGFloat fromx = frame.origin.x + (point.x-beginX);
        if (fromx < viewFromX){
            fromx = viewFromX;
        }
        frame.origin.x = fromx;
        self.frame = frame;
    }
    
    if(gest.state == UIGestureRecognizerStateEnded){
        if (self.frame.origin.x > viewFromX + 100){
            [self annimationOriginX:@"hide"];
        }else{
            [UIView animateWithDuration:0.3 animations:^{
                CGRect frame = self.frame;
                CGFloat fromx = frame.origin.x;
                if (fromx > viewFromX){
                    fromx = viewFromX;
                }
                frame.origin.x = fromx;
                self.frame = frame;
            } completion:^(BOOL finished) {
                beginX = 0;
            }];
        }
    }
}

- (void) annimationOriginX:(NSString *)type{
        //还没有显示,就添加一个动画
    if ([@"hide" isEqualToString:type]){
        [UIView animateWithDuration:0.3 animations:^{
            [self setViewOrginX:LTScreenWidth];
            self.isFirstShow = YES;
        } completion:^(BOOL finished) {
            beginX = 0;
        }];
    }else if ([@"show" isEqualToString:type]){
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.frame;
            frame.origin.x = LTScreenWidth - CGRectGetWidth(self.frame);
            self.frame = frame;
        } completion:^(BOOL finished) {
            self.isFirstShow = NO;
        }];
    }
}

@end
