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

@implementation Constraint

- (NSLayoutConstraint * _Nullable)equalTo:(Constraint * _Nullable)c {
    return [self equalTo:c multiply:1.0 trim:0.0];
}

- (NSLayoutConstraint * _Nullable)equalTo:(Constraint * _Nullable)c multiply:(CGFloat)multiply {
    return [self equalTo:c multiply:multiply trim:0.0];
}

- (NSLayoutConstraint * _Nullable)equalTo:(Constraint * _Nullable)c trim:(CGFloat)trim {
    return [self equalTo:c multiply:1.0 trim:trim];
}

- (NSLayoutConstraint * _Nullable)equalTo:(Constraint * _Nullable)c multiply:(CGFloat)multiply trim:(CGFloat)trim {
    BOOL related = c != nil ? YES : NO;
    if (related) {
        if (self.useLayout.topLayoutGuideFlag) {
            NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:self.useLayout.layoutViewController.topLayoutGuide attribute:(self.useLayout.currentConstraint) relatedBy:(NSLayoutRelationEqual) toItem:c.useLayout.layoutView attribute:(c.useLayout.currentConstraint) multiplier:multiply constant:trim];
            layoutConstraint.active = YES;
            return layoutConstraint;
        } else if (self.useLayout.bottomLayoutGuideFlag) {
            NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:self.useLayout.layoutViewController.bottomLayoutGuide attribute:(self.useLayout.currentConstraint) relatedBy:(NSLayoutRelationEqual) toItem:c.useLayout.layoutView attribute:(c.useLayout.currentConstraint) multiplier:multiply constant:trim];
            layoutConstraint.active = YES;
            return layoutConstraint;
        } else if (c.useLayout.topLayoutGuideFlag) {
            NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:c.useLayout.layoutViewController.topLayoutGuide attribute:(c.useLayout.currentConstraint) relatedBy:(NSLayoutRelationEqual) toItem:self.useLayout.layoutView attribute:(self.useLayout.currentConstraint) multiplier:multiply constant:trim];
            layoutConstraint.active = YES;
            return layoutConstraint;
        } else if (c.useLayout.bottomLayoutGuideFlag) {
            NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:c.useLayout.layoutViewController.bottomLayoutGuide attribute:(c.useLayout.currentConstraint) relatedBy:(NSLayoutRelationEqual) toItem:self.useLayout.layoutView attribute:(self.useLayout.currentConstraint) multiplier:multiply constant:trim];
            layoutConstraint.active = YES;
            return layoutConstraint;
        } else {
            if (@available(iOS 11.0, *)) {
                NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:(self.useLayout.safeAreaLayoutGuideFlag == YES ? self.useLayout.layoutView.safeAreaLayoutGuide : self.useLayout.layoutView) attribute:(self.useLayout.currentConstraint) relatedBy:(NSLayoutRelationEqual) toItem:(c.useLayout.safeAreaLayoutGuideFlag == YES ? c.useLayout.layoutView.safeAreaLayoutGuide : c.useLayout.layoutView) attribute:(c.useLayout.currentConstraint) multiplier:multiply constant:trim];
                layoutConstraint.active = YES;
                self.useLayout.safeAreaLayoutGuideFlag = NO;
                c.useLayout.safeAreaLayoutGuideFlag = NO;
                return layoutConstraint;
            } else {
                NSAssert(NO, @"use safe area iOS system verison must be ios 11.0 or newer");
                return [NSLayoutConstraint new];
            }
        }
    } else {
        NSLog(@"%@", self.useLayout);
        NSLog(@"%@", self.useLayout.layoutView);
        NSLog(@"%@", c.useLayout);
        NSLog(@"%@", c.useLayout.layoutView);

        NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:self.useLayout.layoutView attribute:(self.useLayout.currentConstraint) relatedBy:(NSLayoutRelationEqual) toItem:(nil) attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:trim];
        layoutConstraint.active = YES;
        return layoutConstraint;
    }
}

- (NSLayoutConstraint * _Nullable)lessEqualTo:(Constraint * _Nullable)c {
    return [self lessEqualTo:c multiply:1.0 trim:0.0];
}

- (NSLayoutConstraint * _Nullable)lessEqualTo:(Constraint * _Nullable)c multiply:(CGFloat)multiply {
    return [self lessEqualTo:c multiply:multiply trim:0.0];
}

- (NSLayoutConstraint * _Nullable)lessEqualTo:(Constraint * _Nullable)c trim:(CGFloat)trim {
    return [self lessEqualTo:c multiply:1.0 trim:trim];
}

- (NSLayoutConstraint * _Nullable)lessEqualTo:(Constraint * _Nullable)c multiply:(CGFloat)multiply trim:(CGFloat)trim {
    BOOL related = c != nil ? YES : NO;
    if (related) {
        if (self.useLayout.topLayoutGuideFlag) {
            NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:self.useLayout.layoutViewController.topLayoutGuide attribute:(self.useLayout.currentConstraint) relatedBy:(NSLayoutRelationLessThanOrEqual) toItem:c.useLayout.layoutView attribute:(c.useLayout.currentConstraint) multiplier:multiply constant:trim];
            layoutConstraint.active = YES;
            return layoutConstraint;
        } else if (self.useLayout.bottomLayoutGuideFlag) {
            NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:self.useLayout.layoutViewController.bottomLayoutGuide attribute:(self.useLayout.currentConstraint) relatedBy:(NSLayoutRelationLessThanOrEqual) toItem:c.useLayout.layoutView attribute:(c.useLayout.currentConstraint) multiplier:multiply constant:trim];
            layoutConstraint.active = YES;
            return layoutConstraint;
        } else if (c.useLayout.topLayoutGuideFlag) {
            NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:c.useLayout.layoutViewController.topLayoutGuide attribute:(c.useLayout.currentConstraint) relatedBy:(NSLayoutRelationLessThanOrEqual) toItem:self.useLayout.layoutView attribute:(self.useLayout.currentConstraint) multiplier:multiply constant:trim];
            layoutConstraint.active = YES;
            return layoutConstraint;
        } else if (c.useLayout.bottomLayoutGuideFlag) {
            NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:c.useLayout.layoutViewController.bottomLayoutGuide attribute:(c.useLayout.currentConstraint) relatedBy:(NSLayoutRelationLessThanOrEqual) toItem:self.useLayout.layoutView attribute:(self.useLayout.currentConstraint) multiplier:multiply constant:trim];
            layoutConstraint.active = YES;
            return layoutConstraint;
        } else {
            if (@available(iOS 11.0, *)) {
                NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:(self.useLayout.safeAreaLayoutGuideFlag == YES ? self.useLayout.layoutView.safeAreaLayoutGuide : self.useLayout.layoutView) attribute:(self.useLayout.currentConstraint) relatedBy:(NSLayoutRelationLessThanOrEqual) toItem:(c.useLayout.safeAreaLayoutGuideFlag == YES ? c.useLayout.layoutView.safeAreaLayoutGuide : c.useLayout.layoutView) attribute:(c.useLayout.currentConstraint) multiplier:multiply constant:trim];
                layoutConstraint.active = YES;
                self.useLayout.safeAreaLayoutGuideFlag = NO;
                c.useLayout.safeAreaLayoutGuideFlag = NO;
                return layoutConstraint;
            } else {
                NSAssert(NO, @"use safe area iOS system verison must be ios 11.0 or newer");
                return [NSLayoutConstraint new];
            }
        }
    } else {
        NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:self.useLayout.layoutView attribute:(self.useLayout.currentConstraint) relatedBy:(NSLayoutRelationLessThanOrEqual) toItem:(nil) attribute:(NSLayoutAttributeNotAnAttribute) multiplier:multiply constant:trim];
        layoutConstraint.active = YES;
        return layoutConstraint;
    }
}

- (NSLayoutConstraint * _Nullable)greaterEqualTo:(Constraint * _Nullable)c {
    return [self greaterEqualTo:c multiply:1.0 trim:0.0];
}
- (NSLayoutConstraint * _Nullable)greaterEqualTo:(Constraint * _Nullable)c multiply:(CGFloat)multiply {
    return [self greaterEqualTo:c multiply:multiply trim:0.0];
}

- (NSLayoutConstraint * _Nullable)greaterEqualTo:(Constraint * _Nullable)c trim:(CGFloat)trim {
    return [self greaterEqualTo:c multiply:1.0 trim:trim];
}

- (NSLayoutConstraint * _Nullable)greaterEqualTo:(Constraint * _Nullable)c multiply:(CGFloat)multiply trim:(CGFloat)trim {
    BOOL related = c != nil ? YES : NO;
    if (related) {
        if (self.useLayout.topLayoutGuideFlag) {
            NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:self.useLayout.layoutViewController.topLayoutGuide attribute:(self.useLayout.currentConstraint) relatedBy:(NSLayoutRelationGreaterThanOrEqual) toItem:c.useLayout.layoutView attribute:(c.useLayout.currentConstraint) multiplier:multiply constant:trim];
            layoutConstraint.active = YES;
            return layoutConstraint;
        } else if (self.useLayout.bottomLayoutGuideFlag) {
            NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:self.useLayout.layoutViewController.bottomLayoutGuide attribute:(self.useLayout.currentConstraint) relatedBy:(NSLayoutRelationGreaterThanOrEqual) toItem:c.useLayout.layoutView attribute:(c.useLayout.currentConstraint) multiplier:multiply constant:trim];
            layoutConstraint.active = YES;
            return layoutConstraint;
        } else if (c.useLayout.topLayoutGuideFlag) {
            NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:c.useLayout.layoutViewController.topLayoutGuide attribute:(c.useLayout.currentConstraint) relatedBy:(NSLayoutRelationGreaterThanOrEqual) toItem:self.useLayout.layoutView attribute:(self.useLayout.currentConstraint) multiplier:multiply constant:trim];
            layoutConstraint.active = YES;
            return layoutConstraint;
        } else if (c.useLayout.bottomLayoutGuideFlag) {
            NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:c.useLayout.layoutViewController.bottomLayoutGuide attribute:(c.useLayout.currentConstraint) relatedBy:(NSLayoutRelationGreaterThanOrEqual) toItem:self.useLayout.layoutView attribute:(self.useLayout.currentConstraint) multiplier:multiply constant:trim];
            layoutConstraint.active = YES;
            return layoutConstraint;
        } else {
            if (@available(iOS 11.0, *)) {
                NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:(self.useLayout.safeAreaLayoutGuideFlag == YES ? self.useLayout.layoutView.safeAreaLayoutGuide : self.useLayout.layoutView) attribute:(self.useLayout.currentConstraint) relatedBy:(NSLayoutRelationGreaterThanOrEqual) toItem:(c.useLayout.safeAreaLayoutGuideFlag == YES ? c.useLayout.layoutView.safeAreaLayoutGuide : c.useLayout.layoutView) attribute:(c.useLayout.currentConstraint) multiplier:multiply constant:trim];
                layoutConstraint.active = YES;
                self.useLayout.safeAreaLayoutGuideFlag = NO;
                c.useLayout.safeAreaLayoutGuideFlag = NO;
                return layoutConstraint;
            } else {
                NSAssert(NO, @"use safe area iOS system verison must be ios 11.0 or newer");
                return [NSLayoutConstraint new];
            }
        }
    } else {
        NSLayoutConstraint * layoutConstraint = [NSLayoutConstraint constraintWithItem:self.useLayout.layoutView attribute:(self.useLayout.currentConstraint) relatedBy:(NSLayoutRelationGreaterThanOrEqual) toItem:(nil) attribute:(NSLayoutAttributeNotAnAttribute) multiplier:multiply constant:trim];
        layoutConstraint.active = YES;
        return layoutConstraint;
    }
}

@end
