//
//  Example7ViewController.m
//  SmallAutoLayout_Example
//
//  Created by LiChunYang on 19/7/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "Example7ViewController.h"
#import <SmallAutoLayout/SmallAutoLayout.h>
#import "ExampleCell.h"

@interface Example7ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray <NSString *> * datas;

@end

@implementation Example7ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _datas = @[@"dfadfadfadfasdfasfda", @"dfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfda",  @"dfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfda" @"dfadfadfadfasdfasfdadfadfadfadfasdfasfdadfadfadfadfasdfasfda"];
    
    UITableView * table = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
    [self.view addSubview:table];
    
//    table.translatesAutoresizingMaskIntoConstraints = NO;
    table.delegate = self;
    table.dataSource = self;
    [table registerClass:[ExampleCell class] forCellReuseIdentifier:NSStringFromClass([ExampleCell class])];
    if (@available(iOS 11.0, *)) {
        [table.top$ equalTo:self.view.safeAreaGuide$.top$];
        [self.view.safeAreaGuide$.left$ equalTo:table];
        [self.view.safeAreaGuide$.bottom$ equalTo:table];
        [table.right$ equalTo:self.view.safeAreaGuide$];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExampleCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ExampleCell class])];
    [cell configureModel:_datas[indexPath.row]];
    return cell;
}

@end
