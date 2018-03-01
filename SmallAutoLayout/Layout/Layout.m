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

@property (nonatomic, assign) BOOL topLayoutGuideFlag;
@property (nonatomic, assign) BOOL bottomLayoutGuideFlag;

@end

@implementation Layout

- (Constraint *)top {
    if (_top) {
        _top.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;

        _top.topLayoutGuideFlag = self.topLayoutGuideFlag;
        self.topLayoutGuideFlag = NO;

        _top.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
        self.bottomLayoutGuideFlag = NO;

        return _top;
    } else {
        _top = [Constraint new];
        _top.attribute = NSLayoutAttributeTop;
        _top.layoutItem = self.layoutItem;
        _top.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;

        _top.topLayoutGuideFlag = self.topLayoutGuideFlag;
        self.topLayoutGuideFlag = NO;

        _top.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
        self.bottomLayoutGuideFlag = NO;
        return _top;
    }
}

- (Constraint *)left {
    if (_left) {
        _left.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _left;
    } else {
        _left = [Constraint new];
        _left.attribute = NSLayoutAttributeLeft;
        _left.layoutItem = self.layoutItem;
        _left.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _left;
    }
}

- (Constraint *)bottom {
    if (_bottom) {
        _bottom.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;

        _bottom.topLayoutGuideFlag = self.topLayoutGuideFlag;
        self.topLayoutGuideFlag = NO;

        _bottom.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
        self.bottomLayoutGuideFlag = NO;

        return _bottom;
    } else {
        _bottom = [Constraint new];
        _bottom.attribute = NSLayoutAttributeBottom;
        _bottom.layoutItem = self.layoutItem;
        _bottom.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;

        _bottom.topLayoutGuideFlag = self.topLayoutGuideFlag;
        self.topLayoutGuideFlag = NO;

        _bottom.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
        self.bottomLayoutGuideFlag = NO;

        return _bottom;
    }
}

- (Constraint *)right {
    if (_right) {
        _right.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _right;
    } else {
        _right = [Constraint new];
        _right.attribute = NSLayoutAttributeRight;
        _right.layoutItem = self.layoutItem;
        _right.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _right;
    }
}

- (Constraint *)centerX {
    if (_centerX) {
        _centerX.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _centerX;
    } else {
        _centerX = [Constraint new];
        _centerX.attribute = NSLayoutAttributeCenterX;
        _centerX.layoutItem = self.layoutItem;
        _centerX.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _centerX;
    }
}

- (Constraint *)centerY {
    if (_centerY) {
        _centerY.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _centerY;
    } else {
        _centerY = [Constraint new];
        _centerY.attribute = NSLayoutAttributeCenterY;
        _centerY.layoutItem = self.layoutItem;
        _centerY.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _centerY;
    }
}

- (Constraint *)width {
    if (_width) {
        _width.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _width;
    } else {
        _width = [Constraint new];
        _width.attribute = NSLayoutAttributeWidth;
        _width.layoutItem = self.layoutItem;
        _width.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _width;
    }
}

- (Constraint *)height {
    if (_height) {
        _height.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _height;
    } else {
        _height = [Constraint new];
        _height.attribute = NSLayoutAttributeHeight;
        _height.layoutItem = self.layoutItem;
        _height.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _height;
    }
}

- (Constraint *)firstBaseline {
    if (_firstBaseline) {
        _firstBaseline.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _firstBaseline;
    } else {
        _firstBaseline = [Constraint new];
        _firstBaseline.attribute = NSLayoutAttributeFirstBaseline;
        _firstBaseline.layoutItem = self.layoutItem;
        _firstBaseline.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _firstBaseline;
    }
}

- (Constraint *)lastBaseline {
    if (_lastBaseline) {
        _lastBaseline.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _lastBaseline;
    } else {
        _lastBaseline = [Constraint new];
        _lastBaseline.attribute = NSLayoutAttributeLastBaseline;
        _lastBaseline.layoutItem = self.layoutItem;
        _lastBaseline.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _lastBaseline;
    }
}

- (Constraint *)leading {
    if (_leading) {
        _leading.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _leading;
    } else {
        _leading = [Constraint new];
        _leading.attribute = NSLayoutAttributeLeading;
        _leading.layoutItem = self.layoutItem;
        _leading.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _leading;
    }
}

- (Constraint *)trailing {
    if (_trailing) {
        _trailing.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _trailing;
    } else {
        _trailing = [Constraint new];
        _trailing.attribute = NSLayoutAttributeTrailing;
        _trailing.layoutItem = self.layoutItem;
        _trailing.safeAreaLayoutGuideFlag = self.safeAreaLayoutGuideFlag;
        self.safeAreaLayoutGuideFlag = NO;
        return _trailing;
    }
}

- (Layout *)safeAreaLayoutGuide {
    _safeAreaLayoutGuideFlag = YES;
    return self;
}

- (Layout *)topLayoutGuide {
    _topLayoutGuideFlag = YES;
    return self;
}

- (Layout *)bottomLayoutGuide {
    _bottomLayoutGuideFlag = YES;
    return self;
}



@end

