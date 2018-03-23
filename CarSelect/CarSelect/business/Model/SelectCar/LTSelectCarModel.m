//
//  LTSelectCarModel.m
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/22.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//

#import "LTSelectCarModel.h"

@implementation LTSelectCarModel

@end

@implementation LTSelectCarTypeCarModel

+ (NSMutableArray *) getCarType{
    NSMutableArray *array = @[].mutableCopy;
    for (int i = 0;i < 10;i ++){
        LTSelectCarTypeCarModel *model = [[LTSelectCarTypeCarModel alloc] init];
        model.typeName = [NSString stringWithFormat:@"奥迪%d",i];
        NSMutableArray *array1 = @[].mutableCopy;
        for (int j = 10;j < 15;j ++){
            [array1 addObject:[NSString stringWithFormat:@"奥迪%d",j]];
        }
        model.array = array1;
        [array addObject:model];
    }
    return array;
}
@end
