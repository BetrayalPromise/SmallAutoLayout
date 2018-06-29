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
    [self.TopGuide.Top equalTo:v0.Top];
    [v0.CenterX equalTo:self.view.CenterX rate:0.5];
    [v0.Width equalTo:nil trim:100];
    [v0.Height equalTo:nil trim:100];


    UIView * v1 = [UIView new];
    [self.view addSubview:v1];
    v1.translatesAutoresizingMaskIntoConstraints = NO;
    v1.backgroundColor = [UIColor redColor];
    [v1.Top equalTo:self.TopGuide.Bottom];
    [v1.CenterX equalTo:self.view.CenterX rate:1.5];
    [v1.Width equalTo:nil trim:100];
    [v1.Height equalTo:nil trim:100];

    UIView * v2 = [UIView new];
    [self.view addSubview:v2];
    v2.translatesAutoresizingMaskIntoConstraints = NO;
    v2.backgroundColor = [UIColor redColor];
    [self.BottomGuide.Bottom equalTo:v2.Bottom];
    [v2.CenterX equalTo:self.view.CenterX rate:0.5];
    [v2.Width equalTo:nil trim:100];
    [v2.Height equalTo:nil trim:100];

    UIView * v3 = [UIView new];
    [self.view addSubview:v3];
    v3.translatesAutoresizingMaskIntoConstraints = NO;
    v3.backgroundColor = [UIColor redColor];
    [v3.Bottom equalTo:self.BottomGuide.Top];
    [v3.CenterX equalTo:self.view.CenterX rate:1.5];
    [v3.Width equalTo:nil trim:100];
    [v3.Height equalTo:nil trim:100];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
