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
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    [label.size$ sizeScope:@(CGSizeMake(100, 100))];
    [label.size$ sizeScope:@(CGSizeMake(200, 100))];
    [label.center$ centerIn:self.view];
}

@end
