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

    [self.TopGuide.Bottom equalTo:v0];
    [v0.CenterX equalTo:self.view];
    [v0.Width equalTo:@100];
    [v0.Height equalTo:v0.Width];

//    UIView * v1 = [UIView new];
//    [self.view addSubview:v1];
//    v1.translatesAutoresizingMaskIntoConstraints = NO;
//    v1.backgroundColor = [UIColor redColor];
//    [self.BottomLayoutGuide.Top equalTo:v1];
//    [v1.CenterX equalTo:self.view multiplier:1];
//    [v1.Width equalTo:nil constant:100];
//    [v1.Height equalTo:v1.Width];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
