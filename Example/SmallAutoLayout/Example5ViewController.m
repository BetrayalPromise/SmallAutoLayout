//
//  Example5ViewController.m
//  SmallAutoLayout_Example
//
//  Created by 李阳 on 27/2/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "Example5ViewController.h"
#import <SmallAutoLayout/SmallAutoLayout.h>

@interface Example5ViewController ()

@end

@implementation Example5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    UIView * v1 = [UIView new];
    [self.view addSubview:v1];
//    v1.translatesAutoresizingMaskIntoConstraints = NO;
    v1.backgroundColor = [UIColor redColor];

    if (@available(iOS 11.0, *)) {
        [v1.safeAreaGuide$.top$ equalTo:self.view];
        [v1.safeAreaGuide$.left$ equalTo:self.view];
        [v1.safeAreaGuide$.bottom$ equalTo:self.view];
        [v1.safeAreaGuide$.right$ equalTo:self.view];
    } else {
        [v1.top$ equalTo:self.topGuide$.bottom$];
        [v1.left$ equalTo:self.view];
        [v1.bottom$ equalTo:self.bottomGuide$.top$];
        [v1.right$ equalTo:self.view];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
