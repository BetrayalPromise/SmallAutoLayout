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

    [v0.width$ equalTo:nil trim:100];
    [v0.height$ equalTo:@(100)];
    if (@available(iOS 11.0, *)) {
//        [v0.top$ equalTo:self.view.safeAreaGuide$];
//        [v0.left$ equalTo:self.view.safeAreaGuide$];
        [v0.top$.left$ equalTo:self.view.safeAreaGuide$];
    } else {
        [v0.top$ equalTo:self.topGuide$.bottom$];
        [v0.left$ equalTo:self.view.left$];
    }


    UIView * v1 = [UIView new];
    [self.view addSubview:v1];
    v1.translatesAutoresizingMaskIntoConstraints = NO;
//    [v1.width$ equalTo:nil trim:100];
//    [v1.height$ equalTo:nil trim:100];
    [v1.size$ equalTo:@(CGSizeMake(100, 100))];
    v1.backgroundColor = [UIColor redColor];
    if (@available(iOS 11.0, *)) {
//        二者写法是等价的
//        [self.view.safeAreaGuide$.top$ equalTo:v1.top$];
//        [self.view.safeAreaGuide$.right$ equalTo:v1.right$];
        [self.view.safeAreaGuide$.top$.right$ equalTo:v1];
    } else {
        [self.topGuide$.bottom$ equalTo:v1.top$];
        [self.view.right$ equalTo:v1.right$];
    }

    UIView * v2 = [UIView new];
    [self.view addSubview:v2];
    v2.translatesAutoresizingMaskIntoConstraints = NO;
    v2.backgroundColor = [UIColor redColor];
    [v2.width$ equalTo:nil trim:100];
    [v2.height$ equalTo:nil trim:100];
    if (@available(iOS 11.0, *)) {
        [v2.bottom$ equalTo:self.view.safeAreaGuide$.bottom$];
        [self.view.safeAreaGuide$.left$ equalTo:v2.left$];
    } else {

    }

    UIView * v3 = [UIView new];
    [self.view addSubview:v3];
    v3.translatesAutoresizingMaskIntoConstraints = NO;
    v3.backgroundColor = [UIColor redColor];
    if (@available(iOS 11.0, *)) {
        [self.view.safeAreaGuide$.bottom$ equalTo:v3.bottom$];
        [v3.right$ equalTo:self.view.safeAreaGuide$.right$];
    } else {
        [self.bottomGuide$.top$ equalTo:v3.bottom$];
        [v3.right$ equalTo:self.view];
    }
    [v3.width$ equalTo:nil trim:100];
    [v3.height$ equalTo:nil trim:100];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
