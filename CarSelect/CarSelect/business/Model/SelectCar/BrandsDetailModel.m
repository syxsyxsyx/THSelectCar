//
//  BrandsDetailModel.m
//  Day11-汽车之家
//
//  Created by Jian on 2016/11/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BrandsDetailModel.h"

@implementation BrandsDetailModel

@end

@implementation BrandsResultModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"factoryitems":[BrandsFactoryitemsModel class]};
}

@end

@implementation BrandsFactoryitemsModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"ID":@"id"};
}
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"seriesitems":[BrandsSeriesitemsModel class]};
}
@end

@implementation BrandsSeriesitemsModel

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"ID":@"id"};
}
@end
