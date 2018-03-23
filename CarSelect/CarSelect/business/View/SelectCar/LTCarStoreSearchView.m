//
//  LTCarStoreSearchView.m
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/22.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//

static const double SEARCHVIEW_TOP_OFFSET = 10;
static const double SEARCHVIEW_lEFT_OFFSET = 15;

#import "LTCarStoreSearchView.h"

@implementation LTCarStoreSearchView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [LTColorUtil colorWithHexString:COLOR_F2F2F2];
        [self createSearchUI];
        
        UITapGestureRecognizer *gest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickSearchView)];
         [self addGestureRecognizer:gest];
    }
    return self;
}

- (void)createSearchUI{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(SEARCHVIEW_lEFT_OFFSET, SEARCHVIEW_TOP_OFFSET, LTScreenWidth-SEARCHVIEW_lEFT_OFFSET*2, self.frame.size.height-SEARCHVIEW_TOP_OFFSET*2)];
    bgView.backgroundColor = [LTColorUtil colorWithHexString:COLOR_FFFFFF];
    bgView.layer.cornerRadius = 4;
    bgView.layer.masksToBounds = YES;
    [self addSubview:bgView];
}

- (void)clickSearchView{
    if ([self.delegate respondsToSelector:@selector(clickSearchView)]){
        [self.delegate clickSearchView];
    }
}
@end
