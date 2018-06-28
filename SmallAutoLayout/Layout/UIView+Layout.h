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

/// 用户自定义的视图一般而言其范围和安全区范围是样的只支持 Left Right Top Bottom 四个属性
@property (nonatomic, weak, readonly) Layout * SafeAreaGuide;

@end
