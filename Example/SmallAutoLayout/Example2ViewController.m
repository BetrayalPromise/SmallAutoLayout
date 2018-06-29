//
//  Example2ViewController.m
//  SmallAutoLayout_Example
//
//  Created by 李阳 on 30/1/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "Example2ViewController.h"
#import <SmallAutoLayout/SmallAutoLayout.h>

@interface Example2ViewController ()

@end

@implementation Example2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    UIView * v0 = [UIView new];
    [self.view addSubview:v0];
    v0.translatesAutoresizingMaskIntoConstraints = NO;
    v0.backgroundColor = [UIColor redColor];
    [v0.CenterX equalTo:self.view.CenterX];
    [self.view.CenterY equalTo:v0.CenterY];
    [v0.Width equalTo:nil trim:100];
    [v0.Height equalTo:v0.Width];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
