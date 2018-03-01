//
//  UIViewController+Layout.m
//  Constraint
//
//  Created by LiChunYang on 29/1/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "UIViewController+Layout.h"
#import <objc/runtime.h>
#import "Layout.h"

@interface UIViewController ()

@property (nonatomic, assign, readonly) BOOL layoutFlag;

@end

@implementation UIViewController (Layout)

- (void)setLayout:(Layout * _Nullable)layout {
    objc_setAssociatedObject(self, @selector(layout), layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (Layout * _Nullable)layout {
    if (self.layoutFlag) {
        return objc_getAssociatedObject(self, _cmd);
    } else {
        Layout * layout = [Layout new];
        layout.layoutItem = self;
        self.layout = layout;
        self.layoutFlag = YES;
        return layout;
    }
}

- (void)setLayoutFlag:(BOOL)layoutFlag {
    objc_setAssociatedObject(self, @selector(layoutFlag), @(layoutFlag), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)layoutFlag {
    return objc_getAssociatedObject(self, _cmd) != nil ? [objc_getAssociatedObject(self, _cmd) boolValue] : NO;
}

@end
