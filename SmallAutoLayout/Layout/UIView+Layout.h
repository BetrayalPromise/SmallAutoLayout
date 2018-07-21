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

@property (nonatomic, weak, readonly) Layout * left$;
@property (nonatomic, weak, readonly) Layout * right$;
@property (nonatomic, weak, readonly) Layout * top$;
@property (nonatomic, weak, readonly) Layout * bottom$;
@property (nonatomic, weak, readonly) Layout * leading$;
@property (nonatomic, weak, readonly) Layout * trailing$;
@property (nonatomic, weak, readonly) Layout * width$;
@property (nonatomic, weak, readonly) Layout * height$;
@property (nonatomic, weak, readonly) Layout * centerX$;
@property (nonatomic, weak, readonly) Layout * centerY$;

@property (nonatomic, weak, readonly) Layout * lastBaseline$;
@property (nonatomic, weak, readonly) Layout * baseline$;
@property (nonatomic, weak, readonly) Layout * firstBaseline$;
@property (nonatomic, weak, readonly) Layout * leftMargin$;
@property (nonatomic, weak, readonly) Layout * rightMargin$;
@property (nonatomic, weak, readonly) Layout * topMargin$;
@property (nonatomic, weak, readonly) Layout * bottomMargin$;
@property (nonatomic, weak, readonly) Layout * leadingMargin$;
@property (nonatomic, weak, readonly) Layout * trailingMargin$;
@property (nonatomic, weak, readonly) Layout * centerXMargin$;
@property (nonatomic, weak, readonly) Layout * centerYMargin$;

/// 复合属性 size
@property (nonatomic, weak, readonly) Layout * size$;
/// 不支持直接使用 equalTo:@(CGPointMake(x, y)) 因为没有参照物
@property (nonatomic, weak, readonly) Layout * center$;
/// 复合属性 insert
@property (nonatomic, weak, readonly) Layout * insert$;

/// 用户自定义的视图一般而言其范围和安全区范围是一样的 支持 left right top bottom size insert 属性
@property (nonatomic, weak, readonly) Layout * safeAreaGuide$ API_AVAILABLE(ios(11.0),tvos(11.0));;

@end
