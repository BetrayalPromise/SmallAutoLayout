//
//  Layout.h
//  Constraint
//
//  Created by 李阳 on 28/1/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Constraint;

@interface Layout : NSObject

@property (nonatomic, weak  ) UIView * _Nullable layoutView;
@property (nonatomic, weak  ) UIViewController * _Nullable layoutViewController;
@property (nonatomic, assign) NSLayoutAttribute currentConstraint;
@property (nonatomic, strong) Constraint * _Nullable top;
@property (nonatomic, strong) Constraint * _Nullable left;
@property (nonatomic, strong) Constraint * _Nullable bottom;
@property (nonatomic, strong) Constraint * _Nullable right;
@property (nonatomic, strong) Constraint * _Nullable centerX;
@property (nonatomic, strong) Constraint * _Nullable centerY;
@property (nonatomic, strong) Constraint * _Nullable firstBaseline;
@property (nonatomic, strong) Constraint * _Nullable lastBaseline;
@property (nonatomic, strong) Constraint * _Nullable width;
@property (nonatomic, strong) Constraint * _Nullable height;

@property (nonatomic, strong) Layout * _Nullable topLayoutGuide NS_DEPRECATED_IOS(7.0,11.0);
@property (nonatomic, assign, readonly) BOOL topLayoutGuideFlag;
@property (nonatomic, strong) Layout * _Nullable bottomLayoutGuide NS_DEPRECATED_IOS(7.0,11.0);
@property (nonatomic, assign, readonly) BOOL bottomLayoutGuideFlag;

@property (nonatomic, strong) Layout * _Nullable safeAreaLayoutGuide;
@property (nonatomic, assign) BOOL safeAreaLayoutGuideFlag;

//@property (nonatomic, assign) Constraint * _Nullable same;

@end
