//
//  QMTVViewController.m
//  SmallAutoLayout
//
//  Created by BetrayalPromise on 01/29/2018.
//  Copyright (c) 2018 BetrayalPromise. All rights reserved.
//


#import "QMTVViewController.h"
#import <SmallAutoLayout/SmallAutoLayout.h>
#import "Example0ViewController.h"
#import "Example1ViewController.h"
#import "Example2ViewController.h"
#import "Example3ViewController.h"
#import "NSObject+FunctionExtension.h"
#import "Example4ViewController.h"
#import "Example5ViewController.h"

@interface QMTVViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray * datasource;

@end

@implementation QMTVViewController

- (void)loadView {
    [super loadView];
    _datasource = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    [self.view addSubview:tableView];
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [tableView.Top equalTo:self.view.SafeAreaGuide.Top];
    [tableView.Left equalTo:self.view.SafeAreaGuide.Left];
    [tableView.Bottom equalTo:self.view.SafeAreaGuide.Bottom];
    [tableView.Right equalTo:self.view.SafeAreaGuide.Right];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = _datasource[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datasource.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[[Example0ViewController new] objcetThen:^(Example0ViewController *  _Nonnull source) {
            source.title = @"SafeArea 适配";
        }] animated:YES];
    } else if (indexPath.row == 1) {
        [self.navigationController pushViewController:[[Example1ViewController new] objcetThen:^(Example0ViewController *  _Nonnull source) {
            source.title = @"LayoutGuide 适配";
        }] animated:YES];
    } else if (indexPath.row == 2) {
        [self.navigationController pushViewController:[Example2ViewController new] animated:YES];
    } else if (indexPath.row == 3) {
        [self.navigationController pushViewController:[[Example3ViewController new] objcetThen:^(Example3ViewController * _Nonnull source) {
            source.title = @"UICollectionView";
        }] animated:YES];
    } else if (indexPath.row == 4) {
        [self.navigationController pushViewController:[[Example4ViewController new] objcetThen:^(Example4ViewController * _Nonnull source) {
            source.title = @"LayoutGuide Default Value";
        }] animated:YES];
    } else if (indexPath.row == 5) {
        [self.navigationController pushViewController:[[Example5ViewController new] objcetThen:^(Example5ViewController * _Nonnull source) {
            source.title = @"SafeArea Default Value";
        }] animated:YES];
    }
}

@end
