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

@property (nonatomic, copy) Layout *(^equal)(id other);
@property (nonatomic, copy) Layout * (^rate)(CGFloat rate);
@property (nonatomic, copy) Layout * (^trim)(CGFloat trim);

////////////////////////////////////////////////////////////////////////////布局标记////////////////////////////////////////////////////////////////////////////
@property (nonatomic, assign) BOOL safeAreaGuideFlag;
@property (nonatomic, assign) BOOL topGuideFlag;
@property (nonatomic, assign) BOOL bottomGuideFlag;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@property (nonatomic, weak) id layoutItem;
@property (nonatomic, weak) Layout * head;
@property (nonatomic, copy) NSString * mark;
+ (instancetype)buildWithItem:(id)item mark:(NSString *)mark;

/// 为单一属性rate trim有效 为复合属性rate(内部设置为1) trim(内部设置为0)值无效
- (NSArray <NSLayoutConstraint *> *)equalTo:(id _Nullable)other rate:(CGFloat)rate trim:(CGFloat)trim;
/// 为单一属性rate有效 为复合属性rate(内部设置为1)值无效 trim(内部设置为0)值无效
- (NSArray <NSLayoutConstraint *> *)equalTo:(id _Nullable)other rate:(CGFloat)rate;
/// 为单一属性trim有效 为复合属性trim(内部设置为1) trim(内部设置为0)值无效
- (NSArray <NSLayoutConstraint *> *)equalTo:(id _Nullable)other trim:(CGFloat)trim;
/// 为单一或者复合属性都rate(内部设置为1) trim(内部设置为0)均无效
- (NSArray <NSLayoutConstraint *> *)equalTo:(id _Nullable)other;

- (NSLayoutConstraint *)lessOrEqualTo:(id _Nullable)other rate:(CGFloat)rate trim:(CGFloat)c;
- (NSLayoutConstraint *)lessOrEqualTo:(id _Nullable)other rate:(CGFloat)rate;
- (NSLayoutConstraint *)lessOrEqualTo:(id _Nullable)other trim:(CGFloat)c;
- (NSLayoutConstraint *)lessOrEqualTo:(id _Nullable)other;

- (NSLayoutConstraint *)greaterOrEqualTo:(id _Nullable)other rate:(CGFloat)rate trim:(CGFloat)c;
- (NSLayoutConstraint *)greaterOrEqualTo:(id _Nullable)other rate:(CGFloat)rate;
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
