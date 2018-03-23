//
//  LTSelectCarMainView.m
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/23.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//
#define kPicPath @"http://x.autoimg.cn/app/image/brands/%@.png"

#import "LTSelectCarMainView.h"
#import "ListCell.h"
#import "XuanCheNetManager.h"

@implementation LTSelectCarMainView

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        [self addSubview:self.tableView];
        
        [XuanCheNetManager getXuanCheListDataWithType:1 CompletionHandler:^(XuanCheDataModel *model, NSError *error) {
            if (!error)
            {
                self.allListModel = model.result.branditems;
                self.indexArray = [self indexArray:self.allListModel].mutableCopy;
                self.stortArray = [self sortArray:self.allListModel].mutableCopy;
                [self.indexArray insertObject:@"主" atIndex:0];
                [self.stortArray insertObject:@"" atIndex:0];
                self.allHotbrands = [XuanCheNetManager createFakeHotbrands];
                [_tableView reloadData];
            }
        }];
    }
    return self;
}

/***底部的tablView的相关方法 **/
-(UILabel *)sectionTitleView
{
    if (!_sectionTitleView)
    {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat heihgt = [UIScreen mainScreen].bounds.size.height;
        _sectionTitleView = [[UILabel alloc] initWithFrame:CGRectMake((width-100)/2,(heihgt-100)/2,100,100)];
        _sectionTitleView.textAlignment = NSTextAlignmentCenter;
        _sectionTitleView.font = [UIFont boldSystemFontOfSize:60];
        _sectionTitleView.textColor = [UIColor blackColor];
        _sectionTitleView.backgroundColor = [UIColor clearColor];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:_sectionTitleView];
    }
    return _sectionTitleView;
}

-(NSArray*)indexArray:(NSArray<branditemsModel*> *)array
{
    NSMutableArray *mArray = [NSMutableArray array];
    NSString *tempStr;
    for (branditemsModel *model in array){
        if (![tempStr isEqualToString:model.bfirstletter]){
            [mArray addObject:model.bfirstletter];
        }
        tempStr = model.bfirstletter;
    }
    return mArray;
}

//把汽车品牌model分类 放入 到二维数组中
-(NSArray*)sortArray:(NSArray<branditemsModel*> *)array{
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:self.indexArray.count];
    NSString *tempStr ;
    NSMutableArray *tempArr = [NSMutableArray array];
    for (branditemsModel *model in array){
        if (![tempStr isEqualToString:model.bfirstletter]){
            tempArr = [NSMutableArray array];
            [tempArr addObject:model];
            [mArray addObject:tempArr];
            tempStr = model.bfirstletter;
        }else{
            [tempArr addObject:model];
        }
    }
    return mArray;
}

- (UITableView *)tableView{
    if (!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.tableView registerClass:[ListCell class] forCellReuseIdentifier:NSStringFromClass([ListCell class])];
        [self.tableView registerClass:[HotbrandsCell class] forCellReuseIdentifier:NSStringFromClass([HotbrandsCell class])];
        //右边索引样式
        _tableView.sectionIndexColor = [UIColor blackColor];
        _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

#pragma mark - Table view 右侧index
//右侧索引的数组
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.indexArray;
}
//点击右侧索引后执行的代理方法
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    [self showSectionTitle:title];
    return index;
}
//居中显示大写字母框
-(void)showSectionTitle:(NSString*)title{
    [self.sectionTitleView setText:title];
    self.sectionTitleView.hidden = NO;
    self.sectionTitleView.alpha = 1;
    
    [self.timer invalidate];
    self.timer = nil;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerHandler:) userInfo:nil repeats:NO];
}
//定时器 显示大写字母框的时间
- (void)timerHandler:(NSTimer *)sender{
    [UIView animateWithDuration:.3 animations:^{
        self.sectionTitleView.alpha = 0;
    } completion:^(BOOL finished) {
        self.sectionTitleView.hidden = YES;
    }];
}

#pragma mark UITableView DataSource
//表头的显示
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *lab = [UILabel new];
    lab.backgroundColor = [UIColor groupTableViewBackgroundColor];
    lab.font = [UIFont systemFontOfSize:14];
    lab.text = [NSString stringWithFormat:@"  %@",self.indexArray[section]];
    if(section == 0 ) lab.text = @"热门品牌";
    lab.textColor = [UIColor blackColor];
    return lab;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return self.indexArray.count;;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0)  return 1;
    return [self.stortArray[section] count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section){
        case 0:
        {
            HotbrandsCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HotbrandsCell class])];
            for (NSInteger i = 0; i < self.allHotbrands.count; i++)
            {
                hotbrandsModel *model = self.allHotbrands[i];
                [cell.iconIVs[i] sd_setImageWithURL:[NSURL URLWithString:model.img]];
                cell.nameLBs[i].text = model.name;
            }
            return cell;
        }
        default:
        {
            ListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ListCell class]) forIndexPath:indexPath];
            branditemsModel *model = self.stortArray[indexPath.section][indexPath.row];
            cell.nameLB.text = model.name;
            NSURL *picURL = [NSURL URLWithString:[NSString stringWithFormat:kPicPath,model.ID]];
            [cell.iconIV sd_setImageWithURL:picURL];
            return cell;
        }
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0){
        return 150;
    }else{
        return 44;
    }
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_delegate respondsToSelector:@selector(selectRowInSelectCarMainView:)]){
        [_delegate selectRowInSelectCarMainView:indexPath];
    }
}
@end
