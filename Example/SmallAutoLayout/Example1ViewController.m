//
//  Example1ViewController.m
//  SmallAutoLayout_Example
//
//  Created by 李阳 on 29/1/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "Example1ViewController.h"
#import <SmallAutoLayout/SmallAutoLayout.h>

@interface Example1ViewController ()

@end

@implementation Example1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIView * v0 = [UIView new];
    [self.view addSubview:v0];
    v0.translatesAutoresizingMaskIntoConstraints = NO;
    v0.backgroundColor = [UIColor redColor];
    [self.layout.topLayoutGuide.top equalTo:v0.layout.top];
    [v0.layout.centerX equalTo:self.view.layout.centerX multiply:0.5];
    [v0.layout.width equalTo:nil trim:100];
    [v0.layout.height equalTo:nil trim:100];


    UIView * v1 = [UIView new];
    [self.view addSubview:v1];
    v1.translatesAutoresizingMaskIntoConstraints = NO;
    v1.backgroundColor = [UIColor redColor];
    [v1.layout.top equalTo:self.layout.topLayoutGuide.bottom];
    [v1.layout.centerX equalTo:self.view.layout.centerX multiply:1.5];
    [v1.layout.width equalTo:nil trim:100];
    [v1.layout.height equalTo:nil trim:100];

    UIView * v2 = [UIView new];
    [self.view addSubview:v2];
    v2.translatesAutoresizingMaskIntoConstraints = NO;
    v2.backgroundColor = [UIColor redColor];
    [self.layout.bottomLayoutGuide.bottom equalTo:v2.layout.bottom];
    [v2.layout.centerX equalTo:self.view.layout.centerX multiply:0.5];
    [v2.layout.width equalTo:nil trim:100];
    [v2.layout.height equalTo:nil trim:100];

    UIView * v3 = [UIView new];
    [self.view addSubview:v3];
    v3.translatesAutoresizingMaskIntoConstraints = NO;
    v3.backgroundColor = [UIColor redColor];
    [v3.layout.bottom equalTo:self.layout.bottomLayoutGuide.top];
    [v3.layout.centerX equalTo:self.view.layout.centerX multiply:1.5];
    [v3.layout.width equalTo:nil trim:100];
    [v3.layout.height equalTo:nil trim:100];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
