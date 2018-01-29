//
//  QMTVViewController.m
//  SmallAutoLayout
//
//  Created by BetrayalPromise on 01/29/2018.
//  Copyright (c) 2018 BetrayalPromise. All rights reserved.
//


#import "QMTVViewController.h"
#import <SmallAutoLayout/SmallAutoLayout.h>
#import "Test0ViewController.h"
#import "Example0ViewController.h"
#import "Example1ViewController.h"

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
    [tableView.layout.top equalTo:self.view.layout.safeAreaLayoutGuide.top];
    [tableView.layout.left equalTo:self.view.layout.safeAreaLayoutGuide.left];
    [tableView.layout.bottom equalTo:self.view.layout.safeAreaLayoutGuide.bottom];
    [tableView.layout.right equalTo:self.view.layout.safeAreaLayoutGuide.right];
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
        [self.navigationController pushViewController:[Test0ViewController new] animated:YES];
    } else if (indexPath.row == 1) {
        [self.navigationController pushViewController:[Example0ViewController new] animated:YES];
    } else if (indexPath.row == 2) {
        [self.navigationController pushViewController:[Example1ViewController new] animated:YES];
    }
}

@end
