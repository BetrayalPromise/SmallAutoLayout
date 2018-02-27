//
//  Layout.h
//  Constraint
//
//  Created by 李阳 on 28/1/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Constraint;

@interface Layout : NSObject

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
@property (nonatomic, strong) Constraint * _Nullable leading;
@property (nonatomic, strong) Constraint * _Nullable trailing;

//@property (nonatomic, strong) Constraint * _Nullable size;
//@property (nonatomic, strong) Constraint * _Nullable insert;

/// 仅支持top bottom两个属性
@property (nonatomic, strong) Layout * _Nullable topLayoutGuide;
/// 仅支持top bottom两个属性
@property (nonatomic, strong) Layout * _Nullable bottomLayoutGuide;

@property (nonatomic, strong) Layout * _Nullable safeAreaLayoutGuide;

/// 外界不需设置 布局内部使用
@property (nonatomic, weak) id _Nullable layoutItem;
/// 外界不需设置 布局内部使用
@property (nonatomic, assign, readonly) BOOL topLayoutGuideFlag;
/// 外界不需设置 布局内部使用
@property (nonatomic, assign, readonly) BOOL bottomLayoutGuideFlag;
/// 外界不需设置 布局内部使用
@property (nonatomic, assign) BOOL safeAreaLayoutGuideFlag;

@end

