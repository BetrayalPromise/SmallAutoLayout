//
//  UIView+AliasName.h
//  Constraint
//
//  Created by 李阳 on 28/1/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Layout;

@interface UIView (Layout)

@property (nonatomic, strong, readonly) Layout * _Nullable layout;

@end
