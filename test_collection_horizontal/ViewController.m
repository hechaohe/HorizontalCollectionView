//
//  ViewController.m
//  test_collection_horizontal
//
//  Created by hc on 2017/6/19.
//  Copyright © 2017年 hc. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "CollectionReusableView.h"

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,assign) NSUInteger xxx;

@property (nonatomic,strong) NSArray *arr1;
@property (nonatomic,strong) NSArray *arr2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _xxx = 1;
    _arr1 = @[@"张三",@"李四",@"王五",@"赵六"];
    _arr2 = @[@"荔枝",@"苹果"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30) collectionViewLayout:flowLayout];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
    
    [self.collectionView registerClass:[CollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark -- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (_xxx == 1) {
        return _arr1.count;
    } else {
        return _arr2.count;
    }
   
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
     __weak CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    
    
    if (_xxx == 1) {
        cell.title.text = [_arr1 objectAtIndex:indexPath.row];
    } else {
        cell.title.text = [_arr2 objectAtIndex:indexPath.row];
    }
//    cell.lineView.hidden = YES;
    
    
    
    cell.clickBlock = ^{
        if ([cell.title.text isEqualToString:@"张三"]) {
//            cell.lineView.hidden = !cell.lineView.hidden;
            
            NSLog(@"今天天气不错");
        }
        if ([cell.title.text isEqualToString:@"李四"]) {
//            cell.lineView.hidden = !cell.lineView.hidden;
            NSLog(@"明天天气不错");
        }
        if ([cell.title.text isEqualToString:@"王五"]) {
//            cell.lineView.hidden = !cell.lineView.hidden;
            NSLog(@"后天天气不错");
        }
        if ([cell.title.text isEqualToString:@"赵六"]) {
//            cell.lineView.hidden = !cell.lineView.hidden;
            NSLog(@"大后天天气不错");
        }
        if ([cell.title.text isEqualToString:@"荔枝"]) {
            NSLog(@"荔枝很好吃");
        }
        if ([cell.title.text isEqualToString:@"苹果"]) {
            NSLog(@"苹果快熟了");
            _xxx = 1;
            [self.collectionView reloadData];
        }
        
    };
    
    return cell;
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        CollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        if (_xxx == 1) {
            view.topTitle.text = @"HAHAHA";
        } else {
            view.topTitle.text = @"王八";
        }
        
        
        view.btnBlock = ^{
            NSLog(@"hehe");
            _xxx = 2;
//            view.topTitle.text = @"王八";
            [self.collectionView reloadData];
        };
        
        reusableView = view;
    }
    return reusableView;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"...");
}

#pragma mark -- UICollectionViewFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 30);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(100, 30);
}





@end
