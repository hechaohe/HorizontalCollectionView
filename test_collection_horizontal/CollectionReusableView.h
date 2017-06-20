//
//  CollectionReusableView.h
//  test_collection_horizontal
//
//  Created by hc on 2017/6/20.
//  Copyright © 2017年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionReusableView : UICollectionReusableView

@property (nonatomic,strong) UILabel *topTitle;
@property (nonatomic,strong) UIButton *btn;

@property (nonatomic,copy) void (^btnBlock)();

@end
