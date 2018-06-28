//
//  Layout.h
//  ABCD
//
//  Created by LiChunYang on 27/6/2018.
//  Copyright © 2018 com.qmtv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
@class NSLayoutConstraint;

@interface Layout : NSObject

/// Only For SafeArea
@property (nonatomic, strong, readonly) Layout * Left;
/// Only For SafeArea
@property (nonatomic, strong, readonly) Layout * Right;


/// Only For SafeArea LayouGuide
@property (nonatomic, strong, readonly) Layout * Top;
/// Only For SafeArea LayouGuide
@property (nonatomic, strong, readonly) Layout * Bottom;



@property (nonatomic, assign) BOOL safeAreaGuideFlag;
@property (nonatomic, assign) BOOL topLayoutGuideFlag;
@property (nonatomic, assign) BOOL bottomLayoutGuideFlag;

@property (nonatomic, weak) id item;
@property (nonatomic, copy) NSString * mark;

+ (instancetype)buildWithItem:(id)item mark:(NSString *)mark;

/*
    view自己觉得的尺寸
 
    other 为NSNumber时 multiplier和constant参数无效
    other 为UIView时 self与参数拥有相同的属性
    other 为nil时 multiplier无效
 */
- (NSLayoutConstraint *)equalTo:(id _Nullable)other multiplier:(CGFloat)multiplier constant:(CGFloat)c;
- (NSLayoutConstraint *)equalTo:(id _Nullable)other multiplier:(CGFloat)multiplier;
- (NSLayoutConstraint *)equalTo:(id _Nullable)other constant:(CGFloat)c;
- (NSLayoutConstraint *)equalTo:(id _Nullable)other;

- (NSLayoutConstraint *)lessOrEqualTo:(id _Nullable)other multiplier:(CGFloat)multiplier constant:(CGFloat)c;
- (NSLayoutConstraint *)lessOrEqualTo:(id _Nullable)other multiplier:(CGFloat)multiplier;
- (NSLayoutConstraint *)lessOrEqualTo:(id _Nullable)other constant:(CGFloat)c;
- (NSLayoutConstraint *)lessOrEqualTo:(id _Nullable)other;

- (NSLayoutConstraint *)greaterOrEqualTo:(id _Nullable)other multiplier:(CGFloat)multiplier constant:(CGFloat)c;
- (NSLayoutConstraint *)greaterOrEqualTo:(id _Nullable)other multiplier:(CGFloat)multiplier;
- (NSLayoutConstraint *)greaterOrEqualTo:(id _Nullable)other constant:(CGFloat)c;
- (NSLayoutConstraint *)greaterOrEqualTo:(id _Nullable)other;

/// 复合属性Size处理函数
- (NSArray <NSLayoutConstraint *> *)size:(id _Nullable)other trim:(CGSize)trim;
- (NSArray <NSLayoutConstraint *> *)size:(id _Nullable)other;

/// 复合属性Center处理函数
- (NSArray <NSLayoutConstraint *> *)center:(id _Nullable)other offset:(CGSize)offset;
- (NSArray <NSLayoutConstraint *> *)center:(id _Nullable)other;

//- (NSArray <NSLayoutConstraint *> *)insert:(id _Nullable)other trim:(UIEdgeInsets)trim;

@end
