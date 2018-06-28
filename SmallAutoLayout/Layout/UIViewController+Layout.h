//
//  UIViewController+Layout.h
//  ABCD
//
//  Created by LiChunYang on 27/6/2018.
//  Copyright © 2018 com.qmtv. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Layout;

@interface UIViewController (Layout)

/// 只支持 Top Bottom 两个属性
@property (nonatomic, weak, readonly) Layout * TopGuide;
/// 只支持 Top Bottom 两个属性
@property (nonatomic, weak, readonly) Layout * BottomGuide;

@end
