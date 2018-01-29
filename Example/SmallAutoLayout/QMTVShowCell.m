//
//  QMTVShowCell.m
//  SmallAutoLayout_Example
//
//  Created by LiChunYang on 29/1/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "QMTVShowCell.h"

@implementation QMTVShowCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self buildUserInterface];
    }
    return self;
}

- (void)buildUserInterface {
    NSLog(@"%@", @"AAA");
}

- (void)prepareForReuse {
    [super prepareForReuse];
    NSLog(@"A");
}

@end
