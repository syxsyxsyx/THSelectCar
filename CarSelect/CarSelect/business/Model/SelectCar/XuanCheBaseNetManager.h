//
//  XuanCheBaseNetManager.h
//  Day11-汽车之家
//
//  Created by Jian on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XuanCheBaseNetManager : NSObject

+ (id)get:(NSString *)path completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

@end
