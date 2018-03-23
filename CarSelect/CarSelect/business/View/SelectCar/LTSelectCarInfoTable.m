//
//  LTSelectCarInfoTableView.m
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/23.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//

#import "LTSelectCarInfoTable.h"

@implementation LTSelectCarInfoTable{
    CGFloat beginX;
}

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        [self addPanGest];
        [self addSubview:self.tableView];
    }
    return self;
}

- (UITableView *)tableView{
    if (!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark UITableView

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(selectRowInSelectCarInfoTable:indexPath:desc:)]){
        [self.delegate selectRowInSelectCarInfoTable:_index indexPath:indexPath desc:_dataArray[indexPath.row]];
    }
}

#pragma mark PanGest
- (void)addPanGest{
    UIPanGestureRecognizer *gest = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self addGestureRecognizer:gest];
}

- (void) panAction:(UIPanGestureRecognizer *)gest{
    if (_isPanEnable){
        CGPoint point = [gest locationInView:self];
        if (gest.state == UIGestureRecognizerStateBegan){
            beginX = point.x;
        }
        
        if (gest.state == UIGestureRecognizerStateChanged){
            CGRect frame = self.frame;
            CGFloat originX = frame.origin.x + (point.x - beginX);
            if (originX <= 0){
                originX = 0;
            }
            frame.origin.x = originX;
            self.frame = frame;
        }
        
        if (gest.state == UIGestureRecognizerStateEnded){
            CGFloat x = 0;
            if (self.frame.origin.x > LTScreenWidth/3){
                x = LTScreenWidth;
                if ([self.delegate respondsToSelector:@selector(panViewInSelectCarInfoTable:indexPath:)]){
                    [self.delegate panViewInSelectCarInfoTable:_index indexPath:nil];
                }
            }
            [UIView animateWithDuration:0.3 animations:^{
                CGRect frame = self.frame;
                frame.origin.x = x;
                self.frame = frame;
            } completion:^(BOOL finished) {
            }];
        }
    }
}

@end
