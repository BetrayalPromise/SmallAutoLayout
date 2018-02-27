//
//  Constraint.h
//  Constraint
//
//  Created by 李阳 on 28/1/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Layout, NSLayoutConstraint;
#import <CoreGraphics/CoreGraphics.h>

@interface Constraint : NSObject

/// 外界不需设置 布局内部使用
@property (nonatomic, assign) NSLayoutAttribute attribute;
/// 外界不需设置 布局内部使用
@property (nonatomic, weak) id _Nullable layoutItem;
/// 外界不需设置 布局内部使用
@property (nonatomic, assign) BOOL safeAreaLayoutGuideFlag;
/// 外界不需设置 布局内部使用
@property (nonatomic, assign) BOOL topLayoutGuideFlag;
/// 外界不需设置 布局内部使用
@property (nonatomic, assign) BOOL bottomLayoutGuideFlag;

- (NSLayoutConstraint * _Nullable)lessEqualTo:(id _Nullable)c;
- (NSLayoutConstraint * _Nullable)lessEqualTo:(id _Nullable)c multiply:(CGFloat)multiply;
- (NSLayoutConstraint * _Nullable)lessEqualTo:(id _Nullable)c trim:(CGFloat)trim;
- (NSLayoutConstraint * _Nullable)lessEqualTo:(id _Nullable)c multiply:(CGFloat)multiply trim:(CGFloat)trim;

- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)c;
- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)c multiply:(CGFloat)multiply;
- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)c trim:(CGFloat)trim;
- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)c multiply:(CGFloat)multiply trim:(CGFloat)trim;

- (NSLayoutConstraint * _Nullable)greaterEqualTo:(id _Nullable)c;
- (NSLayoutConstraint * _Nullable)greaterEqualTo:(id _Nullable)c multiply:(CGFloat)multiply;
- (NSLayoutConstraint * _Nullable)greaterEqualTo:(id _Nullable)c trim:(CGFloat)trim;
- (NSLayoutConstraint * _Nullable)greaterEqualTo:(id _Nullable)c multiply:(CGFloat)multiply trim:(CGFloat)trim;

@end
