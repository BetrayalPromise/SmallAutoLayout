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
#import "Example8ViewController.h"

@interface QMTVViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray * datasource;

@end

@implementation QMTVViewController

- (void)loadView {
    [super loadView];
    _datasource = @[@"SafeArea", @"LayouGuide", @"View Center", @"View SafeArea Center", @"Default Value", @"View Size", @"View SafeArea Size", @"Cell", @"复合属性支持"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    [self.view addSubview:tableView];
//    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    if (@available(iOS 11.0, *)) {
        [tableView.safeAreaGuide$.top$ equalTo:self.view.safeAreaGuide$.top$];
        [tableView.left$ equalTo:self.view.safeAreaGuide$.left$];
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
            source.title = @"SafeArea适配";
        }] animated:YES];
    } else if (indexPath.row == 1) {
        [self.navigationController pushViewController:[[Example1ViewController new] objcetThen:^(Example0ViewController *  _Nonnull source) {
            source.title = @"LayoutGuide适配";
        }] animated:YES];
    } else if (indexPath.row == 2) {
        [self.navigationController pushViewController:[[Example2ViewController new] objcetThen:^(Example2ViewController * _Nonnull source) {
            source.title = @"视图中心";
        }] animated:YES];
    } else if (indexPath.row == 3) {
        [self.navigationController pushViewController:[[Example3ViewController new] objcetThen:^(Example3ViewController * _Nonnull source) {
            source.title = @"视图SafeArea中心";
        }] animated:YES];
    } else if (indexPath.row == 4) {
        [self.navigationController pushViewController:[[Example4ViewController new] objcetThen:^(Example4ViewController * _Nonnull source) {
            source.title = @"缺省值处理";
        }] animated:YES];
    } else if (indexPath.row == 5) {
        [self.navigationController pushViewController:[[Example5ViewController new] objcetThen:^(Example5ViewController * _Nonnull source) {
            source.title = @"视图尺寸";
        }] animated:YES];
    } else if (indexPath.row == 6) {
        [self.navigationController pushViewController:[[Example6ViewController new] objcetThen:^(Example6ViewController * _Nonnull source) {
            source.title = @"视图安全区尺寸";
        }] animated:YES];
    } else if (indexPath.row == 7) {
        [self.navigationController pushViewController:[[Example7ViewController new] objcetThen:^(Example7ViewController * _Nonnull source) {
            source.title = @"Cell适配";
        }] animated:YES];
    } else if (indexPath.row == 8) {
        [self.navigationController pushViewController:[[Example8ViewController new] objcetThen:^(Example8ViewController * _Nonnull source) {
            source.title = @"符合属性size";
        }] animated:YES];
    }
}

@end
