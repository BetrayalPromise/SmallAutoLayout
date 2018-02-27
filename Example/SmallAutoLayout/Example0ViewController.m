//
//  Example0ViewController.m
//  SmallAutoLayout_Example
//
//  Created by 李阳 on 29/1/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "Example0ViewController.h"
#import <SmallAutoLayout/SmallAutoLayout.h>

@interface Example0ViewController ()

@end

@implementation Example0ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIView * v0 = [UIView new];
    [self.view addSubview:v0];
    v0.translatesAutoresizingMaskIntoConstraints = NO;
    v0.backgroundColor = [UIColor redColor];

    [v0.layout.width equalTo:nil trim:100];
    [v0.layout.height equalTo:nil trim:100];
    [v0.layout.top equalTo:self.view.layout.safeAreaLayoutGuide.top];
    [v0.layout.left equalTo:self.view.layout.safeAreaLayoutGuide.left];

    UIView * v1 = [UIView new];
    [self.view addSubview:v1];
    v1.translatesAutoresizingMaskIntoConstraints = NO;
    v1.backgroundColor = [UIColor redColor];
    [self.view.layout.safeAreaLayoutGuide.top equalTo:v1.layout.top];
    [self.view.layout.safeAreaLayoutGuide.right equalTo:v1.layout.right];
    [v1.layout.width equalTo:nil trim:100];
    [v1.layout.height equalTo:nil trim:100];


    UIView * v2 = [UIView new];
    [self.view addSubview:v2];
    v2.translatesAutoresizingMaskIntoConstraints = NO;
    v2.backgroundColor = [UIColor redColor];
    [v2.layout.bottom equalTo:self.view.layout.safeAreaLayoutGuide.bottom];
    [self.view.layout.safeAreaLayoutGuide.left equalTo:v2.layout.left];
    [v2.layout.width equalTo:nil trim:100];
    [v2.layout.height equalTo:nil trim:100];


    UIView * v3 = [UIView new];
    [self.view addSubview:v3];
    v3.translatesAutoresizingMaskIntoConstraints = NO;
    v3.backgroundColor = [UIColor redColor];
    [self.view.layout.safeAreaLayoutGuide.bottom equalTo:v3.layout.bottom];
    [v3.layout.right equalTo:self.view.layout.safeAreaLayoutGuide.right];
    [v3.layout.width equalTo:nil trim:100];
    [v3.layout.height equalTo:nil trim:100];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
