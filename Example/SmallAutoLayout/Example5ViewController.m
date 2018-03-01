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
    [self.view.layout.safeAreaLayoutGuide.top equalTo:v1];
    [self.view.layout.safeAreaLayoutGuide.right equalTo:v1];
    [v1.layout.width equalTo:nil trim:[CommonAdaptive widgetCustomAdaptive:^(DeviceSize * _Nonnull size) {
        size.inch35 = size.inch40 = 10;

    }]];
    [v1.layout.height equalTo:nil trim:100];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
