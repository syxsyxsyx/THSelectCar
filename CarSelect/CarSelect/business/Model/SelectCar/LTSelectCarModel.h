//
//  LTSelectCarModel.h
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/22.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTSelectCarModel : NSObject

@end


@interface LTSelectCarTypeCarModel : NSObject

@property (strong, nonatomic) NSString *typeName;
@property (strong, nonatomic) NSMutableArray *array;

+ (NSMutableArray *) getCarType;
@end
