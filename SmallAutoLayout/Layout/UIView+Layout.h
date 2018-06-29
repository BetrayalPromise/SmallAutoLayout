//
//  UIView+Layout.h
//  ABCD
//
//  Created by LiChunYang on 27/6/2018.
//  Copyright © 2018 com.qmtv. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Layout;

@interface UIView (Layout)

@property (nonatomic, weak, readonly) Layout * Left;
@property (nonatomic, weak, readonly) Layout * Right;
@property (nonatomic, weak, readonly) Layout * Top;
@property (nonatomic, weak, readonly) Layout * Bottom;
@property (nonatomic, weak, readonly) Layout * Leading;
@property (nonatomic, weak, readonly) Layout * Trailing;
@property (nonatomic, weak, readonly) Layout * Width;
@property (nonatomic, weak, readonly) Layout * Height;
@property (nonatomic, weak, readonly) Layout * CenterX;
@property (nonatomic, weak, readonly) Layout * CenterY;

@property (nonatomic, weak, readonly) Layout * LastBaseline;
@property (nonatomic, weak, readonly) Layout * Baseline;
@property (nonatomic, weak, readonly) Layout * FirstBaseline;
@property (nonatomic, weak, readonly) Layout * LeftMargin;
@property (nonatomic, weak, readonly) Layout * RightMargin;
@property (nonatomic, weak, readonly) Layout * TopMargin;
@property (nonatomic, weak, readonly) Layout * BottomMargin;
@property (nonatomic, weak, readonly) Layout * LeadingMargin;
@property (nonatomic, weak, readonly) Layout * TrailingMargin;
@property (nonatomic, weak, readonly) Layout * CenterXMargin;
@property (nonatomic, weak, readonly) Layout * CenterYMargin;

/// 复合属性 Size 不能使用操单个约束的函数
@property (nonatomic, weak, readonly) Layout * Size;
/// 复合属性 Center 不能使用操作单个约束的函数
@property (nonatomic, weak, readonly) Layout * Center;
/// 复合属性 Insert 不能使用操作单个约束的函数
@property (nonatomic, weak, readonly) Layout * Insert;

/// 用户自定义的视图一般而言其范围和安全区范围是一样的 支持 Left Right Top Bottom Size Insert 属性
@property (nonatomic, weak, readonly) Layout * SafeAreaGuide API_AVAILABLE(ios(11.0),tvos(11.0));;

@end