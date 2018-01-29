//
//  NSLayoutConstraint+AliasName.h
//  Constraint
//
//  Created by 李阳 on 28/1/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (AliasName)

+ (instancetype _Nullable)withItem:(id _Nullable)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id _Nullable)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c;
+ (instancetype _Nullable)withItem:(id _Nullable)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id _Nullable)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier;
+ (instancetype _Nullable)withItem:(id _Nullable)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id _Nullable)view2 attribute:(NSLayoutAttribute)attr2  constant:(CGFloat)c;
+ (instancetype _Nullable)withItem:(id _Nullable)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id _Nullable)view2 attribute:(NSLayoutAttribute)attr2;

@end
