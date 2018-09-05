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
//    v0.translatesAutoresizingMaskIntoConstraints = NO;
    v0.backgroundColor = [UIColor redColor];
    [self.topGuide$.top$ equalTo:v0.top$];
    [v0.centerX$ equalTo:self.view.centerX$ rate:0.5];
    [v0.width$ equalTo:nil trim:100];
    [v0.height$ equalTo:nil trim:100];


    UIView * v1 = [UIView new];
    [self.view addSubview:v1];
//    v1.translatesAutoresizingMaskIntoConstraints = NO;
    v1.backgroundColor = [UIColor redColor];
    [v1.top$ equalTo:self.topGuide$.bottom$];
    [v1.centerX$ equalTo:self.view.centerX$ rate:1.5];
    [v1.width$ equalTo:nil trim:100];
    [v1.height$ equalTo:nil trim:100];

    UIView * v2 = [UIView new];
    [self.view addSubview:v2];
//    v2.translatesAutoresizingMaskIntoConstraints = NO;
    v2.backgroundColor = [UIColor redColor];
    [self.bottomGuide$.bottom$ equalTo:v2.bottom$];
    [v2.centerX$ equalTo:self.view.centerX$ rate:0.5];
    [v2.width$ equalTo:nil trim:100];
    [v2.height$ equalTo:nil trim:100];

    UIView * v3 = [UIView new];
    [self.view addSubview:v3];
//    v3.translatesAutoresizingMaskIntoConstraints = NO;
    v3.backgroundColor = [UIColor redColor];
    [v3.bottom$ equalTo:self.bottomGuide$.top$];
    [v3.centerX$ equalTo:self.view.centerX$ rate:1.5];
    [v3.width$ equalTo:nil trim:100];
    [v3.height$ equalTo:nil trim:100];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
