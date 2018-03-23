//
//  ListCell.m
//  Day11-汽车之家
//
//  Created by Jian on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell

-(UIImageView *)iconIV
{
    if (!_iconIV)
    {
        _iconIV = [[UIImageView alloc]init];
        [self.contentView addSubview:_iconIV];
//        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(34, 34));
//            make.top.mas_equalTo(5);
//            make.left.mas_equalTo(5);
//            make.bottom.mas_equalTo(-5);
//        }];
    }
    return _iconIV;
}

-(UILabel *)nameLB
{
    if (!_nameLB)
    {
        _nameLB = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 200, 30)];
        [self.contentView addSubview:_nameLB];
    }
    return _nameLB;
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
