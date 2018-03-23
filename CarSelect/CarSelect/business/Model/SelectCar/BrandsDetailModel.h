//
//  BrandsDetailModel.h
//  Day11-汽车之家
//
//  Created by Jian on 2016/11/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BrandsResultModel;
@interface BrandsDetailModel : NSObject
@property (nonatomic) NSString* message;
@property (nonatomic) BrandsResultModel* result;//
@property (nonatomic) NSString* returncode;
@end

@class BrandsFactoryitemsModel;
@interface BrandsResultModel : NSObject
@property (nonatomic) NSArray<BrandsFactoryitemsModel*>* factoryitems;
@end

@class BrandsSeriesitemsModel;
@interface BrandsFactoryitemsModel : NSObject
@property (nonatomic) NSString* firstletter;
@property (nonatomic) NSString* ID;//ID = id
@property (nonatomic) NSString* name;
@property (nonatomic) NSArray<BrandsSeriesitemsModel*>* seriesitems;//
@end

@interface BrandsSeriesitemsModel : NSObject
@property (nonatomic) NSString* firstletter;
@property (nonatomic) NSString* ID;//ID = id
@property (nonatomic) NSString* name;
@property (nonatomic) NSString* seriesorder;
@property (nonatomic) NSString* seriesstate;
@end






