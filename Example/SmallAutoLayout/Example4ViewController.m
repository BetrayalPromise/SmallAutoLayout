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

    [self.topGuide$.bottom$ equalTo:v0 trim:-100];
    [v0.centerX$ equalTo:self.view];
    [v0.width$ equalTo:@100];
    [v0.height$ equalTo:v0.width$];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
