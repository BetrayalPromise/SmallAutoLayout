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
    [v0.top$.left$.bottom$.right$ equalTo:self.view.safeAreaGuide$];
    
    UIView * v1 = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:v1];
    v1.backgroundColor = UIColor.blueColor;
    v1.translatesAutoresizingMaskIntoConstraints = NO;
    /// 已支持
//    [v1.center$ equalTo:self.view rate:10];
//    /// 已支持
//    [v1.size$ equalTo:@(CGSizeMake(100, 100))];
    [v1.size$.left$.top$ equalTo:self.view];
    
    /// 待支持
//    v.size$.equal(self.view.size$.rate(0.4));
    
//    v.left$.equal(self.view);
//    v.right$.equal(self.view);
//    v.width$.rate(0.5).trim(10).equal(self.view.width$.rate(2));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
