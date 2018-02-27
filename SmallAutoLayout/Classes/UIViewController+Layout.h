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

@property (nonatomic, strong, readonly) Layout * _Nullable layout __attribute__((deprecated("deprecated on iOS 11.0 recommand use view.safeLayoutGudie")));

@end
