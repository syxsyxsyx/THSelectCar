//
//  XuanCheDataModel.h
//  Day11-汽车之家
//
//  Created by Jian on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class resultModel;

@interface XuanCheDataModel : NSObject
@property (nonatomic) NSString * message;
@property (nonatomic) resultModel* result;//
@property (nonatomic) NSString* returncode;
@end

@class branditemsModel;
@interface resultModel : NSObject
@property (nonatomic) NSArray<branditemsModel*>* branditems;//
@end

@interface branditemsModel : NSObject
@property (nonatomic) NSString* bfirstletter;
@property (nonatomic) NSString* ID;//ID = id
@property (nonatomic) NSString* name;
@end

@interface hotbrandsModel : NSObject

@property (nonatomic) NSString* firstletter;
@property (nonatomic) NSString* ID;
@property (nonatomic) NSString* img;
@property (nonatomic) NSString* name;
@property (nonatomic) NSString* ordercount;
@end

/*
 "firstletter": "D",
 "id": 1,
 "img": "http://x.autoimg.cn/app/image/brands/1.png",
 "name": "大众",
 "ordercount": 733181
 */

@interface advertModel : NSObject

@property (nonatomic) NSString* seriesname;
@property (nonatomic) NSString* img;

@end

/*
 "seriesname": "力帆迈威",
 "img": "http://adm3.autoimg.cn/admdfs/g13/M04/84/A8/wKjBylgPGQCAB7nNAACIEjtXKmk513.png",

 */


