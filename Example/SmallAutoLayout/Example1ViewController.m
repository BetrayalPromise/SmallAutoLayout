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
    [v0.layout.centerX equalTo:self.view.layout.centerX];
    [v0.layout.centerY equalTo:self.view.layout.centerY];
    [v0.layout.width equalTo:nil trim:100];
    [v0.layout.height equalTo:nil trim:100];
    NSLog(@"%@", v0.layout);

    id a = v0.layout;

    UIView * v1 = [UIView new];
    [self.view addSubview:v1];
    v1.translatesAutoresizingMaskIntoConstraints = NO;
    v1.backgroundColor = [UIColor redColor];
    [v1.layout.width equalTo:nil trim:100];
    [v1.layout.height equalTo:nil trim:100];
    [v1.layout.centerY equalTo:v0.layout.centerY];
    [v0.layout.left equalTo:v1.layout.right trim:10];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
