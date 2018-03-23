//
//  LTSelectCarInfoView.m
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/23.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//选中了某一品牌车的某一类型之后,选具体的排量，年份车型的的具体详情的View

const CGFloat TOP_TITLE_HEIGHT = 40;
const CGFloat LABEL_SPACINT = 15;

#import "LTSelectCarInfoView.h"
#import "LTSelectCarViewController.h"

@implementation LTSelectCarInfoView{
    NSArray *titleArray;
}

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        titleArray = @[@"选择发动机排量",@"选择生产年份",@"选择车型"];
        self.isFirstShow = YES;
        [self addSubview:self.topTileView];
        [_topTileView addSubview:self.labelOne];
        [_topTileView addSubview:self.labelTwo];
        [_topTileView addSubview:self.labelThree];
        [self addSubview:self.tableViewOne];
        [self addSubview:self.tableViewTwo];
        [self addSubview:self.tableViewThree];
    }
    return self;
}

- (UIView *)topTileView{
    if (!_topTileView){
        _topTileView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LTScreenWidth, TOP_TITLE_HEIGHT)];
        _topTileView.backgroundColor = [LTColorUtil colorWithHexString:COLOR_F2F2F2];
    }
    return _topTileView;
}

- (UILabel *)labelOne{
    if (!_labelOne){
        _labelOne = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, LTScreenWidth, TOP_TITLE_HEIGHT)];
        [_labelOne labelWithAttr:titleArray[0] color:COLOR_666666 font:12 textAlign:NSTextAlignmentLeft];
    }
    return _labelOne;
}

- (UILabel *)labelTwo{
    if (!_labelTwo){
        _labelTwo = [[UILabel alloc] initWithFrame:CGRectMake(LTScreenWidth, 0, LTScreenWidth, TOP_TITLE_HEIGHT)];
        [_labelTwo labelWithAttr:titleArray[1] color:COLOR_666666 font:12 textAlign:NSTextAlignmentLeft];
    }
    return _labelTwo;
}

- (UILabel *)labelThree{
    if (!_labelThree){
        _labelThree = [[UILabel alloc] initWithFrame:CGRectMake(LTScreenWidth, 0, LTScreenWidth, TOP_TITLE_HEIGHT)];
        [_labelThree labelWithAttr:titleArray[2] color:COLOR_666666 font:12 textAlign:NSTextAlignmentLeft];
    }
    return _labelThree;
}

- (LTSelectCarInfoTable *)tableViewOne{
    if (!_tableViewOne){
        _tableViewOne = [[LTSelectCarInfoTable alloc] initWithFrame:CGRectMake(0, TOP_TITLE_HEIGHT, LTScreenWidth, LTScreenHeight-TOP_TITLE_HEIGHT)];
        _tableViewOne.dataArray = @[@"1.2T",@"1.3T",@"1.4T",@"1.5T"].mutableCopy;
        _tableViewOne.isPanEnable = NO;
        _tableViewOne.delegate = self;
        _tableViewOne.tag = _tableViewOne.index = 1;
    }
    return _tableViewOne;
}

- (LTSelectCarInfoTable *)tableViewTwo{
    if (!_tableViewTwo){
        _tableViewTwo = [[LTSelectCarInfoTable alloc] initWithFrame:CGRectMake(LTScreenWidth, TOP_TITLE_HEIGHT, LTScreenWidth, LTScreenHeight-TOP_TITLE_HEIGHT)];
        _tableViewTwo.dataArray = @[@"2014",@"2015",@"2016",@"2017",@"2018"].mutableCopy;;
        _tableViewTwo.tag = _tableViewTwo.index =2;
        _tableViewTwo.delegate = self;
        _tableViewTwo.isPanEnable = YES;
    }
    return _tableViewTwo;
}

- (LTSelectCarInfoTable *)tableViewThree{
    if (!_tableViewThree){
        _tableViewThree = [[LTSelectCarInfoTable alloc] initWithFrame:CGRectMake(LTScreenWidth, TOP_TITLE_HEIGHT, LTScreenWidth, LTScreenHeight-TOP_TITLE_HEIGHT)];
        _tableViewThree.dataArray = @[@"2018款 30周年庆",@"2018款 30周年庆"].mutableCopy;;
        _tableViewThree.tag = _tableViewThree.index = 3;
        _tableViewThree.delegate = self;
        _tableViewThree.isPanEnable = YES;
    }
    return _tableViewThree;
}

- (void)selectRowInSelectCarInfoTable:(int)index indexPath:(NSIndexPath *)indexPath desc:(NSString *)desc{
    LTSelectCarInfoTable *infoTable = nil;
    if (index != 3){
        if (index == 1){
            [self setLabelAttr:_labelOne desc:desc textColor:COLOR_CF000E];
            [self setLabelAttr:_labelTwo desc:titleArray[1] textColor:COLOR_666666];
            [_labelTwo setViewOrginX:(LTScreenWidth+LABEL_SPACINT+GetViewRightOriginalX(_labelOne))];
        }else if (index == 2){
            [self setLabelAttr:_labelTwo desc:desc textColor:COLOR_CF000E];
            [self setLabelAttr:_labelThree desc:titleArray[2] textColor:COLOR_666666];
            [_labelThree setViewOrginX:(LTScreenWidth+LABEL_SPACINT+GetViewRightOriginalX(_labelTwo))];
        }
        infoTable = [self viewWithTag:(++index)];
        [UIView animateWithDuration:0.3 animations:^{
            [infoTable setViewOrginX:0];  //将origin.x赋值为0
            if (index == 2){
                [_labelTwo setViewOrginX:GetViewOriginalX(_labelTwo)-LTScreenWidth ];
            }else if(index == 3){
                [_labelThree setViewOrginX:GetViewOriginalX(_labelThree)-LTScreenWidth ];
            }
        }];
        [self changeParentViewControlBackIndex:@"add"];
    }else{
        NSLog(@"点击最后一个tableView");
    }
}

-(void)panViewInSelectCarInfoTable:(int)index indexPath:(NSIndexPath *)indexPath{
    [self changeParentViewControlBackIndex:@"reduce"];
    if (index == 2){
        [self setLabelAttr:_labelOne desc:titleArray[0] textColor:COLOR_666666];
        [_labelTwo setViewOrginX:GetViewOriginalX(_labelTwo)+LTScreenWidth ];
    }else if (index == 3){
        [self setLabelAttr:_labelTwo desc:titleArray[1] textColor:COLOR_666666];
        [_labelThree setViewOrginX:GetViewOriginalX(_labelThree)+LTScreenWidth ];
    }
}

- (void)animationOriginX:(NSString *)type{
    if ([@"hide" isEqualToString:type]){
        [UIView animateWithDuration:0.3 animations:^{
            [self setViewOrginX:LTScreenWidth];
        } completion:^(BOOL finished) {
            self.isFirstShow = YES;
        }];
    }else if ([@"show" isEqualToString:type]){
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.frame;
            frame.origin.x = LTScreenWidth - CGRectGetWidth(self.frame);
            self.frame = frame;
        }completion:^(BOOL finished) {
            self.isFirstShow = NO;
        }];
    }
}

- (void) animationOriginTableX:(NSString *)type backInde:(int)backIndex{
    LTSelectCarInfoTable *infoTable = nil;
    infoTable = [self viewWithTag:(--backIndex)];
    [UIView animateWithDuration:0.3 animations:^{
        [infoTable setViewOrginX:LTScreenWidth];  //将origin.x赋值为0
    }];
    [self panViewInSelectCarInfoTable:backIndex indexPath:nil];
}

- (void) setLabelAttr:(UILabel *)label desc:(NSString *)desc textColor:(NSString *)textColor{
    label.text = desc;
    label.textColor = [LTColorUtil colorWithHexString:textColor];
    [label setViewWidth:[label getLabelWidth:MAXFLOAT font:12 lineSpacing:0]];
}

- (void) changeParentViewControlBackIndex:(NSString *)type{
    //获取父视图的控制器,修改父视图回退变量;
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[LTSelectCarViewController class]]) {
            LTSelectCarViewController *selectCar = (LTSelectCarViewController *)nextResponder;
            if([@"add" isEqualToString:type]){
                selectCar.backIndex ++;
            }else{
                selectCar.backIndex --;
            }
            break;
        }
    }
}
@end
