//
//  Example3ViewController.m
//  SmallAutoLayout_Example
//
//  Created by 李阳 on 4/2/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "Example3ViewController.h"
#import <SmallAutoLayout/SmallAutoLayout.h>
#import "ExampleCell.h"
#import "HoverReusableView.h"
#import "NSObject+FunctionExtension.h"

@interface Example3ViewController ()

@end

@implementation Example3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    UIView * v = [[UIView alloc] init];
    v.backgroundColor = [UIColor redColor];
    v.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:v];

//    [v.size$ equalTo:self.view.safeAreaGuide$];

    [v.center$ equalTo:self.view.safeAreaGuide$.center$];
    [v.size$ equalTo:self.view.safeAreaGuide$.size$];
//    [v.width$ equalTo:@(10)];
//    [v.height$ equalTo:@(10)];
}

@end
