//
//  Example8ViewController.m
//  SmallAutoLayout_Example
//
//  Created by mac on 2018/10/15.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "Example8ViewController.h"
#import <SmallAutoLayout/SmallAutoLayout.h>

@interface Example8ViewController ()

@end

@implementation Example8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UIView * v = [UIView new];
//    [self.view addSubview:v];
//    v.backgroundColor = UIColor.yellowColor;
//    [v.insert$ insert:self.view trim:(UIEdgeInsetsMake(100, 20, 100, 20))];
 
    UILabel * label = [UILabel new];
    label.text = @"ADFADFADFADFA";
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    NSLayoutConstraint * c = [label.left$ equalTo:self.view];
    [label.centerY$ equalTo:self.view];
//    c.active = NO;
//    [label.left$ equalTo:self.view trim:10];
    c.constant = 10;
}

@end
