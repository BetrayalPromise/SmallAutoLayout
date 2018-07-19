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
#import "Example6ViewController.h"
#import "Example7ViewController.h"

@interface QMTVViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray * datasource;

@end

@implementation QMTVViewController

- (void)loadView {
    [super loadView];
    _datasource = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    [self.view addSubview:tableView];
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    if (@available(iOS 11.0, *)) {
        [tableView.safeAreaGuide$.top$ equalTo:self.view.safeAreaGuide$.top$];
        [tableView.safeAreaGuide$.left$ equalTo:self.view.safeAreaGuide$.left$];
        [tableView.safeAreaGuide$.bottom$ equalTo:self.view.safeAreaGuide$.bottom$];
        [tableView.safeAreaGuide$.right$ equalTo:self.view.safeAreaGuide$.right$];
    } else {
        [tableView.top$ equalTo:self.bottomGuide$.bottom$];
        [tableView.left$ equalTo:self.view.left$];
        [tableView.bottom$ equalTo:self.bottomGuide$.top$];
        [tableView.right$ equalTo:self.view.right$];
    }
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
    } else if (indexPath.row == 6) {
        [self.navigationController pushViewController:[[Example6ViewController new] objcetThen:^(Example5ViewController * _Nonnull source) {
            source.title = @"SafeArea Default Value";
        }] animated:YES];
    } else if (indexPath.row == 7) {
        [self.navigationController pushViewController:[[Example7ViewController new] objcetThen:^(Example5ViewController * _Nonnull source) {
            source.title = @"SafeArea Default Value";
        }] animated:YES];
    }
}

@end
