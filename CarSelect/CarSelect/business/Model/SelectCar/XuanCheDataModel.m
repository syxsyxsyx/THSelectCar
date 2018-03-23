//
//  XuanCheDataModel.m
//  Day11-汽车之家
//
//  Created by Jian on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XuanCheDataModel.h"

@implementation XuanCheDataModel

@end

@implementation resultModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"branditems":[branditemsModel class]};
}
@end

@implementation branditemsModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"ID":@"id"};
}
@end

@implementation hotbrandsModel

@end

@implementation advertModel

@end


