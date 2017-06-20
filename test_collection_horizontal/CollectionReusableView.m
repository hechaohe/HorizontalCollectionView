//
//  CollectionReusableView.m
//  test_collection_horizontal
//
//  Created by hc on 2017/6/20.
//  Copyright © 2017年 hc. All rights reserved.
//

#import "CollectionReusableView.h"

@implementation CollectionReusableView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.topTitle = [[UILabel alloc] init];
        self.topTitle.text = @"XXXXX";
        self.topTitle.textColor = [UIColor brownColor];
        self.topTitle.frame = CGRectMake(15, 0, 100, 30);
        [self addSubview:_topTitle];
        self.backgroundColor = [UIColor whiteColor];
        
        
        self.btn = [UIButton buttonWithType:0];
        self.btn.frame = CGRectMake(15, 0, 100, 30);
        [self addSubview:_btn];
        [_btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return self;
    
}
- (void)btnAction {
    
    !self.btnBlock ? : self.btnBlock();
    
}

@end
