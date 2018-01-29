//
//  UIViewController+Layout.h
//  Constraint
//
//  Created by LiChunYang on 29/1/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Layout;

@interface UIViewController (Layout)

@property (nonatomic, strong, readonly) Layout * _Nullable layout NS_DEPRECATED_IOS(7.0,11.0);

@end
