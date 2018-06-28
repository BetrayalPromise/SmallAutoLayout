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

    [v0.Width equalTo:nil constant:100];
    [v0.Height equalTo:nil constant:100];
    [v0.Top equalTo:self.view.SafeAreaGuide];
    [v0.Left equalTo:self.view.SafeAreaGuide];

    UIView * v1 = [UIView new];
    [self.view addSubview:v1];
    v1.translatesAutoresizingMaskIntoConstraints = NO;
    v1.backgroundColor = [UIColor redColor];
    [self.view.SafeAreaGuide.Top equalTo:v1.Top];
    [self.view.SafeAreaGuide.Right equalTo:v1.Right];
    [v1.Width equalTo:nil constant:100];
    [v1.Height equalTo:nil constant:100];


    UIView * v2 = [UIView new];
    [self.view addSubview:v2];
    v2.translatesAutoresizingMaskIntoConstraints = NO;
    v2.backgroundColor = [UIColor redColor];
    [v2.Bottom equalTo:self.view.SafeAreaGuide.Bottom];
    [self.view.SafeAreaGuide.Left equalTo:v2.Left];
    [v2.Width equalTo:nil constant:100];
    [v2.Height equalTo:nil constant:100];


    UIView * v3 = [UIView new];
    [self.view addSubview:v3];
    v3.translatesAutoresizingMaskIntoConstraints = NO;
    v3.backgroundColor = [UIColor redColor];
    [self.view.SafeAreaGuide.Bottom equalTo:v3.Bottom];
    [v3.Right equalTo:self.view.SafeAreaGuide.Right];
    [v3.Width equalTo:nil constant:100];
    [v3.Height equalTo:nil constant:100];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
