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
    _currentAttribute0 = NSLayoutAttributeTop;
    if (_top) {
        return _top;
    } else {
        _top = [Constraint new];
        _top.useLayout = self;
        return _top;
    }
}

- (Constraint *)left {
    _currentAttribute0 = NSLayoutAttributeLeft;
    if (_left) {
        return _left;
    } else {
        _left = [Constraint new];
        _left.useLayout = self;
        return _left;
    }
}

- (Constraint *)bottom {
    _currentAttribute0 = NSLayoutAttributeBottom;
    if (_bottom) {
        return _bottom;
    } else {
        _bottom = [Constraint new];
        _bottom.useLayout = self;
        return _bottom;
    }
}

- (Constraint *)right {
    _currentAttribute0 = NSLayoutAttributeRight;
    if (_right) {
        return _right;
    } else {
        _right = [Constraint new];
        _right.useLayout = self;
        return _right;
    }
}

- (Constraint *)centerX {
    _currentAttribute0 = NSLayoutAttributeCenterX;
    if (_centerX) {
        return _centerX;
    } else {
        _centerX = [Constraint new];
        _centerX.useLayout = self;
        return _centerX;
    }
}

- (Constraint *)centerY {
    _currentAttribute0 = NSLayoutAttributeCenterY;
    if (_centerY) {
        return _centerY;
    } else {
        _centerY = [Constraint new];
        _centerY.useLayout = self;
        return _centerY;
    }
}

- (Constraint *)width {
    _currentAttribute0 = NSLayoutAttributeWidth;
    if (_width) {
        return _width;
    } else {
        _width = [Constraint new];
        _width.useLayout = self;
        return _width;
    }
}

- (Constraint *)height {
    _currentAttribute0 = NSLayoutAttributeHeight;
    if (_height) {
        return _height;
    } else {
        _height = [Constraint new];
        _height.useLayout = self;
        return _height;
    }
}

- (Constraint *)firstBaseline {
    _currentAttribute0 = NSLayoutAttributeFirstBaseline;
    if (_firstBaseline) {
        return _firstBaseline;
    } else {
        _firstBaseline = [Constraint new];
        _firstBaseline.useLayout = self;
        return _firstBaseline;
    }
}

- (Constraint *)lastBaseline {
    _currentAttribute0 = NSLayoutAttributeLastBaseline;
    if (_lastBaseline) {
        return _lastBaseline;
    } else {
        _lastBaseline = [Constraint new];
        _lastBaseline.useLayout = self;
        return _lastBaseline;
    }
}

- (Constraint *)leading {
    _currentAttribute0 = NSLayoutAttributeLeading;
    if (_leading) {
        return _leading;
    } else {
        _leading = [Constraint new];
        _leading.useLayout = self;
        return _leading;
    }
}

- (Constraint *)trailing {
    if (_trailing) {
        return _trailing;
    } else {
        _trailing = [Constraint new];
        _trailing.useLayout = self;
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

- (Constraint *)same {
    if (_same) {
        return _same;
    } else {
        _same = [Constraint new];
        _same.useLayout = self;
        return _same;
    }
}

@end


@interface OperationManage

@end
