//
//  Example3ViewController.m
//  SmallAutoLayout_Example
//
//  Created by 李阳 on 4/2/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "Example3ViewController.h"
#import <SmallAutoLayout/SmallAutoLayout.h>
#import "UICollectionViewLeftAlignedLayout.h"
#import "ExampleCell.h"
#import "HoverReusableView.h"
#import "QMTVFlowLayout.h"
#import "NSObject+FunctionExtension.h"

@interface Example3ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation Example3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewLeftAlignedLayout new]];
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[QMFlowLayout new] objcetThen:^(QMFlowLayout * _Nonnull source) {
        source.navigationHeight = 0;
    }]];
//    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[QMTVHoverFlowLayout new]];
    collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [collectionView registerClass:[ExampleCell class] forCellWithReuseIdentifier:NSStringFromClass([ExampleCell class])];
    [collectionView registerClass:[HoverReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([HoverReusableView class])];
    [self.view addSubview:collectionView];

    if (@available(iOS 11.0, *)) {
        collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView.layout.top equalTo:self.view.layout.safeAreaLayoutGuide.top];
    [collectionView.layout.left equalTo:self.view.layout.safeAreaLayoutGuide.left];
    [collectionView.layout.bottom equalTo:self.view.layout.safeAreaLayoutGuide.bottom];
    [collectionView.layout.right equalTo:self.view.layout.safeAreaLayoutGuide.right];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ExampleCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ExampleCell class]) forIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView  *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    HoverReusableView * v = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        v = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([HoverReusableView class]) forIndexPath:indexPath];
    }
    return v;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    collectionViewLayout = [UICollectionViewLeftAlignedLayout new];
    if (indexPath.row % 5 == 1) {
        return CGSizeMake(collectionView.frame.size.width, 50);
    }
    return CGSizeMake(60, 50);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(collectionView.frame.size.width - 20, 50);
}

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(10, 10, 10, 10);
//}

@end
