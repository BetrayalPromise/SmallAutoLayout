//
//  UIView+Layout.m
//  ABCD
//
//  Created by LiChunYang on 27/6/2018.
//  Copyright © 2018 com.qmtv. All rights reserved.
//

#import "UIView+Layout.h"
#import "Layout.h"

@implementation UIView (Layout)

- (Layout *)Left {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)Right {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)Top {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)Bottom {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)Leading {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)Trailing {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)Width {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)Height {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)CenterX {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)CenterY {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)LastBaseline {
     return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)Baseline {
     return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)FirstBaseline {
     return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)LeftMargin {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)RightMargin {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)TopMargin {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)BottomMargin {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)LeadingMargin {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)TrailingMargin {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)CenterXMargin {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)CenterYMargin {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)Size {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)Center {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)SafeAreaGuide {
    Layout * layout = [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
    layout.safeAreaGuideFlag = YES;
    return layout;
}

@end
