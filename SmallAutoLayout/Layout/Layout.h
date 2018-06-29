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
////////////////////////////////////////////////////////////////////////////单一属性////////////////////////////////////////////////////////////////////////////
@property (nonatomic, strong, readonly) Layout * Left;
@property (nonatomic, strong, readonly) Layout * Right;
/// Support topLayoutGuide bottomLayoutGuide
@property (nonatomic, strong, readonly) Layout * Top;
/// Support topLayoutGuide bottomLayoutGuide
@property (nonatomic, strong, readonly) Layout * Bottom;
@property (nonatomic, strong, readonly) Layout * Leading;
@property (nonatomic, strong, readonly) Layout * Trailing;
@property (nonatomic, strong, readonly) Layout * Width;
@property (nonatomic, strong, readonly) Layout * Height;
@property (nonatomic, strong, readonly) Layout * CenterX;
@property (nonatomic, strong, readonly) Layout * CenterY;
@property (nonatomic, strong, readonly) Layout * LastBaseline;
@property (nonatomic, strong, readonly) Layout * Baseline;
@property (nonatomic, strong, readonly) Layout * FirstBaseline;
@property (nonatomic, strong, readonly) Layout * LeftMargin;
@property (nonatomic, strong, readonly) Layout * RightMargin;
@property (nonatomic, strong, readonly) Layout * TopMargin;
@property (nonatomic, strong, readonly) Layout * BottomMargin;
@property (nonatomic, strong, readonly) Layout * LeadingMargin;
@property (nonatomic, strong, readonly) Layout * TrailingMargin;
@property (nonatomic, strong, readonly) Layout * CenterXMargin;
@property (nonatomic, strong, readonly) Layout * CenterYMargin;
////////////////////////////////////////////////////////////////////////////复合属性////////////////////////////////////////////////////////////////////////////
@property (nonatomic, strong, readonly) Layout * Center;
@property (nonatomic, strong, readonly) Layout * Size;
@property (nonatomic, strong, readonly) Layout * Insert;
////////////////////////////////////////////////////////////////////////////布局标记////////////////////////////////////////////////////////////////////////////
@property (nonatomic, assign) BOOL safeAreaGuideFlag;
@property (nonatomic, assign) BOOL topLayoutGuideFlag;
@property (nonatomic, assign) BOOL bottomLayoutGuideFlag;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@property (nonatomic, weak) id item;
@property (nonatomic, copy) NSString * mark;
+ (instancetype)buildWithItem:(id)item mark:(NSString *)mark;

/*
    view自己觉得的尺寸
 
    other 为NSNumber时 rate参数无效
    other 为UIView时 self与参数拥有相同的属性
    other 为nil时 multiplier无效
 */
- (NSLayoutConstraint *)equalTo:(id _Nullable)other rate:(CGFloat)rate trim:(CGFloat)c;
- (NSLayoutConstraint *)equalTo:(id _Nullable)other rate:(CGFloat)rate;
- (NSLayoutConstraint *)equalTo:(id _Nullable)other trim:(CGFloat)c;
- (NSLayoutConstraint *)equalTo:(id _Nullable)other;

- (NSLayoutConstraint *)lessOrEqualTo:(id _Nullable)other rate:(CGFloat)rate trim:(CGFloat)c;
- (NSLayoutConstraint *)lessOrEqualTo:(id _Nullable)other rate:(CGFloat)rate;
- (NSLayoutConstraint *)lessOrEqualTo:(id _Nullable)other trim:(CGFloat)c;
- (NSLayoutConstraint *)lessOrEqualTo:(id _Nullable)other;

- (NSLayoutConstraint *)greaterOrEqualTo:(id _Nullable)other rate:(CGFloat)rate trim:(CGFloat)c;
- (NSLayoutConstraint *)greaterOrEqualTo:(id _Nullable)other rate:(CGFloat)multiplier;
- (NSLayoutConstraint *)greaterOrEqualTo:(id _Nullable)other trim:(CGFloat)c;
- (NSLayoutConstraint *)greaterOrEqualTo:(id _Nullable)other;

/// 复合属性Size处理函数
- (NSArray <NSLayoutConstraint *> *)size:(id _Nullable)other trim:(CGSize)trim;
- (NSArray <NSLayoutConstraint *> *)size:(id _Nullable)other;

/// 复合属性Center处理函数
- (NSArray <NSLayoutConstraint *> *)center:(id _Nullable)other trim:(CGSize)trim;
- (NSArray <NSLayoutConstraint *> *)center:(id _Nullable)other;

/// 符合属性Insert
- (NSArray <NSLayoutConstraint *> *)insert:(id _Nonnull)other trim:(UIEdgeInsets)trim;
- (NSArray <NSLayoutConstraint *> *)insert:(id _Nonnull)other;

@end
