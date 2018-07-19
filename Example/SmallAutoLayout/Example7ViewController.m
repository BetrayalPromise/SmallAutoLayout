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
    
    UIView * v = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:v];
    v.translatesAutoresizingMaskIntoConstraints = NO;
    
    [v.top$.left$.bottom$.right$ equalTo:self.view];
    
    
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
