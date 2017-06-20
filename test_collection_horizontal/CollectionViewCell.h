//
//  CollectionViewCell.h
//  test_collection_horizontal
//
//  Created by hc on 2017/6/19.
//  Copyright © 2017年 hc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIButton *didClick;

@property (nonatomic,copy) void (^clickBlock)();
@end
