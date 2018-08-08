//
//  Layout.m
//  ABCD
//
//  Created by LiChunYang on 27/6/2018.
//  Copyright © 2018 com.qmtv. All rights reserved.
//

#import "Layout.h"
#import <UIKit/UIKit.h>
#import "UIView+Layout.h"

@interface Layout ()

@property (nonatomic, strong) Layout * left$;
@property (nonatomic, strong) Layout * right$;
/// Support topLayoutGuide bottomLayoutGuide
@property (nonatomic, strong) Layout * top$;
/// Support topLayoutGuide bottomLayoutGuide
@property (nonatomic, strong) Layout * bottom$;
@property (nonatomic, strong) Layout * leading$;
@property (nonatomic, strong) Layout * trailing$;
@property (nonatomic, strong) Layout * width$;
@property (nonatomic, strong) Layout * height$;
@property (nonatomic, strong) Layout * centerX$;
@property (nonatomic, strong) Layout * centerY$;

@property (nonatomic, strong) Layout * lastBaseline$;
@property (nonatomic, strong) Layout * baseline$;
@property (nonatomic, strong) Layout * firstBaseline$;
@property (nonatomic, strong) Layout * leftMargin$;
@property (nonatomic, strong) Layout * rightMargin$;
@property (nonatomic, strong) Layout * topMargin$;
@property (nonatomic, strong) Layout * bottomMargin$;
@property (nonatomic, strong) Layout * leadingMargin$;
@property (nonatomic, strong) Layout * trailingMargin$;
@property (nonatomic, strong) Layout * centerXMargin$;
@property (nonatomic, strong) Layout * centerYMargin$;

////////////////////////////////////////////////////////////////////////////复合属性////////////////////////////////////////////////////////////////////////////

/// 复合属性 Size 不能使用操单个约束的函数
@property (nonatomic, strong) Layout * size$;
/// 复合属性 Center 不能使用操作单个约束的函数
@property (nonatomic, strong) Layout * center$;
/// 复合属性 Insert 不能使用操作单个约束的函数
@property (nonatomic, strong) Layout * insert$;

@end

@implementation Layout

+ (instancetype)buildWithItem:(id)item mark:(NSString *)mark {
    Layout * layout = [Layout new];
    layout.mark = mark;
    layout.layoutItem = item;
    return layout;
}

- (NSLayoutConstraint *)make:(NSLayoutRelation)relation other:(id)other multiplier:(CGFloat)multiplier constant:(CGFloat)c {
//    NSArray * constraintArray = [(UIView *)self.layoutItem constraints];
//    if (constraintArray.count != 0) {
//        NSString * name = [self.mark substringToIndex:self.mark.length - 1];
//        for (NSLayoutConstraint * constraint in [(UIView *)self.layoutItem constraints]) {
//            if ([constraint.description containsString:name]) {
//                constraint.active = NO;
//            }
//        }
//    }
    
//    if ([(UIView *)self.layoutItem ownConstraints].count != 0) {
//        NSHashTable <NSLayoutConstraint *> * hashTable = [(UIView *)self.layoutItem ownConstraints];
//        for (NSLayoutConstraint * constraint in hashTable.allObjects) {
//            NSLog(@"%@.%ld -- %@.%ld", constraint.firstItem, (long)constraint.firstAttribute, constraint.secondItem, (long)constraint.secondAttribute);
//        }
//    }
    
    NSAssert(self.mark != nil, @"First item's LayoutAttribute must be exit");
    NSSet * set = [NSSet setWithObjects:@"center$", @"size$", @"safeAreaGuide$", @"topGuide$", @"bottomGuide$", nil];
    if ([set containsObject:self.mark]) {
        NSAssert(NO, @"%@没有缺省值", self.mark);
    }
    NSLayoutAttribute attribute = [self findAttribute:self.mark];
    NSAssert(attribute != NSLayoutAttributeNotAnAttribute, @"First item's LayoutAttribute must be exit");
    if (other == nil) {
        if ([self.layoutItem isKindOfClass:[UIViewController class]]) {
            NSAssert(NO, @"设置控制器的topLayoutGuide bottomLayoutGuide是不生效的");
            return nil;
        } else {
//            处理安全区 自定试图的范围一般来说是跟安全区范围一致的
            if (self.safeAreaGuideFlag) {
                if ([self.mark isEqualToString:@"width$"]) {
                    if (@available(iOS 11.0, *)) {
                        NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:multiplier constant:c];
                        constraint.active = YES;
                        [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                        return constraint;
                    } else {
                        NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                        return nil;
                    }
                } else if ([self.mark isEqualToString:@"height$"]) {
                    if (@available(iOS 11.0, *)) {
                        NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:multiplier constant:c];
                        constraint.active = YES;
                        [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                        return constraint;
                    } else {
                        NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                        return nil;
                    }
                } else {
                    NSAssert(NO, @"Only Support Width and Height");
                    return nil;
                }
            } else {
//            处理非安全区
                if ([self.mark isEqualToString:@"width$"]) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeWidth) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:multiplier constant:c];
                    constraint.active = YES;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                    return constraint;
                } else if ([self.mark isEqualToString:@"height$"]) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeHeight) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:multiplier constant:c];
                    constraint.active = YES;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                    return constraint;
                } else {
                    NSAssert(NO, @"Only Support width$ and height$");
                    return nil;
                }
            }
        }
    } else if ([other isKindOfClass:[NSNumber class]]) {
        if ([self.layoutItem isKindOfClass:[UIViewController class]]) {
            NSAssert(NO, @"设置控制器的topLayoutGuide bottomLayoutGuide是不生效的");
            return nil;
        } else {
            if (self.safeAreaGuideFlag) {
                if ([self.mark isEqualToString:@"width$"]) {
                    if (@available(iOS 11.0, *)) {
                        NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:[(NSNumber *)other floatValue] + c];
                        constraint.active = YES;
                        [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                        return constraint;
                    } else {
                        NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                        return nil;
                    }
                } else if ([self.mark isEqualToString:@"height$"]) {
                    if (@available(iOS 11.0, *)) {
                        NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:[(NSNumber *)other floatValue] + c];
                        constraint.active = YES;
                        [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                        return constraint;
                    } else {
                        NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                        return nil;
                    }
                } else {
                    NSAssert(NO, @"Only Support Width and Height");
                    return nil;
                }
            } else {
                //            处理非安全区
                if ([self.mark isEqualToString:@"width$"]) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeWidth) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:[(NSNumber *)other floatValue] + c];
                    constraint.active = YES;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                    return constraint;
                } else if ([self.mark isEqualToString:@"height$"]) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeHeight) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:[(NSNumber *)other floatValue] + c];
                    constraint.active = YES;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                    return constraint;
                } else {
                    NSAssert(NO, @"Only Support Width and Height");
                    return nil;
                }
            }
        }
    } else if ([other isKindOfClass:[UIView class]]) {
        if ([self.layoutItem isKindOfClass:[UIViewController class]]) {
            UIViewController * item0 = self.layoutItem;
            NSLayoutAttribute attr0 = [self findAttribute:self.mark];
            id item1 = other;
            NSLayoutAttribute attr1 = attr0;
            if (self.topLayoutGuideFlag && !self.bottomLayoutGuideFlag) {
                NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0.topLayoutGuide attribute:attr0 relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                constraint.active = YES;
                [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                return constraint;
            } else if (!self.topLayoutGuideFlag && self.bottomLayoutGuideFlag) {
                NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0.bottomLayoutGuide attribute:attr0 relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                constraint.active = YES;
                [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                return constraint;
            } else {
                NSAssert(NO, @"Only View-View, UIViewController-View constraint");
                return nil;
            }
        } else if ([self.layoutItem isKindOfClass:[UIView class]]) {
            if (@available(iOS 11.0, *)) {
                NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.safeAreaGuideFlag == YES ? [(UIView *)self.layoutItem safeAreaLayoutGuide] : self.layoutItem attribute:[self findAttribute:self.mark] relatedBy:(relation) toItem:other attribute:[self findAttribute:[self mark]] multiplier:multiplier constant:c];
                constraint.active = YES;
                [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                return constraint;
            } else {
                NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                return nil;
            }
        } else {
            NSAssert(NO, @"Only View-View, UIViewController-View constraint");
            return nil;
        }
    } else if ([other isKindOfClass:[Layout class]]) {
        if ([self.layoutItem isKindOfClass:[UIView class]] && [[(Layout *)other layoutItem] isKindOfClass:[UIView class]]) {
            if (@available(iOS 11.0, *)) {
                id item0 = self.safeAreaGuideFlag == YES ? [(UIView *)self.layoutItem safeAreaLayoutGuide] : self.layoutItem;
                id item1 = [(Layout *)other safeAreaGuideFlag] == YES ? [(UIView *)[(Layout *)other layoutItem] safeAreaLayoutGuide] : [(Layout *)other layoutItem];
                NSLayoutAttribute attr0 = [self findAttribute:self.mark];
                NSLayoutAttribute attr1 = [self findAttribute:[(Layout *)other mark]] == NSLayoutAttributeNotAnAttribute ? attr0 : [self findAttribute:[(Layout *)other mark]];
                NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0 attribute:attr0 relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                constraint.active = YES;
                [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                return constraint;
            } else {
                NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                return nil;
            }
        } else if ([self.layoutItem isKindOfClass:[UIViewController class]] && [[(Layout *)other layoutItem] isKindOfClass:[UIView class]]) {
            if (@available(iOS 11.0, *)) {
                UIViewController * item0 = self.layoutItem;
                NSLayoutAttribute attr0 = [self findAttribute:self.mark];
                id item1 = [(Layout *)other safeAreaGuideFlag] == YES ? [(UIView *)[(Layout *)other layoutItem] safeAreaLayoutGuide] : [(Layout *)other layoutItem];
                NSLayoutAttribute attr1 = [self findAttribute:[(Layout *)other mark]] == NSLayoutAttributeNotAnAttribute ? attr0 : [self findAttribute:[(Layout *)other mark]];
                if (self.topLayoutGuideFlag && !self.bottomLayoutGuideFlag) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0.topLayoutGuide attribute:(attr0) relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                    constraint.active = YES;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                    return constraint;
                } else if (!self.topLayoutGuideFlag && self.bottomLayoutGuideFlag) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0.bottomLayoutGuide attribute:(attr0) relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                    constraint.active = YES;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                    return constraint;
                } else {
                    NSAssert(NO, @"Only View-View, UIViewController-View constraint");
                    return nil;
                }
            } else {
                NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                return nil;
            }
        } else if ([self.layoutItem isKindOfClass:[UIView class]] && [[(Layout *)other layoutItem] isKindOfClass:[UIViewController class]]) {
            if (@available(iOS 11.0, *)) {
                UIViewController * item0 = [(Layout *)other layoutItem];
                NSLayoutAttribute attr0 = [self findAttribute:[(Layout *)other mark]] == NSLayoutAttributeNotAnAttribute ? [self findAttribute:self.mark] : [self findAttribute:[(Layout *)other mark]];
                id item1 = [self safeAreaGuideFlag] == YES ? [(UIView *)self.layoutItem safeAreaLayoutGuide] : self.layoutItem;
                NSLayoutAttribute attr1 = [self findAttribute:self.mark];
                if ([(Layout *)other topLayoutGuideFlag] && ![(Layout *)other bottomLayoutGuideFlag]) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0.topLayoutGuide attribute:(attr0) relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                    constraint.active = YES;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                    return constraint;
                } else if (![(Layout *)other topLayoutGuideFlag] && [(Layout *)other bottomLayoutGuideFlag]) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0.bottomLayoutGuide attribute:(attr0) relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                    constraint.active = YES;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:constraint];
                    return constraint;
                } else {
                    return nil;
                }
            } else {
                NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                return nil;
            }
        } else {
            NSAssert(NO, @"Only View-View, UIViewController-View constraint");
            return nil;
        }
    } else {
        NSAssert(NO, @"Only Support nil, UIView, NSNumber");
        return nil;
    }
}

- (NSLayoutAttribute)findAttribute:(NSString *)name {
    if ([name isEqualToString:@"left$"]) {
        return NSLayoutAttributeLeft;
    } else if ([name isEqualToString:@"right$"]) {
        return NSLayoutAttributeRight;
    } else if ([name isEqualToString:@"top$"]) {
        return NSLayoutAttributeTop;
    } else if ([name isEqualToString:@"bottom$"]) {
        return NSLayoutAttributeBottom;
    } else if ([name isEqualToString:@"leading$"]) {
        return NSLayoutAttributeLeading;
    } else if ([name isEqualToString:@"trailing$"]) {
        return NSLayoutAttributeTrailing;
    } else if ([name isEqualToString:@"width$"]) {
        return NSLayoutAttributeWidth;
    } else if ([name isEqualToString:@"height$"]) {
        return NSLayoutAttributeHeight;
    } else if ([name isEqualToString:@"centerX$"]) {
        return NSLayoutAttributeCenterX;
    } else if ([name isEqualToString:@"centerY$"]) {
        return NSLayoutAttributeCenterY;
    } else if ([name isEqualToString:@"lastBaseline$"]) {
        return NSLayoutAttributeLastBaseline;
    } else if ([name isEqualToString:@"baseline$"]) {
        return NSLayoutAttributeBaseline;
    } else if ([name isEqualToString:@"firstBaseline$"]) {
        return NSLayoutAttributeFirstBaseline;
    } else if ([name isEqualToString:@"leftMargin$"]) {
        return NSLayoutAttributeLeftMargin;
    } else if ([name isEqualToString:@"rightMargin$"]) {
        return NSLayoutAttributeRightMargin;
    } else if ([name isEqualToString:@"topMargin$"]) {
        return NSLayoutAttributeTopMargin;
    } else if ([name isEqualToString:@"bottomMargin$"]) {
        return NSLayoutAttributeBottomMargin;
    } else if ([name isEqualToString:@"leadingMargin$"]) {
        return NSLayoutAttributeLeadingMargin;
    } else if ([name isEqualToString:@"trailingMargin$"]) {
        return NSLayoutAttributeTrailingMargin;
    } else if ([name isEqualToString:@"centerXMargin$"]) {
        return NSLayoutAttributeCenterXWithinMargins;
    } else if ([name isEqualToString:@"centerYMargin$"]) {
        return NSLayoutAttributeCenterYWithinMargins;
    } else if ([name isEqualToString:@"safeAreaGuide$"]) {
        return NSLayoutAttributeNotAnAttribute;
    } else if ([name isEqualToString:@"topGuide$"]) {
        return NSLayoutAttributeNotAnAttribute;
    } else if ([name isEqualToString:@"bottomGuide$"]) {
         return NSLayoutAttributeNotAnAttribute;
    } else {
        return NSLayoutAttributeNotAnAttribute;
    }
}

- (Layout *)top$ {
    if (!_top$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"top$"];
        _top$ = layout;
        _top$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _top$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _top$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _top$;
}

- (Layout *)left$ {
    if (!_left$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"left$"];
        _left$ = layout;
        _left$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _left$;
}

- (Layout *)bottom$ {
    if (!_bottom$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"bottom$"];
        _bottom$ = layout;
        _bottom$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _bottom$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _bottom$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _bottom$;
}

- (Layout *)right$ {
    if (!_right$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"right$"];
        _right$ = layout;
        _right$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _right$;
}

- (Layout *)leading$ {
    if (!_leading$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"leading$"];
        _leading$ = layout;
        _leading$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _leading$;
}

- (Layout *)trailing$ {
    if (!_trailing$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"trailing$"];
        _trailing$ = layout;
        _trailing$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _trailing$;
}

- (Layout *)width$ {
    if (!_width$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"width$"];
        _width$ = layout;
        _width$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _width$;
}

- (Layout *)height$ {
    if (!_height$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"height$"];
        _height$ = layout;
        _height$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _height$;
}

- (Layout *)centerX$ {
    if (!_centerX$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"centerX$"];
        _centerX$ = layout;
        _centerX$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _centerX$;
}

- (Layout *)centerY$ {
    if (!_centerY$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"centerY$"];
        _centerY$ = layout;
        _centerY$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _centerY$;
}

- (Layout *)lastBaseline$ {
    if (!_lastBaseline$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"lastBaseline$"];
        _lastBaseline$ = layout;
        _lastBaseline$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _lastBaseline$;
}

- (Layout *)baseline$ {
    if (!_baseline$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"baseline$"];
        _baseline$ = layout;
        _baseline$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _baseline$;
}

- (Layout *)firstBaseline$ {
    if (!_firstBaseline$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"firstBaseline$"];
        _firstBaseline$ = layout;
        _firstBaseline$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _firstBaseline$;
}

- (Layout *)leftMargin$ {
    if (!_leftMargin$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"leftMargin$"];
        _leftMargin$ = layout;
        _leftMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _leftMargin$;
}

- (Layout *)rightMargin$ {
    if (!_rightMargin$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"rightMargin$"];
        _rightMargin$ = layout;
        _rightMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _rightMargin$;
}

- (Layout *)topMargin$ {
    if (!_topMargin$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"topMargin$"];
        _topMargin$ = layout;
        _topMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _topMargin$;
}

- (Layout *)bottomMargin$ {
    if (!_bottomMargin$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"bottomMargin$"];
        _bottomMargin$ = layout;
        _bottomMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _bottomMargin$;
}

- (Layout *)leadingMargin$ {
    if (!_leadingMargin$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"leadingMargin$"];
        _leadingMargin$ = layout;
        _leadingMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _leadingMargin$;
}

- (Layout *)trailingMargin$ {
    if (!_trailingMargin$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"trailingMargin$"];
        _trailingMargin$ = layout;
        _trailingMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
    }
    return _trailingMargin$;
}

- (Layout *)centerXMargin$ {
    if (!_centerXMargin$) {
        Layout * layou = [Layout buildWithItem:self.layoutItem mark:@"centerXMargin$"];
        _centerXMargin$ = layou;
        _centerXMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _centerXMargin$.layoutItem = self.layoutItem;
    }
    return _centerXMargin$;
}

- (Layout *)centerYMargin$ {
    if (!_centerYMargin$) {
        Layout * layou = [Layout buildWithItem:self.layoutItem mark:@"centerYMargin$"];
        _centerYMargin$ = layou;
        _centerYMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _centerYMargin$.layoutItem = self.layoutItem;
    }
    return _centerYMargin$;
}

- (Layout *)center$ {
    if (!_center$) {
        Layout * layou = [Layout buildWithItem:self.layoutItem mark:@"center$"];
        _center$ = layou;
        _center$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _center$.layoutItem = self.layoutItem;
    }
    return _center$;
}

- (Layout *)size$ {
    if (!_size$) {
        Layout * layout = [Layout buildWithItem:self.layoutItem mark:@"size$"];
        _size$ = layout;
        _size$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _size$.layoutItem = self.layoutItem;
    }
    return _size$;
}

- (Layout *)insert$ {
    if (!_insert$) {
        Layout * layout = [Layout buildWithItem:self mark:@"insert$"];
        _insert$ = layout;
        _insert$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _insert$.layoutItem = self.layoutItem;
    }
    return _insert$;
}

- (NSLayoutConstraint *)equalTo:(id)other rate:(CGFloat)rate trim:(CGFloat)c {
    return [self make:(NSLayoutRelationEqual) other:other multiplier:rate constant:c];
}

- (NSLayoutConstraint *)equalTo:(id)other rate:(CGFloat)rate {
    return [self make:(NSLayoutRelationEqual) other:other multiplier:rate constant:0.0];
}

- (NSLayoutConstraint *)equalTo:(id)other trim:(CGFloat)c {
    return [self make:(NSLayoutRelationEqual) other:other multiplier:1.0 constant:c];
}

- (NSLayoutConstraint *)equalTo:(id)other {
    return [self make:(NSLayoutRelationEqual) other:other multiplier:1.0 constant:0.0];
}

- (NSLayoutConstraint *)lessOrEqualTo:(id)other rate:(CGFloat)rate trim:(CGFloat)c {
    return [self make:(NSLayoutRelationLessThanOrEqual) other:other multiplier:rate constant:c];
}

- (NSLayoutConstraint *)lessOrEqualTo:(id)other rate:(CGFloat)rate {
    return [self make:NSLayoutRelationLessThanOrEqual other:other multiplier:rate constant:0.0];
}

- (NSLayoutConstraint *)lessOrEqualTo:(id)other trim:(CGFloat)c {
    return [self make:(NSLayoutRelationLessThanOrEqual) other:other multiplier:1.0 constant:c];
}

- (NSLayoutConstraint *)lessOrEqualTo:(id)other {
    return [self make:NSLayoutRelationLessThanOrEqual other:other multiplier:1.0 constant:0.0];
}

- (NSLayoutConstraint *)greaterOrEqualTo:(id)other rate:(CGFloat)rate trim:(CGFloat)c {
    return [self make:(NSLayoutRelationGreaterThanOrEqual) other:other multiplier:rate constant:c];
}

- (NSLayoutConstraint *)greaterOrEqualTo:(id)other rate:(CGFloat)rate {
    return [self make:(NSLayoutRelationGreaterThanOrEqual) other:other multiplier:rate constant:0.0];
}

- (NSLayoutConstraint *)greaterOrEqualTo:(id)other trim:(CGFloat)c {
    return [self make:NSLayoutRelationGreaterThanOrEqual other:other multiplier:1.0 constant:c];
}

- (NSLayoutConstraint *)greaterOrEqualTo:(id)other {
    return [self make:NSLayoutRelationGreaterThanOrEqual other:other multiplier:1.0 constant:0.0];
}

- (NSArray <NSLayoutConstraint *> *)size:(id _Nullable)other trim:(CGSize)trim {
    NSAssert(other != nil, @"other 不能为空");
    if (self.safeAreaGuideFlag) {
        if ([other isKindOfClass:[UIView class]]) {
            if (@available(iOS 11.0, *)) {
                NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeWidth) multiplier:1.0 constant:trim.width];
                widthConstraint.active = YES;
                NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeHeight) multiplier:1.0 constant:trim.height];
                heightConstraint.active = YES;
                return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
            } else {
                NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                return nil;
            }
        } else if ([other isKindOfClass:[Layout class]]) {
            if ([(Layout *)other safeAreaGuideFlag]) {
                if (@available(iOS 11.0, *)) {
                    NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other layoutItem] safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) multiplier:1.0 constant:trim.width];
                    widthConstraint.active = YES;
                    NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other layoutItem] safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) multiplier:1.0 constant:trim.height];
                    heightConstraint.active = YES;
                    return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
                } else {
                    NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                    return nil;
                }
            } else {
                if (@available(iOS 11.0, *)) {
                    NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other layoutItem] attribute:(NSLayoutAttributeWidth) multiplier:1.0 constant:trim.width];
                    widthConstraint.active = YES;
                    NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other layoutItem] attribute:(NSLayoutAttributeHeight) multiplier:1.0 constant:trim.height];
                    heightConstraint.active = YES;
                    return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
                } else {
                    NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                    return nil;
                }
            }
        } else if ([other isKindOfClass:[NSValue class]]) {
            CGSize size = [other CGSizeValue];
            if (@available(iOS 11.0, *)) {
                NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:size.width + trim.width];
                widthConstraint.active = YES;
                NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:size.height + trim.height];
                heightConstraint.active = YES;
                return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
            } else {
                NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                return nil;
            }
        } else {
            NSAssert(NO, @"other参数只支持NSValue UIView Layout类型");
            return nil;
        }
    } else {
        if ([other isKindOfClass:[UIView class]]) {
            NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeWidth) multiplier:1.0 constant:trim.width];
            widthConstraint.active = YES;
            NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeHeight) multiplier:1.0 constant:trim.height];
            heightConstraint.active = YES;
            return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
        } else if ([other isKindOfClass:[Layout class]]) {
            if ([(Layout *)other safeAreaGuideFlag]) {
                if (@available(iOS 11.0, *)) {
                    NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other layoutItem] safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) multiplier:1.0 constant:trim.width];
                    widthConstraint.active = YES;
                    NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other layoutItem] safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) multiplier:1.0 constant:trim.height];
                    heightConstraint.active = YES;
                    return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
                } else {
                    // Fallback on earlier versions
                    NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                    return nil;
                }
            } else {
                NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other layoutItem] attribute:(NSLayoutAttributeWidth) multiplier:1.0 constant:trim.width];
                widthConstraint.active = YES;
                NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other layoutItem] attribute:(NSLayoutAttributeHeight) multiplier:1.0 constant:trim.height];
                heightConstraint.active = YES;
                return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
            }
        } else if ([other isKindOfClass:[NSValue class]]) {
            CGSize size = [other CGSizeValue];
            NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:size.width + trim.width];
                widthConstraint.active = YES;
            NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:size.height + trim.height];
            heightConstraint.active = YES;
            return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
        } else {
            NSAssert(NO, @"other参数只支持NSValue UIView Layout类型");
            return nil;
        }
    }
}

- (NSArray <NSLayoutConstraint *> *)size:(id _Nullable)other {
    return [self size:other trim:(CGSizeZero)];
}

- (NSArray <NSLayoutConstraint *> *)center:(id _Nullable)other trim:(CGSize)trim {
    if ([other isKindOfClass:[UIView class]]) {
        NSLayoutConstraint * centerXConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeCenterX) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeCenterX) multiplier:1.0 constant:trim.width];
        centerXConstraint.active = YES;
        NSLayoutConstraint * centerYConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeCenterY) multiplier:1.0 constant:trim.height];
        centerYConstraint.active = YES;
        return [NSArray arrayWithObjects:centerXConstraint, centerYConstraint, nil];
    } else if ([other isKindOfClass:[self class]]) {
        NSLayoutConstraint * centerXConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeCenterX) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other layoutItem] attribute:(NSLayoutAttributeCenterX) multiplier:1.0 constant:trim.width];
        centerXConstraint.active = YES;
        NSLayoutConstraint * centerYConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other layoutItem] attribute:(NSLayoutAttributeCenterY) multiplier:1.0 constant:trim.height];
        centerYConstraint.active = YES;
        return [NSArray arrayWithObjects:centerXConstraint, centerYConstraint, nil];
    } else {
        NSAssert(NO, @"parameter must be (UIView | Layout) type");
        return nil;
    }
}

- (NSArray <NSLayoutConstraint *> *)center:(id _Nullable)other {
    return [self center:other trim:(CGSizeZero)];
}

- (NSArray <NSLayoutConstraint *> *)insert:(id _Nonnull)other trim:(UIEdgeInsets)trim {
    if (self.safeAreaGuideFlag) {
        if ([other isKindOfClass:[UIView class]]) {
            if (@available(iOS 11.0, *)) {
                NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:trim.top];
                topConstraint.active = YES;
                NSLayoutConstraint * leftConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:trim.left];
                leftConstraint.active = YES;
                NSLayoutConstraint * bottomConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:trim.bottom];
                bottomConstraint.active = YES;
                NSLayoutConstraint * rightConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:trim.right];
                rightConstraint.active = YES;
                return [NSArray arrayWithObjects:topConstraint, leftConstraint, bottomConstraint, rightConstraint, nil];
            } else {
                NSAssert(NO, @"other参数只支持NSValue UIView Layout类型");
                return nil;
            }
        } else if ([other isKindOfClass:[Layout class]]) {
            if ([(Layout *)other safeAreaGuideFlag]) {
                if (@available(iOS 11.0, *)) {
                    NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other layoutItem] safeAreaLayoutGuide] attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:trim.top];
                    topConstraint.active = YES;
                    NSLayoutConstraint * leftConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other layoutItem] safeAreaLayoutGuide] attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:trim.left];
                    leftConstraint.active = YES;
                    NSLayoutConstraint * bottomConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other layoutItem] safeAreaLayoutGuide] attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:trim.bottom];
                    bottomConstraint.active = YES;
                    NSLayoutConstraint * rightConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other layoutItem] safeAreaLayoutGuide] attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:trim.right];
                    rightConstraint.active = YES;
                    return [NSArray arrayWithObjects:topConstraint, leftConstraint, bottomConstraint, rightConstraint, nil];
                } else {
                    NSAssert(NO, @"other参数只支持NSValue UIView Layout类型");
                    return nil;
                }
            } else {
                if (@available(iOS 11.0, *)) {
                    NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other layoutItem] attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:trim.top];
                    topConstraint.active = YES;
                    NSLayoutConstraint * leftConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other layoutItem] attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:trim.left];
                    leftConstraint.active = YES;
                    NSLayoutConstraint * bottomConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other layoutItem] attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:trim.bottom];
                    bottomConstraint.active = YES;
                    NSLayoutConstraint * rightConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other layoutItem] attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:trim.right];
                    rightConstraint.active = YES;
                    return [NSArray arrayWithObjects:topConstraint, leftConstraint, bottomConstraint, rightConstraint, nil];
                } else {
                    NSAssert(NO, @"other参数只支持NSValue UIView Layout类型");
                    return nil;
                }
            }
        } else {
            NSAssert(NO, @"other参数只支持UIView Layout类型");
            return nil;
        }
    } else {
        if ([other isKindOfClass:[UIView class]]) {
            NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:trim.top];
            topConstraint.active = YES;
            NSLayoutConstraint * leftConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:trim.left];
            leftConstraint.active = YES;
            NSLayoutConstraint * bottomConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:trim.bottom];
            bottomConstraint.active = YES;
            NSLayoutConstraint * rightConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:trim.right];
            rightConstraint.active = YES;
            return [NSArray arrayWithObjects:topConstraint, leftConstraint, bottomConstraint, rightConstraint, nil];
        } else if ([other isKindOfClass:[Layout class]]) {
            if ([(Layout *)other safeAreaGuideFlag]) {
                if (@available(iOS 11.0, *)) {
                    NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other layoutItem] safeAreaLayoutGuide] attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:trim.top];
                    topConstraint.active = YES;
                    NSLayoutConstraint * leftConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other layoutItem] safeAreaLayoutGuide] attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:trim.left];
                    leftConstraint.active = YES;
                    NSLayoutConstraint * bottomConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other layoutItem] safeAreaLayoutGuide] attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:trim.bottom];
                    bottomConstraint.active = YES;
                    NSLayoutConstraint * rightConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other layoutItem] safeAreaLayoutGuide] attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:trim.right];
                    rightConstraint.active = YES;
                    return [NSArray arrayWithObjects:topConstraint, leftConstraint, bottomConstraint, rightConstraint, nil];
                } else {
                    NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                    return nil;
                }
            } else {
                NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other layoutItem] attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:trim.top];
                topConstraint.active = YES;
                NSLayoutConstraint * leftConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other layoutItem] attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:trim.left];
                leftConstraint.active = YES;
                NSLayoutConstraint * bottomConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other layoutItem] attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:trim.bottom];
                bottomConstraint.active = YES;
                NSLayoutConstraint * rightConstraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other layoutItem] attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:trim.right];
                rightConstraint.active = YES;
                return [NSArray arrayWithObjects:topConstraint, leftConstraint, bottomConstraint, rightConstraint, nil];
            }
        } else {
            NSAssert(NO, @"other参数只支持UIView Layout类型");
            return nil;
        }
    }
}

- (NSArray <NSLayoutConstraint *> *)insert:(id _Nonnull)other {
    return [self insert:other trim:(UIEdgeInsetsZero)];
}

- (void)clearConstraints {
    NSArray <NSLayoutConstraint *> * constraints = [(UIView *)self.layoutItem constraints];
    
}

@end
