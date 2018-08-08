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
   
    UIView * v0 = [UIView new];
    [self.view addSubview:v0];
    v0.translatesAutoresizingMaskIntoConstraints = NO;
    v0.backgroundColor = [UIColor redColor];
    if (@available(iOS 11.0, *)) {
        [v0.centerX$ equalTo:self.view.safeAreaGuide$.centerX$];
        [self.view.safeAreaGuide$.centerY$ equalTo:v0.centerY$];
        [v0.width$ equalTo:nil trim:100];
        [v0.height$ equalTo:v0.width$];
    } else {
        // iOS 11一下没有安全API
    }


}

@end
