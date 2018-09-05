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
    if ([item isKindOfClass:[UIView class]]) {
        NSLog(@"%@", [(UIView *)item superview]);
        if (![(UIView *)item superview]) {
            [(UIView *)item setTranslatesAutoresizingMaskIntoConstraints:YES];
        } else {
            if ([[(UIView *)item superview] isKindOfClass:[UITableViewCell class]] || [[(UIView *)item superview] isKindOfClass:[UICollectionViewCell class]]) {
                [(UIView *)item setTranslatesAutoresizingMaskIntoConstraints:YES];
            } else {
                [(UIView *)item setTranslatesAutoresizingMaskIntoConstraints:NO];
            }
        }
    } else if ([item isKindOfClass:[UIViewController class]]) {
        NSLog(@"%@", item);
    } else {
        NSAssert(NO, @"不支持的类型");
    }
    Layout * layout = [Layout new];
    layout.mark = mark;
    layout.layoutItem = item;
    return layout;
}

static inline NSSet * specialSet() {
    return [NSSet setWithObjects:@"safeAreaGuide$", @"topGuide$", @"bottomGuide$", nil];
}

- (NSLayoutConstraint *)make:(NSLayoutRelation)relation other:(id)other multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    NSAssert(self.mark != nil, @"First item's LayoutAttribute must be exit");
    NSSet * set = specialSet();
    if ([set containsObject:self.mark]) {
        NSAssert(NO, @"%@没有缺省值", self.mark);
    }
    NSLayoutAttribute attribute = [self findAttribute:self.mark];
    NSAssert(attribute != NSLayoutAttributeNotAnAttribute, @"First item's LayoutAttribute must be exit");
    id item = self.layoutItem;
    if ([(UIView *)self.layoutItem ownConstraints].count != 0) {
        NSHashTable <NSLayoutConstraint *> * hashTable = [(UIView *)self.layoutItem ownConstraints];
        for (NSLayoutConstraint * constraint in hashTable.allObjects) {
/// 删除冲突的约束
            if ((constraint.firstItem == item && constraint.firstAttribute == attribute) || (constraint.secondItem == item && constraint.secondAttribute == attribute)) {
                constraint.active = NO;
            }
        }
    }
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
                        __weak typeof(constraint) weakConstraint = constraint;
                        [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
                        return constraint;
                    } else {
                        NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                        return nil;
                    }
                } else if ([self.mark isEqualToString:@"height$"]) {
                    if (@available(iOS 11.0, *)) {
                        NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:multiplier constant:c];
                        constraint.active = YES;
                        __weak typeof(constraint) weakConstraint = constraint;
                        [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
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
                    __weak typeof(constraint) weakConstraint = constraint;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
                    return constraint;
                } else if ([self.mark isEqualToString:@"height$"]) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeHeight) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:multiplier constant:c];
                    constraint.active = YES;
                    __weak typeof(constraint) weakConstraint = constraint;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
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
                        __weak typeof(constraint) weakConstraint = constraint;
                        [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
                        return constraint;
                    } else {
                        NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                        return nil;
                    }
                } else if ([self.mark isEqualToString:@"height$"]) {
                    if (@available(iOS 11.0, *)) {
                        NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.layoutItem safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:[(NSNumber *)other floatValue] + c];
                        constraint.active = YES;
                        __weak typeof(constraint) weakConstraint = constraint;
                        [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
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
                    __weak typeof(constraint) weakConstraint = constraint;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
                    return constraint;
                } else if ([self.mark isEqualToString:@"height$"]) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.layoutItem attribute:(NSLayoutAttributeHeight) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:[(NSNumber *)other floatValue] + c];
                    constraint.active = YES;
                    __weak typeof(constraint) weakConstraint = constraint;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
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
                __weak typeof(constraint) weakConstraint = constraint;
                [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
                return constraint;
            } else if (!self.topLayoutGuideFlag && self.bottomLayoutGuideFlag) {
                NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0.bottomLayoutGuide attribute:attr0 relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                constraint.active = YES;
                __weak typeof(constraint) weakConstraint = constraint;
                [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
                return constraint;
            } else {
                NSAssert(NO, @"Only View-View, UIViewController-View constraint");
                return nil;
            }
        } else if ([self.layoutItem isKindOfClass:[UIView class]]) {
            if (@available(iOS 11.0, *)) {
                NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.safeAreaGuideFlag == YES ? [(UIView *)self.layoutItem safeAreaLayoutGuide] : self.layoutItem attribute:[self findAttribute:self.mark] relatedBy:(relation) toItem:other attribute:[self findAttribute:[self mark]] multiplier:multiplier constant:c];
                constraint.active = YES;
                __weak typeof(constraint) weakConstraint = constraint;
                [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
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
                __weak typeof(constraint) weakConstraint = constraint;
                [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
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
                    __weak typeof(constraint) weakConstraint = constraint;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
                    return constraint;
                } else if (!self.topLayoutGuideFlag && self.bottomLayoutGuideFlag) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0.bottomLayoutGuide attribute:(attr0) relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                    constraint.active = YES;
                    __weak typeof(constraint) weakConstraint = constraint;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
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
                    __weak typeof(constraint) weakConstraint = constraint;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
                    return constraint;
                } else if (![(Layout *)other topLayoutGuideFlag] && [(Layout *)other bottomLayoutGuideFlag]) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0.bottomLayoutGuide attribute:(attr0) relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                    constraint.active = YES;
                    __weak typeof(constraint) weakConstraint = constraint;
                    [[(UIView *)self.layoutItem ownConstraints] addObject:weakConstraint];
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
        _top$ = [Layout buildWithItem:self.layoutItem mark:@"top$"];
        _top$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _top$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _top$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _top$;
}

- (Layout *)left$ {
    if (!_left$) {
        _left$ = [Layout buildWithItem:self.layoutItem mark:@"left$"];
        _left$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _left$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _left$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _left$;
}

- (Layout *)bottom$ {
    if (!_bottom$) {
        _bottom$ = [Layout buildWithItem:self.layoutItem mark:@"bottom$"];
        _bottom$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _bottom$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _bottom$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _bottom$;
}

- (Layout *)right$ {
    if (!_right$) {
        _right$ = [Layout buildWithItem:self.layoutItem mark:@"right$"];
        _right$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _right$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _right$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _right$;
}

- (Layout *)leading$ {
    if (!_leading$) {
        _leading$ = [Layout buildWithItem:self.layoutItem mark:@"leading$"];
        _leading$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _leading$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _leading$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _leading$;
}

- (Layout *)trailing$ {
    if (!_trailing$) {
        _trailing$ = [Layout buildWithItem:self.layoutItem mark:@"trailing$"];
        _trailing$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _trailing$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _trailing$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _trailing$;
}

- (Layout *)width$ {
    if (!_width$) {
        _width$ = [Layout buildWithItem:self.layoutItem mark:@"width$"];
        _width$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _width$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _width$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _width$;
}

- (Layout *)height$ {
    if (!_height$) {
        _height$ = [Layout buildWithItem:self.layoutItem mark:@"height$"];
        _height$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _height$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _height$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _height$;
}

- (Layout *)centerX$ {
    if (!_centerX$) {
        _centerX$ = [Layout buildWithItem:self.layoutItem mark:@"centerX$"];
        _centerX$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _centerX$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _centerX$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _centerX$;
}

- (Layout *)centerY$ {
    if (!_centerY$) {
        _centerY$ = [Layout buildWithItem:self.layoutItem mark:@"centerY$"];
        _centerY$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _centerY$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _centerY$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _centerY$;
}

- (Layout *)lastBaseline$ {
    if (!_lastBaseline$) {
        _lastBaseline$ = [Layout buildWithItem:self.layoutItem mark:@"lastBaseline$"];
        _lastBaseline$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _lastBaseline$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _lastBaseline$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _lastBaseline$;
}

- (Layout *)baseline$ {
    if (!_baseline$) {
        _baseline$ = [Layout buildWithItem:self.layoutItem mark:@"baseline$"];
        _baseline$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _baseline$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _baseline$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _baseline$;
}

- (Layout *)firstBaseline$ {
    if (!_firstBaseline$) {
        _firstBaseline$ = [Layout buildWithItem:self.layoutItem mark:@"firstBaseline$"];
        _firstBaseline$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _firstBaseline$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _firstBaseline$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _firstBaseline$;
}

- (Layout *)leftMargin$ {
    if (!_leftMargin$) {
        _leftMargin$ = [Layout buildWithItem:self.layoutItem mark:@"leftMargin$"];;
        _leftMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _leftMargin$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _leftMargin$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _leftMargin$;
}

- (Layout *)rightMargin$ {
    if (!_rightMargin$) {
        _rightMargin$ = [Layout buildWithItem:self.layoutItem mark:@"rightMargin$"];
        _rightMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _rightMargin$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _rightMargin$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _rightMargin$;
}

- (Layout *)topMargin$ {
    if (!_topMargin$) {
        _topMargin$ = [Layout buildWithItem:self.layoutItem mark:@"topMargin$"];
        _topMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _topMargin$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _topMargin$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _topMargin$;
}

- (Layout *)bottomMargin$ {
    if (!_bottomMargin$) {
        _bottomMargin$ = [Layout buildWithItem:self.layoutItem mark:@"bottomMargin$"];
        _bottomMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _bottomMargin$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _bottomMargin$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _bottomMargin$;
}

- (Layout *)leadingMargin$ {
    if (!_leadingMargin$) {
        _leadingMargin$ = [Layout buildWithItem:self.layoutItem mark:@"leadingMargin$"];
        _leadingMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _leadingMargin$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _leadingMargin$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _leadingMargin$;
}

- (Layout *)trailingMargin$ {
    if (!_trailingMargin$) {
        _trailingMargin$ = [Layout buildWithItem:self.layoutItem mark:@"trailingMargin$"];
        _trailingMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _trailingMargin$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _trailingMargin$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _trailingMargin$;
}

- (Layout *)centerXMargin$ {
    if (!_centerXMargin$) {
        _centerXMargin$ = [Layout buildWithItem:self.layoutItem mark:@"centerXMargin$"];
        _centerXMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _centerXMargin$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _centerXMargin$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _centerXMargin$;
}

- (Layout *)centerYMargin$ {
    if (!_centerYMargin$) {
        _centerYMargin$ = [Layout buildWithItem:self.layoutItem mark:@"centerYMargin$"];
        _centerYMargin$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _centerYMargin$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _centerYMargin$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _centerYMargin$;
}

- (Layout *)center$ {
    if (!_center$) {
        _center$ = [Layout buildWithItem:self.layoutItem mark:@"center$"];
        _center$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _center$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _center$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _center$;
}

- (Layout *)size$ {
    if (!_size$) {
        _size$ = [Layout buildWithItem:self.layoutItem mark:@"size$"];
        _size$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _size$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _size$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
    }
    return _size$;
}

- (Layout *)insert$ {
    if (!_insert$) {
        _insert$ = [Layout buildWithItem:self mark:@"insert$"];
        _insert$.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _insert$.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _insert$.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
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


@end
