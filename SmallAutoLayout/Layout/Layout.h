//
//  Layout.h
//  ABCD
//
//  Created by LiChunYang on 27/6/2018.
//  Copyright © 2018 com.qmtv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIGeometry.h>
@class NSLayoutConstraint;

@interface Layout : NSObject

@property (nonatomic, strong, readonly) Layout * left$;
@property (nonatomic, strong, readonly) Layout * right$;
/// Support topLayoutGuide bottomLayoutGuide
@property (nonatomic, strong, readonly) Layout * top$;
/// Support topLayoutGuide bottomLayoutGuide
@property (nonatomic, strong, readonly) Layout * bottom$;
@property (nonatomic, strong, readonly) Layout * leading$;
@property (nonatomic, strong, readonly) Layout * trailing$;
@property (nonatomic, strong, readonly) Layout * width$;
@property (nonatomic, strong, readonly) Layout * height$;
@property (nonatomic, strong, readonly) Layout * centerX$;
@property (nonatomic, strong, readonly) Layout * centerY$;

@property (nonatomic, strong, readonly) Layout * lastBaseline$;
@property (nonatomic, strong, readonly) Layout * baseline$;
@property (nonatomic, strong, readonly) Layout * firstBaseline$;
@property (nonatomic, strong, readonly) Layout * leftMargin$;
@property (nonatomic, strong, readonly) Layout * rightMargin$;
@property (nonatomic, strong, readonly) Layout * topMargin$;
@property (nonatomic, strong, readonly) Layout * bottomMargin$;
@property (nonatomic, strong, readonly) Layout * leadingMargin$;
@property (nonatomic, strong, readonly) Layout * trailingMargin$;
@property (nonatomic, strong, readonly) Layout * centerXMargin$;
@property (nonatomic, strong, readonly) Layout * centerYMargin$;

////////////////////////////////////////////////////////////////////////////复合属性////////////////////////////////////////////////////////////////////////////

/// 复合属性 Size 不能使用操单个约束的函数
@property (nonatomic, strong, readonly) Layout * size$;
/// 复合属性 Center 不能使用操作单个约束的函数
@property (nonatomic, strong, readonly) Layout * center$;
/// 复合属性 Insert 不能使用操作单个约束的函数
@property (nonatomic, strong, readonly) Layout * insert$;

////////////////////////////////////////////////////////////////////////////布局标记////////////////////////////////////////////////////////////////////////////
@property (nonatomic, assign) BOOL safeAreaGuideFlag;
@property (nonatomic, assign) BOOL topLayoutGuideFlag;
@property (nonatomic, assign) BOOL bottomLayoutGuideFlag;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@property (nonatomic, weak) id layoutItem;
@property (nonatomic, copy) NSString * mark;
+ (instancetype)buildWithItem:(id)item mark:(NSString *)mark;


#pragma - mark 单一构建约束 -
- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)other rate:(CGFloat)rate trim:(CGFloat)c;
- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)other rate:(CGFloat)rate;
- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)other trim:(CGFloat)c;
- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)other;
- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)other rate:(CGFloat)rate trim:(CGFloat)c priority:(CGFloat)priority;
- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)other rate:(CGFloat)rate priority:(CGFloat)priority;
- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)other trim:(CGFloat)c priority:(CGFloat)priority;
- (NSLayoutConstraint * _Nullable)equalTo:(id _Nullable)other priority:(CGFloat)priority;

- (NSLayoutConstraint * _Nullable)lessOrEqualTo:(id _Nullable)other rate:(CGFloat)rate trim:(CGFloat)c;
- (NSLayoutConstraint * _Nullable)lessOrEqualTo:(id _Nullable)other rate:(CGFloat)rate;
- (NSLayoutConstraint * _Nullable)lessOrEqualTo:(id _Nullable)other trim:(CGFloat)c;
- (NSLayoutConstraint * _Nullable)lessOrEqualTo:(id _Nullable)other;
- (NSLayoutConstraint * _Nullable)lessOrEqualTo:(id _Nullable)other rate:(CGFloat)rate trim:(CGFloat)c priority:(CGFloat)priority;
- (NSLayoutConstraint * _Nullable)lessOrEqualTo:(id _Nullable)other rate:(CGFloat)rate priority:(CGFloat)priority;
- (NSLayoutConstraint * _Nullable)lessOrEqualTo:(id _Nullable)other trim:(CGFloat)c priority:(CGFloat)priority;
- (NSLayoutConstraint * _Nullable)lessOrEqualTo:(id _Nullable)other priority:(CGFloat)priority;

- (NSLayoutConstraint * _Nullable)greaterOrEqualTo:(id _Nullable)other rate:(CGFloat)rate trim:(CGFloat)c;
- (NSLayoutConstraint * _Nullable)greaterOrEqualTo:(id _Nullable)other rate:(CGFloat)multiplier;
- (NSLayoutConstraint * _Nullable)greaterOrEqualTo:(id _Nullable)other trim:(CGFloat)c;
- (NSLayoutConstraint * _Nullable)greaterOrEqualTo:(id _Nullable)other;
- (NSLayoutConstraint * _Nullable)greaterOrEqualTo:(id _Nullable)other rate:(CGFloat)rate trim:(CGFloat)c priority:(CGFloat)priority;
- (NSLayoutConstraint * _Nullable)greaterOrEqualTo:(id _Nullable)other rate:(CGFloat)rate priority:(CGFloat)priority;
- (NSLayoutConstraint * _Nullable)greaterOrEqualTo:(id _Nullable)other trim:(CGFloat)c priority:(CGFloat)priority;
- (NSLayoutConstraint * _Nullable)greaterOrEqualTo:(id _Nullable)other priority:(CGFloat)priority;

#pragma - mark 复合构建约束 -
- (NSArray <NSLayoutConstraint *> *)sizeWith:(id _Nullable)other;

- (NSArray <NSLayoutConstraint *> *)centerIn:(id _Nullable)other trim:(CGSize)trim;
- (NSArray <NSLayoutConstraint *> *)centerIn:(id _Nullable)other;

- (NSArray <NSLayoutConstraint *> *)insertIn:(id _Nonnull)other trim:(UIEdgeInsets)trim;
- (NSArray <NSLayoutConstraint *> *)insertIn:(id _Nonnull)other;

#pragma - mark -

@end
