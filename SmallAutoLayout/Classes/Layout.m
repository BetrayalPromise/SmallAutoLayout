//
//  Layout.m
//  Constraint
//
//  Created by 李阳 on 28/1/2018.
//  Copyright © 2018 BetrayalPromise. All rights reserved.
//

#import "Layout.h"
#import "Constraint.h"

@interface Layout ()

@end

@implementation Layout

- (Constraint *)top {
    if (_top) {
        return _top;
    } else {
        _top = [Constraint new];
        _top.useLayout = self;
        _top.attribute = NSLayoutAttributeTop;
        return _top;
    }
}

- (Constraint *)left {
    if (_left) {
        return _left;
    } else {
        _left = [Constraint new];
        _left.useLayout = self;
        _left.attribute = NSLayoutAttributeLeft;
        return _left;
    }
}

- (Constraint *)bottom {
    if (_bottom) {
        return _bottom;
    } else {
        _bottom = [Constraint new];
        _bottom.useLayout = self;
        _bottom.attribute = NSLayoutAttributeBottom;
        return _bottom;
    }
}

- (Constraint *)right {
    if (_right) {
        return _right;
    } else {
        _right = [Constraint new];
        _right.useLayout = self;
        _right.attribute = NSLayoutAttributeRight;
        return _right;
    }
}

- (Constraint *)centerX {
    if (_centerX) {
        return _centerX;
    } else {
        _centerX = [Constraint new];
        _centerX.useLayout = self;
        _centerX.attribute = NSLayoutAttributeCenterX;
        return _centerX;
    }
}

- (Constraint *)centerY {
    if (_centerY) {
        return _centerY;
    } else {
        _centerY = [Constraint new];
        _centerY.useLayout = self;
        _centerY.attribute = NSLayoutAttributeCenterY;
        return _centerY;
    }
}

- (Constraint *)width {
    if (_width) {
        return _width;
    } else {
        _width = [Constraint new];
        _width.useLayout = self;
        _width.attribute = NSLayoutAttributeWidth;
        return _width;
    }
}

- (Constraint *)height {
    if (_height) {
        return _height;
    } else {
        _height = [Constraint new];
        _height.useLayout = self;
        _height.attribute = NSLayoutAttributeHeight;
        return _height;
    }
}

- (Constraint *)firstBaseline {
    if (_firstBaseline) {
        return _firstBaseline;
    } else {
        _firstBaseline = [Constraint new];
        _firstBaseline.useLayout = self;
        _firstBaseline.attribute = NSLayoutAttributeFirstBaseline;
        return _firstBaseline;
    }
}

- (Constraint *)lastBaseline {
    if (_lastBaseline) {
        return _lastBaseline;
    } else {
        _lastBaseline = [Constraint new];
        _lastBaseline.useLayout = self;
        _lastBaseline.attribute = NSLayoutAttributeLastBaseline;
        return _lastBaseline;
    }
}

- (Constraint *)leading {
    if (_leading) {
        return _leading;
    } else {
        _leading = [Constraint new];
        _leading.useLayout = self;
        _leading.attribute = NSLayoutAttributeLeading;
        return _leading;
    }
}

- (Constraint *)trailing {
    if (_trailing) {
        return _trailing;
    } else {
        _trailing = [Constraint new];
        _trailing.useLayout = self;
        _trailing.attribute = NSLayoutAttributeTrailing;
        return _trailing;
    }
}

- (Layout *)topLayoutGuide {
    _topLayoutGuideFlag = YES;
    _bottomLayoutGuideFlag = NO;
    return self;
}

- (Layout *)bottomLayoutGuide {
    _topLayoutGuideFlag = NO;
    _bottomLayoutGuideFlag = YES;
    return self;
}

- (Layout *)safeAreaLayoutGuide {
    _safeAreaLayoutGuideFlag = YES;
    return self;
}

//- (Constraint *)same {
//    if (_same) {
//        return _same;
//    } else {
//        _same = [Constraint new];
//        _same.useLayout = self;
//        return _same;
//    }
//}

@end

