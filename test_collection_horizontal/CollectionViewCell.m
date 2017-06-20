//
//  CollectionViewCell.m
//  test_collection_horizontal
//
//  Created by hc on 2017/6/19.
//  Copyright © 2017年 hc. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    [self.didClick addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}
- (void)click {
    
    !self.clickBlock ? : self.clickBlock();

}
@end
