//
//  NSLayoutConstraint+Convenience.h
//  AA
//
//  Created by LiChunYang on 25/6/2018.
//  Copyright © 2018 com.qmtv. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, Attribute) {
    Left = NSLayoutAttributeLeft,
    Right = NSLayoutAttributeRight,
    Top = NSLayoutAttributeTop,
    Bottom = NSLayoutAttributeBottom,
    Leading = NSLayoutAttributeLeading,
    Trailing = NSLayoutAttributeTrailing,
    Width = NSLayoutAttributeWidth,
    Height = NSLayoutAttributeHeight,
    CenterX = NSLayoutAttributeCenterX,
    CenterY = NSLayoutAttributeCenterY,
    LastBaseline = NSLayoutAttributeLastBaseline,
    Baseline = NSLayoutAttributeBaseline,
    FirstBaseline = NSLayoutAttributeFirstBaseline,
    LeftMargin = NSLayoutAttributeLeftMargin,
    RightMargin = NSLayoutAttributeRightMargin,
    TopMargin = NSLayoutAttributeTopMargin,
    BottomMargin = NSLayoutAttributeBottomMargin,
    LeadingMargin = NSLayoutAttributeLeadingMargin,
    TrailingMargin = NSLayoutAttributeTrailingMargin,
    CenterXMargin = NSLayoutAttributeCenterXWithinMargins,
    CenterYMargin = NSLayoutAttributeCenterYWithinMargins,
    NoAttribute = NSLayoutAttributeNotAnAttribute,
};

typedef NS_ENUM(NSInteger, Relation) {
    LessOrEqual = NSLayoutRelationLessThanOrEqual,
    Equal = NSLayoutRelationEqual,
    GreaterOrEqual = NSLayoutRelationGreaterThanOrEqual,
};

@interface NSLayoutConstraint (Convenience)

/// f(x) = ax + b
+ (instancetype)fromItem:(id)view1 attribute:(Attribute)attr1 relate:(Relation)relation toItem:(nullable id)view2 attribute:(Attribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c;
/// f(x) = ax
+ (instancetype)fromItem:(id)view1 attribute:(Attribute)attr1 relate:(Relation)relation toItem:(nullable id)view2 attribute:(Attribute)attr2 multiplier:(CGFloat)multiplier;
/// f(x) = x + b
+ (instancetype)fromItem:(id)view1 attribute:(Attribute)attr1 relate:(Relation)relation toItem:(nullable id)view2 attribute:(Attribute)attr2 constant:(CGFloat)c;
/// f(x) = x
+ (instancetype)fromItem:(id)view1 attribute:(Attribute)attr1 relate:(Relation)relation toItem:(nullable id)view2 attribute:(Attribute)attr2;
/// f(x) = b
+ (instancetype)fromItem:(id)view1 attribute:(Attribute)attr1 relate:(Relation)relation constant:(CGFloat)c;

@end


