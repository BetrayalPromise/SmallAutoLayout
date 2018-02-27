//
//  Example4ViewController.m
//  SmallAutoLayout_Example
//
//  Created by 李阳 on 27/2/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "Example4ViewController.h"
#import <SmallAutoLayout/SmallAutoLayout.h>

@interface Example4ViewController ()

@end

@implementation Example4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    UIView * v0 = [UIView new];
    [self.view addSubview:v0];
    v0.translatesAutoresizingMaskIntoConstraints = NO;
    v0.backgroundColor = [UIColor redColor];

    [self.layout.topLayoutGuide.bottom equalTo:v0];
    [v0.layout.centerX equalTo:self.view multiply:1];
    [v0.layout.width equalTo:nil trim:100];
    [v0.layout.height equalTo:v0.layout.width];

    UIView * v1 = [UIView new];
    [self.view addSubview:v1];
    v1.translatesAutoresizingMaskIntoConstraints = NO;
    v1.backgroundColor = [UIColor redColor];
    [self.layout.bottomLayoutGuide.top equalTo:v1];
    [v1.layout.centerX equalTo:self.view multiply:1];
    [v1.layout.width equalTo:nil trim:100];
    [v1.layout.height equalTo:v1.layout.width];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
