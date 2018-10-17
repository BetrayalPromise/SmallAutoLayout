//
//  UIView+Layout.m
//  ABCD
//
//  Created by LiChunYang on 27/6/2018.
//  Copyright © 2018 com.qmtv. All rights reserved.
//

#import "UIView+Layout.h"
#import "Layout.h"
#import <objc/runtime.h>

@implementation UIView (Layout)

- (Layout *)left$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)right$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)top$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)bottom$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)leading$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)trailing$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)width$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)height$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)centerX$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)centerY$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)lastBaseline$ {
     return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)baseline$ {
     return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)firstBaseline$ {
     return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)leftMargin$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)rightMargin$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)topMargin$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)bottomMargin$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)leadingMargin$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)trailingMargin$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)centerXMargin$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)centerYMargin$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)size$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)center$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)insert$ {
    return [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
}

- (Layout *)safeAreaGuide$ {
    Layout * layout = [Layout buildWithItem:self mark:NSStringFromSelector(_cmd)];
    layout.safeAreaGuideFlag = YES;
    return layout;
}

- (NSHashTable *)ownConstraints {
    if (objc_getAssociatedObject(self, _cmd) == nil) {
        NSHashTable * hashTable = [NSHashTable weakObjectsHashTable];
        objc_setAssociatedObject(self, _cmd, hashTable, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return hashTable;
    }
    return objc_getAssociatedObject(self, _cmd);
}

- (void)clearupConstraint {
    for (NSLayoutConstraint * c in self.ownConstraints) {
        c.active = NO;
    }
}

@end
