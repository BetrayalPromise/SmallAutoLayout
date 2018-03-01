//
//  Constraint.m
//  Constraint
//
//  Created by 李阳 on 28/1/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "Constraint.h"
#import "Layout.h"
#import "Constraint.h"

typedef NS_ENUM(NSUInteger, ConstraintType) {
    ConstraintTypeLessThanOrEqual,
    ConstraintTypeEqual,
    ConstraintTypeGreaterThanOrEqual,
};

@implementation Constraint

- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)c {
    return [self equalTo:c multiply:1.0 trim:0.0];
}

- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)c multiply:(CGFloat)multiply {
    return [self equalTo:c multiply:multiply trim:0.0];
}

- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)c trim:(CGFloat)trim {
    return [self equalTo:c multiply:1.0 trim:trim];
}

- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)c multiply:(CGFloat)multiply trim:(CGFloat)trim {
    return [self makeConstraint:c type:ConstraintTypeEqual multiply:multiply trim:trim];
}

- (NSLayoutConstraint * _Nullable)lessEqualTo:(id _Nullable)c {
    return [self lessEqualTo:c multiply:1.0 trim:0.0];
}

- (NSLayoutConstraint * _Nullable)lessEqualTo:(id _Nullable)c multiply:(CGFloat)multiply {
    return [self lessEqualTo:c multiply:multiply trim:0.0];
}

- (NSLayoutConstraint * _Nullable)lessEqualTo:(id _Nullable)c trim:(CGFloat)trim {
    return [self lessEqualTo:c multiply:1.0 trim:trim];
}

- (NSLayoutConstraint * _Nullable)lessEqualTo:(id _Nullable)c multiply:(CGFloat)multiply trim:(CGFloat)trim {
    return [self makeConstraint:c type:ConstraintTypeLessThanOrEqual multiply:multiply trim:trim];
}

- (NSLayoutConstraint * _Nullable)greaterEqualTo:(id _Nullable)c {
    return [self greaterEqualTo:c multiply:1.0 trim:0.0];
}
- (NSLayoutConstraint * _Nullable)greaterEqualTo:(id _Nullable)c multiply:(CGFloat)multiply {
    return [self greaterEqualTo:c multiply:multiply trim:0.0];
}

- (NSLayoutConstraint * _Nullable)greaterEqualTo:(id _Nullable)c trim:(CGFloat)trim {
    return [self greaterEqualTo:c multiply:1.0 trim:trim];
}

- (NSLayoutConstraint * _Nullable)greaterEqualTo:(id _Nullable)c multiply:(CGFloat)multiply trim:(CGFloat)trim {
    return [self makeConstraint:c type:ConstraintTypeGreaterThanOrEqual multiply:multiply trim:trim];
}

/*
- (NSLayoutConstraint * _Nullable)equalTo:(Constraint * _Nullable)c multiply:(CGFloat)multiply trim:(CGFloat)trim {
    BOOL related = c != nil ? YES : NO;
    if (related) {
        if ([self.layoutItem isKindOfClass:[UIView class]] && [c.layoutItem isKindOfClass:[UIView class]]) {
            if (self.safeAreaLayoutGuideFlag == NO && c.safeAreaLayoutGuideFlag == NO) {
                NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(self.attribute) relatedBy:(NSLayoutRelationEqual) toItem:c.layoutItem attribute:(c.attribute) multiplier:multiply constant:trim];
                layoutConstraint.active = YES;
                return layoutConstraint;
            } else if (self.safeAreaLayoutGuideFlag == YES && c.safeAreaLayoutGuideFlag == NO) {
                if (@available(iOS 11.0, *)) {
                    NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:((UIView *)self.layoutItem).safeAreaLayoutGuide attribute:(self.attribute) relatedBy:(NSLayoutRelationEqual) toItem:c.layoutItem attribute:(c.attribute) multiplier:multiply constant:trim];
                    layoutConstraint.active = YES;
                    self.safeAreaLayoutGuideFlag = NO;
                    return layoutConstraint;
                } else {
                    NSAssert(NO, @"LayoutGuide only support iOS 11.0 or later");
                    return nil;
                }
            } else if (self.safeAreaLayoutGuideFlag == NO && c.safeAreaLayoutGuideFlag == YES) {
                if (@available(iOS 11.0, *)) {
                    NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:(self.layoutItem) attribute:(self.attribute) relatedBy:(NSLayoutRelationEqual) toItem:((UIView *)c.layoutItem).safeAreaLayoutGuide attribute:(c.attribute) multiplier:multiply constant:trim];
                    layoutConstraint.active = YES;
                    c.safeAreaLayoutGuideFlag = NO;
                    return layoutConstraint;
                } else {
                    NSAssert(NO, @"LayoutGuide only support iOS 11.0 or later");
                    return nil;
                }
            } else {
                if (@available(iOS 11.0, *)) {
                    NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:((UIView *)(self.layoutItem)).safeAreaLayoutGuide attribute:(self.attribute) relatedBy:(NSLayoutRelationEqual) toItem:((UIView *)c.layoutItem).safeAreaLayoutGuide attribute:(c.attribute) multiplier:multiply constant:trim];
                    layoutConstraint.active = YES;
                    self.safeAreaLayoutGuideFlag = NO;
                    c.safeAreaLayoutGuideFlag = NO;
                    return layoutConstraint;
                } else {
                    NSAssert(NO, @"LayoutGuide only support iOS 11.0 or later");
                    return nil;
                }
            }
        } else if ([self.layoutItem isKindOfClass:[UIViewController class]] && [c.layoutItem isKindOfClass:[UIView class]]) {
            if (self.topLayoutGuideFlag == YES) {
                NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:((UIViewController *)self.layoutItem).topLayoutGuide attribute:(self.attribute) relatedBy:(NSLayoutRelationEqual) toItem:c.layoutItem attribute:(c.attribute) multiplier:multiply constant:trim];
                layoutConstraint.active = YES;
                self.topLayoutGuideFlag = NO;
                return layoutConstraint;
            } else if (self.bottomLayoutGuideFlag == YES) {
                NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:((UIViewController *)self.layoutItem).bottomLayoutGuide attribute:(self.attribute) relatedBy:(NSLayoutRelationEqual) toItem:c.layoutItem attribute:(c.attribute) multiplier:multiply constant:trim];
                layoutConstraint.active = YES;
                self.bottomLayoutGuideFlag = NO;
                return layoutConstraint;
            } else {
                NSAssert(NO, @"LayoutGuide only support top or bottom");
                return nil;
            }
        } else if ([self.layoutItem isKindOfClass:[UIView class]] && [c.layoutItem isKindOfClass:[UIViewController class]]) {
            if (c.topLayoutGuideFlag == YES) {
                NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:((UIViewController *)c.layoutItem).topLayoutGuide attribute:(c.attribute) relatedBy:(NSLayoutRelationEqual) toItem:self.layoutItem attribute:(self.attribute) multiplier:multiply constant:trim];
                layoutConstraint.active = YES;
                c.topLayoutGuideFlag = NO;
                return layoutConstraint;
            } else if (c.bottomLayoutGuideFlag == YES) {
                NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:((UIViewController *)c.layoutItem).bottomLayoutGuide attribute:(c.attribute) relatedBy:(NSLayoutRelationEqual) toItem:self.layoutItem attribute:(self.attribute) multiplier:multiply constant:trim];
                layoutConstraint.active = YES;
                c.bottomLayoutGuideFlag = NO;
                return layoutConstraint;
            } else {
                NSAssert(NO, @"layoutItem must only have one LayoutGuide");
                return nil;
            }
        } else {
            NSAssert(NO, @"LayoutGuide only support top or bottom");
            return nil;
        }
    } else {
        NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(self.attribute) relatedBy:(NSLayoutRelationEqual) toItem:(nil) attribute:(NSLayoutAttributeNotAnAttribute) multiplier:multiply constant:trim];
        layoutConstraint.active = YES;
        return layoutConstraint;
    }
}
 */

- (NSLayoutConstraint * _Nullable)makeConstraint:(id _Nullable)c type:(ConstraintType)type multiply:(CGFloat)multiply trim:(CGFloat)trim {
    NSLayoutRelation reation;
    if (type == ConstraintTypeLessThanOrEqual) {
        reation = NSLayoutRelationLessThanOrEqual;
    } else if (type == ConstraintTypeEqual) {
        reation = NSLayoutRelationEqual;
    } else {
        reation = NSLayoutRelationGreaterThanOrEqual;
    }
    BOOL related = c != nil ? YES : NO;
    if (related) {
        if ([c isKindOfClass:[UIView class]]) {
            if ([self.layoutItem isKindOfClass:[UIView class]]) {
                if (self.safeAreaLayoutGuideFlag == YES) {
                    if (@available(iOS 11.0, *)) {
                        NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:((UIView *)self.layoutItem).safeAreaLayoutGuide attribute:(self.attribute) relatedBy:(reation) toItem:((UIView *)c) attribute:(self.attribute) multiplier:multiply constant:trim];
                        layoutConstraint.active = YES;
                        self.safeAreaLayoutGuideFlag = NO;
                        return layoutConstraint;
                    } else {
                        NSAssert(NO, @"LayoutGuide only support iOS 11.0 or later");
                        return nil;
                    }
                } else {
                    NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(self.attribute) relatedBy:(reation) toItem:((UIView *)c) attribute:(self.attribute) multiplier:multiply constant:trim];
                    layoutConstraint.active = YES;
                    return layoutConstraint;
                }
            } else if ([self.layoutItem isKindOfClass:[UIViewController class]]) {
                if (self.topLayoutGuideFlag == YES) {
                    NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:((UIViewController *)self.layoutItem).topLayoutGuide attribute:(self.attribute) relatedBy:(reation) toItem:((UIView *)c) attribute:(NSLayoutAttributeTop) multiplier:multiply constant:trim];
                    layoutConstraint.active = YES;
                    self.topLayoutGuideFlag = NO;
                    return layoutConstraint;
                } else if (self.bottomLayoutGuideFlag == YES) {
                    NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:((UIViewController *)self.layoutItem).bottomLayoutGuide attribute:(self.attribute) relatedBy:(reation) toItem:((UIView *)c) attribute:(NSLayoutAttributeBottom) multiplier:multiply constant:trim];
                    layoutConstraint.active = YES;
                    self.bottomLayoutGuideFlag = NO;
                    return layoutConstraint;
                } else {
                    NSAssert(NO, @"position is ambiguous");
                    return nil;
                }
            } else {
                NSAssert(NO, @"constraint create must on UIView or Constraint");
                return nil;
            }
        } else if ([c isKindOfClass:[Constraint class]]) {
            if ([self.layoutItem isKindOfClass:[UIView class]] && [((Constraint *)c).layoutItem isKindOfClass:[UIView class]]) {
                if (self.safeAreaLayoutGuideFlag == NO && ((Constraint *)c).safeAreaLayoutGuideFlag == NO) {
                    NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(self.attribute) relatedBy:(reation) toItem:((Constraint *)c).layoutItem attribute:(((Constraint *)c).attribute) multiplier:multiply constant:trim];
                    layoutConstraint.active = YES;
                    return layoutConstraint;
                } else if (self.safeAreaLayoutGuideFlag == YES && ((Constraint *)c).safeAreaLayoutGuideFlag == NO) {
                    if (@available(iOS 11.0, *)) {
                        NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:((UIView *)self.layoutItem).safeAreaLayoutGuide attribute:(self.attribute) relatedBy:(reation) toItem:((Constraint *)c).layoutItem attribute:(((Constraint *)c).attribute) multiplier:multiply constant:trim];
                        layoutConstraint.active = YES;
                        self.safeAreaLayoutGuideFlag = NO;
                        return layoutConstraint;
                    } else {
                        NSAssert(NO, @"LayoutGuide only support iOS 11.0 or later");
                        return nil;
                    }
                } else if (self.safeAreaLayoutGuideFlag == NO && ((Constraint *)c).safeAreaLayoutGuideFlag == YES) {
                    if (@available(iOS 11.0, *)) {
                        NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:(self.layoutItem) attribute:(self.attribute) relatedBy:(reation) toItem:((UIView *)((Constraint *)c).layoutItem).safeAreaLayoutGuide attribute:(((Constraint *)c).attribute) multiplier:multiply constant:trim];
                        layoutConstraint.active = YES;
                        ((Constraint *)c).safeAreaLayoutGuideFlag = NO;
                        return layoutConstraint;
                    } else {
                        NSAssert(NO, @"LayoutGuide only support iOS 11.0 or later");
                        return nil;
                    }
                } else {
                    if (@available(iOS 11.0, *)) {
                        NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:((UIView *)(self.layoutItem)).safeAreaLayoutGuide attribute:(self.attribute) relatedBy:(reation) toItem:((UIView *)((Constraint *)c).layoutItem).safeAreaLayoutGuide attribute:(((Constraint *)c).attribute) multiplier:multiply constant:trim];
                        layoutConstraint.active = YES;
                        self.safeAreaLayoutGuideFlag = NO;
                        ((Constraint *)c).safeAreaLayoutGuideFlag = NO;
                        return layoutConstraint;
                    } else {
                        NSAssert(NO, @"LayoutGuide only support iOS 11.0 or later");
                        return nil;
                    }
                }
            } else if ([self.layoutItem isKindOfClass:[UIViewController class]] && [((Constraint *)c).layoutItem isKindOfClass:[UIView class]]) {
                if (self.topLayoutGuideFlag == YES) {
                    NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:((UIViewController *)self.layoutItem).topLayoutGuide attribute:(self.attribute) relatedBy:(reation) toItem:((Constraint *)c).layoutItem attribute:(((Constraint *)c).attribute) multiplier:multiply constant:trim];
                    layoutConstraint.active = YES;
                    self.topLayoutGuideFlag = NO;
                    return layoutConstraint;
                } else if (self.bottomLayoutGuideFlag == YES) {
                    NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:((UIViewController *)self.layoutItem).bottomLayoutGuide attribute:(self.attribute) relatedBy:(reation) toItem:((Constraint *)c).layoutItem attribute:(((Constraint *)c).attribute) multiplier:multiply constant:trim];
                    layoutConstraint.active = YES;
                    self.bottomLayoutGuideFlag = NO;
                    return layoutConstraint;
                } else {
                    NSAssert(NO, @"LayoutGuide only support top or bottom");
                    return nil;
                }
            } else if ([self.layoutItem isKindOfClass:[UIView class]] && [((Constraint *)c).layoutItem isKindOfClass:[UIViewController class]]) {
                if (((Constraint *)c).topLayoutGuideFlag == YES) {
                    NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:((UIViewController *)((Constraint *)c).layoutItem).topLayoutGuide attribute:(((Constraint *)c).attribute) relatedBy:(reation) toItem:self.layoutItem attribute:(self.attribute) multiplier:multiply constant:trim];
                    layoutConstraint.active = YES;
                    ((Constraint *)c).topLayoutGuideFlag = NO;
                    return layoutConstraint;
                } else if (((Constraint *)c).bottomLayoutGuideFlag == YES) {
                    NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:((UIViewController *)((Constraint *)c).layoutItem).bottomLayoutGuide attribute:(((Constraint *)c).attribute) relatedBy:(reation) toItem:self.layoutItem attribute:(self.attribute) multiplier:multiply constant:trim];
                    layoutConstraint.active = YES;
                    ((Constraint *)c).bottomLayoutGuideFlag = NO;
                    return layoutConstraint;
                } else {
                    NSAssert(NO, @"layoutItem must only have one LayoutGuide");
                    return nil;
                }
            } else {
                NSAssert(NO, @"LayoutGuide only support top or bottom");
                return nil;
            }
        } else {
            NSAssert(NO, @"second must be UIView or Constraint instance");
            return nil;
        }
    } else {
        NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(self.attribute) relatedBy:(reation) toItem:(nil) attribute:(NSLayoutAttributeNotAnAttribute) multiplier:multiply constant:trim];
        layoutConstraint.active = YES;
        return layoutConstraint;
    }
}

@end
