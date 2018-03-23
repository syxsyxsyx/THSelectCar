//
//  LTNavigationView.m
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/22.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//


const int VIEWFROM_LEFT = 50;

#import "LTNavigationView.h"


@implementation LTNavigationView

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        [self createNaviUI];
    }
    return self;
}

- (void) createNaviUI{

    [self addSubview:self.middelView];
    [_middelView addSubview:self.leftBtn];
    [_middelView addSubview:self.rightBtn];
}

- (UIView *)middelView{
    if (!_middelView){
        _middelView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, LTScreenWidth-VIEWFROM_LEFT*2, 34)];
        _middelView.backgroundColor = [LTColorUtil colorWithHexString:COLOR_FFFFFF];
        _middelView.layer.masksToBounds = YES;
        _middelView.layer.cornerRadius = 4;
    }
    return _middelView;
}

- (UIButton *)leftBtn{
    if (!_leftBtn){
        _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.5, 0.5, (_middelView.frame.size.width-1)/2, _middelView.frame.size.height-1)];
        [_leftBtn setTitle:@"自助选车" forState:UIControlStateNormal];
        [self initBtnStytle:_leftBtn];
        _leftBtn.tag = 1;
        [_leftBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        _leftBtn.selected = YES;
    }
    return _leftBtn;
}

- (UIButton *)rightBtn{
    if (!_rightBtn){
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(_leftBtn.frame), _leftBtn.frame.origin.y, CGRectGetWidth(_leftBtn.frame), CGRectGetHeight(_leftBtn.frame))];
        _rightBtn.tag = 2;
        [_rightBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_rightBtn setTitle:@"扫行驶证选车" forState:UIControlStateNormal];
        [self initBtnStytle:_rightBtn];
    }
    return _rightBtn;
}

- (void)clickBtn:(UITapGestureRecognizer *)gest{
   NSInteger tag =  ((UIButton *)gest).tag;
    if (tag == 1){
        _leftBtn.selected = YES;
        _rightBtn.selected = NO;
    }else{
        _rightBtn.selected = YES;
        _leftBtn.selected = NO;
    }
}

-(void) initBtnStytle :(UIButton *)btn{
    [btn setAdjustsImageWhenHighlighted:NO];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [btn setTitleColor:[LTColorUtil colorWithHexString:COLOR_CF000E] forState:UIControlStateSelected];
    [btn setBackgroundImage:[LTColorUtil createImageWithColor:COLOR_FFFFFF] forState:UIControlStateSelected];
    
    [btn setTitleColor:[LTColorUtil colorWithHexString:COLOR_FFFFFF] forState:UIControlStateNormal];
    [btn setBackgroundImage:[LTColorUtil createImageWithColor:COLOR_CF000E] forState:UIControlStateNormal];
}

@end
