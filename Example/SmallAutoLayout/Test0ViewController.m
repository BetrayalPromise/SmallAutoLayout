//
//  Test0ViewController.m
//  SmallAutoLayout_Example
//
//  Created by LiChunYang on 29/1/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "Test0ViewController.h"
#import <SmallAutoLayout/SmallAutoLayout.h>
#import "QMTVShowCell.h"

@interface Test0ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation Test0ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.view addSubview:collectionView];
    collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [collectionView registerClass:[QMTVShowCell class] forCellWithReuseIdentifier:NSStringFromClass([QMTVShowCell class])];
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
    QMTVShowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([QMTVShowCell class]) forIndexPath:indexPath];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 60;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(96, 100);
}
//定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


@end
