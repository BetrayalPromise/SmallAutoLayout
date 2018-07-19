//
//  UIViewController+Layout.m
//  ABCD
//
//  Created by LiChunYang on 27/6/2018.
//  Copyright © 2018 com.qmtv. All rights reserved.
//

#import "UIViewController+Layout.h"
#import "Layout.h"

@implementation UIViewController (Layout)

- (Layout *)topGuide$ {
    Layout * layout = [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
    layout.topLayoutGuideFlag = YES;
    return layout;
}

- (Layout *)bottomGuide$ {
    Layout * layout = [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
    layout.bottomLayoutGuideFlag = YES;
    return layout;
}

@end
