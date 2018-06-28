//
//  Example5ViewController.m
//  SmallAutoLayout_Example
//
//  Created by 李阳 on 27/2/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "Example5ViewController.h"
#import <SmallAutoLayout/SmallAutoLayout.h>

@interface Example5ViewController ()

@end

@implementation Example5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    UIView * v1 = [UIView new];
    [self.view addSubview:v1];
    v1.translatesAutoresizingMaskIntoConstraints = NO;
    v1.backgroundColor = [UIColor redColor];

    [v1.SafeAreaGuide.Top equalTo:self.view];
    [v1.SafeAreaGuide.Left equalTo:self.view];
    [v1.SafeAreaGuide.Bottom equalTo:self.view];
    [v1.SafeAreaGuide.Right equalTo:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
