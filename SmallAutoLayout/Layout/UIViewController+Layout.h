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
@property (nonatomic, weak, readonly) Layout * topGuide$ API_DEPRECATED("Use view.safeAreaLayoutGuide.topAnchor instead of topLayoutGuide.bottomAnchor", ios(7.0,11.0), tvos(7.0,11.0));
/// 只支持 Top Bottom 两个属性
@property (nonatomic, weak, readonly) Layout * bottomGuide$ API_DEPRECATED("Use view.safeAreaLayoutGuide.topAnchor instead of topLayoutGuide.bottomAnchor", ios(7.0,11.0), tvos(7.0,11.0));

@property (nonatomic, strong, readonly) NSHashTable <NSLayoutConstraint *> * ownConstraints;

@end
