//
//  HotbrandsCell.m
//  Day11-汽车之家
//
//  Created by Jian on 2016/11/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HotbrandsCell.h"

@implementation HotbrandsCell

-(NSMutableArray<UIView *> *)allViews
{
    if (!_allViews)
    {
        _allViews = [NSMutableArray array];
        CGFloat width = (CGFloatToDoulbe([UIScreen mainScreen].bounds.size.width)/5.0);
        for (NSInteger i = 0; i < 10; i ++)
        {
            
            CGFloat left = width * (i % 5);
            CGFloat top = width*(i / 5);
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(left, top,  width,  width)];
            [self.contentView addSubview:view];
        
            [_allViews addObject:view];
        }
    }
    return _allViews;
}

-(NSMutableArray<UIImageView *> *)iconIVs
{
    if (!_iconIVs)
    {
        _iconIVs = [NSMutableArray array];
        CGFloat width = (long)([UIScreen mainScreen].bounds.size.width/5.0) - 20;
        for (NSInteger i = 0; i < self.allViews.count; i++)
        {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0,width, width)];
            [self.allViews[i] addSubview:imageView];
            [_iconIVs addObject:imageView];
        }
    }
    return _iconIVs;
}

-(NSMutableArray<UILabel *> *)nameLBs
{
    if (!_nameLBs)
    {
        _nameLBs = [NSMutableArray array];
        for (NSInteger i = 0; i < self.allViews.count; i++)
        {
            CGFloat width = (long)([UIScreen mainScreen].bounds.size.width/5.0) - 20;
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.iconIVs[i].frame.size.height+self.iconIVs[i].frame.origin.y, 10, width, 20)];
            label.font = [UIFont systemFontOfSize:13];
            label.textColor = [UIColor grayColor];
            label.textAlignment = NSTextAlignmentCenter;
            [_nameLBs addObject:label];
        }
    }
    return _nameLBs;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
