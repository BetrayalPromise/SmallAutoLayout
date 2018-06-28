//
//  Example6ViewController.m
//  SmallAutoLayout_Example
//
//  Created by 李阳 on 28/6/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "Example6ViewController.h"
#import <SmallAutoLayout/SmallAutoLayout.h>

@interface Example6ViewController ()

@end

@implementation Example6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    UIView * v = [[UIView alloc] init];
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];
    v.translatesAutoresizingMaskIntoConstraints = NO;
//    [v.Center center:self.view];
    [v.Size size:@(CGSizeMake(100, 20))];
    [self.view.SafeAreaGuide equalTo:v];
}


@end
