//
//  XuanCheNetManager.m
//  Day11-汽车之家
//
//  Created by Jian on 2016/11/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XuanCheNetManager.h"

#define kXuanCheListPath @"http://www.autohome.com.cn/ashx/AjaxIndexCarFind.ashx?type=%ld"
#define kBrandsDetailPath @"http://www.autohome.com.cn//ashx/AjaxIndexCarFind.ashx?type=3&value=%@"

@implementation XuanCheNetManager

+(id)getXuanCheListDataWithType:(NSInteger)type CompletionHandler:(void (^)(XuanCheDataModel *, NSError *))completionHandler
{
    NSString *path = [NSString stringWithFormat:kXuanCheListPath,type];
    return [self get:path completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler ([XuanCheDataModel yy_modelWithJSON:responseObj],error);
    }];
}


+(NSArray*)createFakeHotbrands
{
    hotbrandsModel *model1 = [[hotbrandsModel alloc]init];
    model1.firstletter = @"D";
    model1.ID = @"1";
    model1.img = @"http://x.autoimg.cn/app/image/brands/1.png";
    model1.name = @"大众";
    model1.ordercount = @"733181";
    
    hotbrandsModel *model2 = [[hotbrandsModel alloc]init];
    model2.firstletter = @"B";
    model2.ID = @"14";
    model2.img = @"http://x.autoimg.cn/app/image/brands/14.png";
    model2.name = @"本田";
    model2.ordercount = @"428686";
    
    hotbrandsModel *model3 = [[hotbrandsModel alloc]init];
    model3.firstletter = @"F";
    model3.ID = @"3";
    model3.img = @"http://x.autoimg.cn/app/image/brands/3.png";
    model3.name = @"丰田";
    model3.ordercount = @"287106";
    
    hotbrandsModel *model4 = [[hotbrandsModel alloc]init];
    model4.firstletter = @"J";
    model4.ID = @"25";
    model4.img = @"http://x.autoimg.cn/app/image/brands/25.png";
    model4.name = @"吉利汽车";
    model4.ordercount = @"263229";
    
    hotbrandsModel *model5 = [[hotbrandsModel alloc]init];
    model5.firstletter = @"X";
    model5.ID = @"12";
    model5.img = @"http://x.autoimg.cn/app/image/brands/12.png";
    model5.name = @"现代";
    model5.ordercount = @"257732";
    
    hotbrandsModel *model6 = [[hotbrandsModel alloc]init];
    model6.firstletter = @"H";
    model6.ID = @"181";
    model6.img = @"http://x.autoimg.cn/app/image/brands/181.png";
    model6.name = @"哈弗";
    model6.ordercount = @"217830";
    
    hotbrandsModel *model7 = [[hotbrandsModel alloc]init];
    model7.firstletter = @"F";
    model7.ID = @"8";
    model7.img = @"http://x.autoimg.cn/app/image/brands/8.png";
    model7.name = @"福特";
    model7.ordercount = @"208638";
    
    hotbrandsModel *model8 = [[hotbrandsModel alloc]init];
    model8.firstletter = @"R";
    model8.ID = @"63";
    model8.img = @"http://x.autoimg.cn/app/image/brands/63.png";
    model8.name = @"日产";
    model8.ordercount = @"199864";
    
    hotbrandsModel *model9 = [[hotbrandsModel alloc]init];
    model9.firstletter = @"A";
    model9.ID = @"33";
    model9.img = @"http://x.autoimg.cn/app/image/brands/33.png";
    model9.name = @"奥迪";
    model9.ordercount = @"194069";
    
    hotbrandsModel *model10 = [[hotbrandsModel alloc]init];
    model10.firstletter = @"B";
    model10.ID = @"38";
    model10.img = @"http://x.autoimg.cn/app/image/brands/38.png?r=38";
    model10.name = @"别克";
    model10.ordercount = @"179284";
    
    return @[model1,model2,model3,model4,model5,model6,model7,model8,model9,model10];
}

@end
