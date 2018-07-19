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
    if (@available(iOS 11.0, *)) {
        [v.safeAreaGuide$.size$ size:@(CGSizeMake(100, 100))];
        [v.safeAreaGuide$.center$ center:self.view.safeAreaGuide$];
    } else {
        [v.size$ size:@(CGSizeMake(100, 100))];
        [v.center$ center:self.view];
    }

}


@end
