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
    
    [v.left$.right$.width$.height$ equalTo:self.view];
    
    
    v.left$.equalTo(self.view, 1.0, 0.0);
    v.right$.equalTo(self.view, 1.0, 0.0);
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
