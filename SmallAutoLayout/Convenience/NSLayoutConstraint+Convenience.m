//
//  NSLayoutConstraint+Convenience.m
//  AA
//
//  Created by LiChunYang on 25/6/2018.
//  Copyright © 2018 com.qmtv. All rights reserved.
//

#import "NSLayoutConstraint+Convenience.h"

@implementation NSLayoutConstraint (Convenience)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wenum-conversion"

+ (instancetype)fromItem:(id)view1 attribute:(Attribute)attr1 relate:(Relation)relation toItem:(nullable id)view2 attribute:(Attribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    NSLayoutConstraint * constraint = [self constraintWithItem:view1 attribute:attr1 relatedBy:relation toItem:view2 attribute:attr2 multiplier:multiplier constant:c];
    constraint.active = YES;
    return constraint;
}

+ (instancetype)fromItem:(id)view1 attribute:(Attribute)attr1 relate:(Relation)relation toItem:(nullable id)view2 attribute:(Attribute)attr2 multiplier:(CGFloat)multiplier {
    NSLayoutConstraint * constraint = [self constraintWithItem:view1 attribute:attr1 relatedBy:relation toItem:view2 attribute:attr2 multiplier:multiplier constant:0.0];
    constraint.active = YES;
    return constraint;
}

+ (instancetype)fromItem:(id)view1 attribute:(Attribute)attr1 relate:(Relation)relation toItem:(nullable id)view2 attribute:(Attribute)attr2 constant:(CGFloat)c {
    NSLayoutConstraint * constraint = [self constraintWithItem:view1 attribute:attr1 relatedBy:relation toItem:view2 attribute:attr2 multiplier:1.0 constant:c];
    constraint.active = YES;
    return constraint;
}

+ (instancetype)fromItem:(id)view1 attribute:(Attribute)attr1 relate:(Relation)relation toItem:(nullable id)view2 attribute:(Attribute)attr2 {
    NSLayoutConstraint * constraint = [self constraintWithItem:view1 attribute:attr1 relatedBy:relation toItem:view2 attribute:attr2 multiplier:1.0 constant:0.0];
    constraint.active = YES;
    return constraint;
}

+ (instancetype)fromItem:(id)view1 attribute:(Attribute)attr1 relate:(Relation)relation constant:(CGFloat)c {
    NSLayoutConstraint * constraint = [self constraintWithItem:view1 attribute:attr1 relatedBy:relation toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:c];
    constraint.active = YES;
    return constraint;
}

#pragma clang diagnostic pop

@end
