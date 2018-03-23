//
//  XuanCheBaseNetManager.m
//  Day11-汽车之家
//
//  Created by Jian on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XuanCheBaseNetManager.h"

@implementation XuanCheBaseNetManager
+ (id)get:(NSString *)path completionHandler:(void (^)(id, NSError *))completionHandler{
    NSOperationQueue *queue = [NSOperationQueue currentQueue];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:path] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        [queue addOperationWithBlock:^{
            if (error) {
                !completionHandler ?: completionHandler(nil, error);
            }else{
                NSError *err = nil;
                
                NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
                NSString* strdata = [[NSString alloc]initWithData:data encoding:enc];
                NSData * data2 = [strdata dataUsingEncoding:NSUTF8StringEncoding];
                
                id obj = [NSJSONSerialization JSONObjectWithData:data2 options:(NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments|NSJSONReadingMutableContainers) error:&err];
                if (err) {
                    !completionHandler ?: completionHandler(nil, err);
                }else{
                    !completionHandler ?: completionHandler(obj, nil);
                }
            }
        }];
    }];
    [task resume];
    return task;
}

@end
