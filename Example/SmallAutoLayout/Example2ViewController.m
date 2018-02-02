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

//    self.view.translatesAutoresizingMaskIntoConstraints = NO;

    UIView * v0 = [UIView new];
    [self.view addSubview:v0];
    v0.translatesAutoresizingMaskIntoConstraints = NO;
    v0.backgroundColor = [UIColor redColor];
    [v0.layout.centerX equalTo:self.view.layout.centerX];
    [self.view.layout.centerY equalTo:v0.layout.centerY];
    [v0.layout.width equalTo:nil trim:100];
    
    [v0.layout.height equalTo:v0.layout.width];

    NSLog(@"%@", v0.layout.height);
    NSLog(@"%@", v0.layout.width);

//    [NSLayoutConstraint withItem:v0 attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) constant:100].active = YES;
//    [NSLayoutConstraint withItem:v0 attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:v0 attribute:(NSLayoutAttributeWidth)].active = YES;
//    [NSLayoutConstraint withItem:v0 attribute:(NSLayoutAttributeCenterX) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeCenterX)].active = YES;
//    [NSLayoutConstraint withItem:v0 attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:self.view attribute:(NSLayoutAttributeCenterY)].active = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
