//
//  Example7ViewController.m
//  SmallAutoLayout_Example
//
//  Created by LiChunYang on 19/7/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "Example7ViewController.h"
#import <SmallAutoLayout/SmallAutoLayout.h>

@interface Example7ViewController ()

@end

@implementation Example7ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView * v0 = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:v0];
    v0.backgroundColor = UIColor.redColor;
    v0.translatesAutoresizingMaskIntoConstraints = NO;
    /// 已支持
//    [v0.top$.left$.bottom$.right$ equalTo:self.view.safeAreaGuide$];
    
    UIView * v1 = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:v1];
    v1.backgroundColor = UIColor.blueColor;
    v1.translatesAutoresizingMaskIntoConstraints = NO;
    [v1.size$.left$.top$ equalTo:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
