//
//  LTCarStoreSearchView.h
//  CamelElectricitySupplier
//
//  Created by kaiyitech on 2018/3/22.
//  Copyright © 2018年 luhua-mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LTCarStoreSearchViewDelegate<NSObject>

@optional
- (void) clickSearchView;
@end

@interface LTCarStoreSearchView : UIView

@property (strong, nonatomic) id<LTCarStoreSearchViewDelegate> delegate;

@end
