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

@property (nonatomic, assign) BOOL topFlag;
@property (nonatomic, assign) BOOL leftFlag;
@property (nonatomic, assign) BOOL bottomFlag;
@property (nonatomic, assign) BOOL rightFlag;
@property (nonatomic, assign) BOOL centerXFlag;
@property (nonatomic, assign) BOOL centerYFlag;
@property (nonatomic, assign) BOOL widthFlag;
@property (nonatomic, assign) BOOL heightFlag;
@property (nonatomic, assign) BOOL firstBaselineFlag;
@property (nonatomic, assign) BOOL lastBaselineFlag;



//@property (nonatomic, assign) BOOL safeAreaTopFlag;
//@property (nonatomic, assign) BOOL safeAreaLeftFlag;
//@property (nonatomic, assign) BOOL safeAreaBottomFlag;
//@property (nonatomic, assign) BOOL safeAreaRightFlag;

@property (nonatomic, assign) BOOL sameFlag;

@end

@implementation Layout

- (Constraint *)top {
    _currentConstraint = NSLayoutAttributeTop;
    if (_topFlag) {
        return _top;
    } else {
        _top = [Constraint new];
        _top.useLayout = self;
        _topFlag = YES;
        return _top;
    }
}

- (Constraint *)left {
    _currentConstraint = NSLayoutAttributeLeft;
    if (_leftFlag) {
        return _left;
    } else {
        _left = [Constraint new];
        _left.useLayout = self;
        _leftFlag = YES;
        return _left;
    }
}

- (Constraint *)bottom {
    _currentConstraint = NSLayoutAttributeBottom;
    if (_bottomFlag) {
        return _bottom;
    } else {
        _bottom = [Constraint new];
        _bottom.useLayout = self;
        _bottomFlag = YES;
        return _bottom;
    }
}

- (Constraint *)right {
    _currentConstraint = NSLayoutAttributeRight;
    if (_rightFlag) {
        return _right;
    } else {
        _right = [Constraint new];
        _right.useLayout = self;
        _rightFlag = YES;
        return _right;
    }
}

- (Constraint *)centerX {
    _currentConstraint = NSLayoutAttributeCenterX;
    if (_centerX) {
        return _centerX;
    } else {
        _centerX = [Constraint new];
        _centerX.useLayout = self;
        _centerXFlag = YES;
        return _centerX;
    }
}

- (Constraint *)centerY {
    _currentConstraint = NSLayoutAttributeCenterY;
    if (_centerY) {
        return _right;
    } else {
        _centerY = [Constraint new];
        _centerY.useLayout = self;
        _centerYFlag = YES;
        return _centerY;
    }
}

- (Constraint *)width {
    _currentConstraint = NSLayoutAttributeWidth;
    if (_width) {
        return _width;
    } else {
        _width = [Constraint new];
        _width.useLayout = self;
        _widthFlag = YES;
        return _width;
    }
}

- (Constraint *)height {
    _currentConstraint = NSLayoutAttributeHeight;
    if (_height) {
        return _height;
    } else {
        _height = [Constraint new];
        _height.useLayout = self;
        _heightFlag = YES;
        return _height;
    }
}

- (Constraint *)firstBaseline {
    _currentConstraint = NSLayoutAttributeFirstBaseline;
    if (_firstBaseline) {
        return _firstBaseline;
    } else {
        _firstBaseline = [Constraint new];
        _firstBaseline.useLayout = self;
        _firstBaselineFlag = YES;
        return _firstBaseline;
    }
}

- (Constraint *)lastBaseline {
    _currentConstraint = NSLayoutAttributeLastBaseline;
    if (_lastBaseline) {
        return _lastBaseline;
    } else {
        _lastBaseline = [Constraint new];
        _lastBaseline.useLayout = self;
        _lastBaselineFlag = YES;
        return _lastBaseline;
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

@end
