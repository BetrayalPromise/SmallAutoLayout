//
//  NSLayoutConstraint+AliasName.m
//  Constraint
//
//  Created by 李阳 on 28/1/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "NSLayoutConstraint+AliasName.h"

@implementation NSLayoutConstraint (AliasName)

+ (instancetype _Nullable)withItem:(id _Nullable)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id _Nullable)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    return [NSLayoutConstraint constraintWithItem:view1 attribute:(NSLayoutAttribute)attr1 relatedBy:relation toItem:view2 attribute:(NSLayoutAttribute)attr2 multiplier:multiplier constant:c];
}

+ (instancetype _Nullable)withItem:(id _Nullable)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id _Nullable)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier {
    return [self withItem:view1 attribute:attr1 relatedBy:relation toItem:view2 attribute:attr2 multiplier:multiplier constant:0.0];
}

+ (instancetype _Nullable)withItem:(id _Nullable)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id _Nullable)view2 attribute:(NSLayoutAttribute)attr2  constant:(CGFloat)c {
    return [self withItem:view1 attribute:attr1 relatedBy:relation toItem:view2 attribute:attr2 multiplier:1.0 constant:c];
}

+ (instancetype _Nullable)withItem:(id _Nullable)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id _Nullable)view2 attribute:(NSLayoutAttribute)attr2 {
    return [self withItem:view1 attribute:attr1 relatedBy:relation toItem:view2 attribute:attr2 multiplier:1.0 constant:0.0];
}

@end
