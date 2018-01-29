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

@property (nonatomic, weak) Layout * _Nullable useLayout;

- (NSLayoutConstraint * _Nullable)equalTo:(Constraint * _Nullable)c;
- (NSLayoutConstraint * _Nullable)equalTo:(Constraint * _Nullable)c multiply:(CGFloat)multiply;
- (NSLayoutConstraint * _Nullable)equalTo:(Constraint * _Nullable)c offset:(CGFloat)offset;
- (NSLayoutConstraint * _Nullable)equalTo:(Constraint * _Nullable)c multiply:(CGFloat)multiply offset:(CGFloat)offset;

- (NSLayoutConstraint * _Nullable)lessEqualTo:(Constraint * _Nullable)c;
- (NSLayoutConstraint * _Nullable)lessEqualTo:(Constraint * _Nullable)c multiply:(CGFloat)multiply;
- (NSLayoutConstraint * _Nullable)lessEqualTo:(Constraint * _Nullable)c offset:(CGFloat)offset;
- (NSLayoutConstraint * _Nullable)lessEqualTo:(Constraint * _Nullable)c multiply:(CGFloat)multiply offset:(CGFloat)offset;

- (NSLayoutConstraint * _Nullable)greaterEqualTo:(Constraint * _Nullable)c;
- (NSLayoutConstraint * _Nullable)greaterEqualTo:(Constraint * _Nullable)c multiply:(CGFloat)multiply;
- (NSLayoutConstraint * _Nullable)greaterEqualTo:(Constraint * _Nullable)c offset:(CGFloat)offset;
- (NSLayoutConstraint * _Nullable)greaterEqualTo:(Constraint * _Nullable)c multiply:(CGFloat)multiply offset:(CGFloat)offset;

@end
