//
//  Layout.m
//  ABCD
//
//  Created by LiChunYang on 27/6/2018.
//  Copyright © 2018 com.qmtv. All rights reserved.
//

#import "Layout.h"
#import <UIKit/UIKit.h>

@interface Layout ()

/// Only For SafeArea
@property (nonatomic, strong) Layout * Left;
/// Only For SafeArea
@property (nonatomic, strong) Layout * Right;
/// Only For SafeArea
@property (nonatomic, strong) Layout * Top;
/// Only For SafeArea
@property (nonatomic, strong) Layout * Bottom;

@end

@implementation Layout

+ (instancetype)buildWithItem:(id)item mark:(NSString *)mark {
    Layout * layout = [Layout new];
    layout.mark = mark;
    layout.item = item;
    return layout;
}

- (NSLayoutConstraint *)make:(NSLayoutRelation)relation other:(id)other multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    NSAssert(self.mark != nil, @"First item's LayoutAttribute must be exit");
    NSSet * set = [NSSet setWithObjects:@"Center", @"Size", @"SafeAreaGuide", @"TopGuide", @"BottomGuide", nil];
    if ([set containsObject:self.mark]) {
        NSAssert(NO, @"%@没有缺省值", self.mark);
    }
    NSLayoutAttribute attribute = [self findAttribute:self.mark];
    NSAssert(attribute != NSLayoutAttributeNotAnAttribute, @"First item's LayoutAttribute must be exit");
    if (other == nil) {
        if ([self.item isKindOfClass:[UIViewController class]]) {
            NSAssert(NO, @"设置控制器的topLayoutGuide bottomLayoutGuide是不生效的");
            return nil;
        } else {
//            处理安全区 自定试图的范围一般来说是跟安全区范围一致的
            if (self.safeAreaGuideFlag) {
                if ([self.mark isEqualToString:@"Width"]) {
                    if (@available(iOS 11.0, *)) {
                        NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:multiplier constant:c];
                        constraint.active = YES;
                        return constraint;
                    } else {
                        NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                        return nil;
                    }
                } else if ([self.mark isEqualToString:@"Height"]) {
                    if (@available(iOS 11.0, *)) {
                        NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:multiplier constant:c];
                        constraint.active = YES;
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
                if ([self.mark isEqualToString:@"Width"]) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeWidth) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:multiplier constant:c];
                    constraint.active = YES;
                    return constraint;
                } else if ([self.mark isEqualToString:@"Height"]) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeHeight) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:multiplier constant:c];
                    constraint.active = YES;
                    return constraint;
                } else {
                    NSAssert(NO, @"Only Support Width and Height");
                    return nil;
                }
            }
        }
    } else if ([other isKindOfClass:[NSNumber class]]) {
        if ([self.item isKindOfClass:[UIViewController class]]) {
            NSAssert(NO, @"设置控制器的topLayoutGuide bottomLayoutGuide是不生效的");
            return nil;
        } else {
            if (self.safeAreaGuideFlag) {
                if ([self.mark isEqualToString:@"Width"]) {
                    if (@available(iOS 11.0, *)) {
                        NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:[(NSNumber *)other floatValue] + c];
                        constraint.active = YES;
                        return constraint;
                    } else {
                        NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                        return nil;
                    }
                } else if ([self.mark isEqualToString:@"Height"]) {
                    if (@available(iOS 11.0, *)) {
                        NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:[(NSNumber *)other floatValue] + c];
                        constraint.active = YES;
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
                if ([self.mark isEqualToString:@"Width"]) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeWidth) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:[(NSNumber *)other floatValue] + c];
                    constraint.active = YES;
                    return constraint;
                } else if ([self.mark isEqualToString:@"Height"]) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeHeight) relatedBy:(relation) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:[(NSNumber *)other floatValue] + c];
                    constraint.active = YES;
                    return constraint;
                } else {
                    NSAssert(NO, @"Only Support Width and Height");
                    return nil;
                }
            }
        }
    } else if ([other isKindOfClass:[UIView class]]) {
        if ([self.item isKindOfClass:[UIViewController class]]) {
            UIViewController * item0 = self.item;
            NSLayoutAttribute attr0 = [self findAttribute:self.mark];
            id item1 = other;
            NSLayoutAttribute attr1 = attr0;
            if (self.topLayoutGuideFlag && !self.bottomLayoutGuideFlag) {
                NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0.topLayoutGuide attribute:attr0 relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                constraint.active = YES;
                return constraint;
            } else if (!self.topLayoutGuideFlag && self.bottomLayoutGuideFlag) {
                NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0.bottomLayoutGuide attribute:attr0 relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                constraint.active = YES;
                return constraint;
            } else {
                NSAssert(NO, @"Only View-View, UIViewController-View constraint");
                return nil;
            }
        } else if ([self.item isKindOfClass:[UIView class]]) {
            if (@available(iOS 11.0, *)) {
                NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.safeAreaGuideFlag == YES ? [(UIView *)self.item safeAreaLayoutGuide] : self.item attribute:[self findAttribute:self.mark] relatedBy:(relation) toItem:other attribute:[self findAttribute:[self mark]] multiplier:multiplier constant:c];
                constraint.active = YES;
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
        if ([self.item isKindOfClass:[UIView class]] && [[(Layout *)other item] isKindOfClass:[UIView class]]) {
            if (@available(iOS 11.0, *)) {
                id item0 = self.safeAreaGuideFlag == YES ? [(UIView *)self.item safeAreaLayoutGuide] : self.item;
                id item1 = [(Layout *)other safeAreaGuideFlag] == YES ? [(UIView *)[(Layout *)other item] safeAreaLayoutGuide] : [(Layout *)other item];
                NSLayoutAttribute attr0 = [self findAttribute:self.mark];
                
                NSLayoutAttribute attr1 = [self findAttribute:[(Layout *)other mark]] == NSLayoutAttributeNotAnAttribute ? attr0 : [self findAttribute:[(Layout *)other mark]];
                NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0 attribute:attr0 relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                constraint.active = YES;
                return constraint;
            } else {
                NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                return nil;
            }
        } else if ([self.item isKindOfClass:[UIViewController class]] && [[(Layout *)other item] isKindOfClass:[UIView class]]) {
            if (@available(iOS 11.0, *)) {
                UIViewController * item0 = self.item;
                NSLayoutAttribute attr0 = [self findAttribute:self.mark];
                id item1 = [(Layout *)other safeAreaGuideFlag] == YES ? [(UIView *)[(Layout *)other item] safeAreaLayoutGuide] : [(Layout *)other item];
                NSLayoutAttribute attr1 = [self findAttribute:[(Layout *)other mark]] == NSLayoutAttributeNotAnAttribute ? attr0 : [self findAttribute:[(Layout *)other mark]];
                if (self.topLayoutGuideFlag && !self.bottomLayoutGuideFlag) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0.topLayoutGuide attribute:(attr0) relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                    constraint.active = YES;
                    return constraint;
                } else if (!self.topLayoutGuideFlag && self.bottomLayoutGuideFlag) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0.bottomLayoutGuide attribute:(attr0) relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                    constraint.active = YES;
                    return constraint;
                } else {
                    NSAssert(NO, @"Only View-View, UIViewController-View constraint");
                    return nil;
                }
            } else {
                NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                return nil;
            }
        } else if ([self.item isKindOfClass:[UIView class]] && [[(Layout *)other item] isKindOfClass:[UIViewController class]]) {
            if (@available(iOS 11.0, *)) {
                UIViewController * item0 = [(Layout *)other item];
                NSLayoutAttribute attr0 = [self findAttribute:[(Layout *)other mark]] == NSLayoutAttributeNotAnAttribute ? [self findAttribute:self.mark] : [self findAttribute:[(Layout *)other mark]];
                id item1 = [self safeAreaGuideFlag] == YES ? [(UIView *)self.item safeAreaLayoutGuide] : self.item;
                NSLayoutAttribute attr1 = [self findAttribute:self.mark];
                if ([(Layout *)other topLayoutGuideFlag] && ![(Layout *)other bottomLayoutGuideFlag]) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0.topLayoutGuide attribute:(attr0) relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                    constraint.active = YES;
                    return constraint;
                } else if (![(Layout *)other topLayoutGuideFlag] && [(Layout *)other bottomLayoutGuideFlag]) {
                    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item0.bottomLayoutGuide attribute:(attr0) relatedBy:(relation) toItem:item1 attribute:attr1 multiplier:multiplier constant:c];
                    constraint.active = YES;
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
    if ([name isEqualToString:@"Left"]) {
        return NSLayoutAttributeLeft;
    } else if ([name isEqualToString:@"Right"]) {
        return NSLayoutAttributeRight;
    } else if ([name isEqualToString:@"Top"]) {
        return NSLayoutAttributeTop;
    } else if ([name isEqualToString:@"Bottom"]) {
        return NSLayoutAttributeBottom;
    } else if ([name isEqualToString:@"Leading"]) {
        return NSLayoutAttributeLeading;
    } else if ([name isEqualToString:@"Trailing"]) {
        return NSLayoutAttributeTrailing;
    } else if ([name isEqualToString:@"Width"]) {
        return NSLayoutAttributeWidth;
    } else if ([name isEqualToString:@"Height"]) {
        return NSLayoutAttributeHeight;
    } else if ([name isEqualToString:@"CenterX"]) {
        return NSLayoutAttributeCenterX;
    } else if ([name isEqualToString:@"CenterY"]) {
        return NSLayoutAttributeCenterY;
    } else if ([name isEqualToString:@"LastBaseline"]) {
        return NSLayoutAttributeLastBaseline;
    } else if ([name isEqualToString:@"Baseline"]) {
        return NSLayoutAttributeBaseline;
    } else if ([name isEqualToString:@"FirstBaseline"]) {
        return NSLayoutAttributeFirstBaseline;
    } else if ([name isEqualToString:@"LeftMargin"]) {
        return NSLayoutAttributeLeftMargin;
    } else if ([name isEqualToString:@"RightMargin"]) {
        return NSLayoutAttributeRightMargin;
    } else if ([name isEqualToString:@"TopMargin"]) {
        return NSLayoutAttributeTopMargin;
    } else if ([name isEqualToString:@"BottomMargin"]) {
        return NSLayoutAttributeBottomMargin;
    } else if ([name isEqualToString:@"LeadingMargin"]) {
        return NSLayoutAttributeLeadingMargin;
    } else if ([name isEqualToString:@"TrailingMargin"]) {
        return NSLayoutAttributeTrailingMargin;
    } else if ([name isEqualToString:@"CenterXMargin"]) {
        return NSLayoutAttributeCenterXWithinMargins;
    } else if ([name isEqualToString:@"CenterYMargin"]) {
        return NSLayoutAttributeCenterYWithinMargins;
    } else if ([name isEqualToString:@"SafeAreaGuide"]) {
        return NSLayoutAttributeNotAnAttribute;
    } else if ([name isEqualToString:@"TopGuide"]) {
        return NSLayoutAttributeNotAnAttribute;
    } else if ([name isEqualToString:@"BottomGuide"]) {
         return NSLayoutAttributeNotAnAttribute;
    } else {
        return NSLayoutAttributeNotAnAttribute;
    }
}

- (Layout *)Top {
    if (!_Top) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"Top"];
        _Top = layout;
        _Top.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _Top.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _Top.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
        return _Top;
    }
    return _Top;
}

- (Layout *)Left {
    if (!_Left) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"Left"];
        _Left = layout;
        _Left.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _Left;
    }
    return _Left;
}

- (Layout *)Bottom {
    if (!_Bottom) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"Bottom"];
        _Bottom = layout;
        _Bottom.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _Bottom.topLayoutGuideFlag = self.topLayoutGuideFlag;
        _Bottom.bottomLayoutGuideFlag = self.bottomLayoutGuideFlag;
        return _Bottom;
    }
    return _Bottom;
}

- (Layout *)Right {
    if (!_Right) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"Right"];
        _Right = layout;
        _Right.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _Right;
    }
    return _Right;
}

- (NSLayoutConstraint *)equalTo:(id)other multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    return [self make:(NSLayoutRelationEqual) other:other multiplier:multiplier constant:c];
}

- (NSLayoutConstraint *)equalTo:(id)other multiplier:(CGFloat)multiplier {
    return [self make:(NSLayoutRelationEqual) other:other multiplier:multiplier constant:0.0];
}

- (NSLayoutConstraint *)equalTo:(id)other constant:(CGFloat)c {
    return [self make:(NSLayoutRelationEqual) other:other multiplier:1.0 constant:c];
}

- (NSLayoutConstraint *)equalTo:(id)other {
    return [self make:(NSLayoutRelationEqual) other:other multiplier:1.0 constant:0.0];
}

- (NSLayoutConstraint *)lessOrEqualTo:(id)other multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    return [self make:(NSLayoutRelationLessThanOrEqual) other:other multiplier:multiplier constant:c];
}

- (NSLayoutConstraint *)lessOrEqualTo:(id)other multiplier:(CGFloat)multiplier {
    return [self make:NSLayoutRelationLessThanOrEqual other:other multiplier:multiplier constant:0.0];
}

- (NSLayoutConstraint *)lessOrEqualTo:(id)other constant:(CGFloat)c {
    return [self make:(NSLayoutRelationLessThanOrEqual) other:other multiplier:1.0 constant:c];
}

- (NSLayoutConstraint *)lessOrEqualTo:(id)other {
    return [self make:NSLayoutRelationLessThanOrEqual other:other multiplier:1.0 constant:0.0];
}

- (NSLayoutConstraint *)greaterOrEqualTo:(id)other multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    return [self make:(NSLayoutRelationGreaterThanOrEqual) other:other multiplier:multiplier constant:c];
}

- (NSLayoutConstraint *)greaterOrEqualTo:(id)other multiplier:(CGFloat)multiplier {
    return [self make:(NSLayoutRelationGreaterThanOrEqual) other:other multiplier:multiplier constant:0.0];
}

- (NSLayoutConstraint *)greaterOrEqualTo:(id)other constant:(CGFloat)c {
    return [self make:NSLayoutRelationGreaterThanOrEqual other:other multiplier:1.0 constant:c];
}

- (NSLayoutConstraint *)greaterOrEqualTo:(id)other {
    return [self make:NSLayoutRelationGreaterThanOrEqual other:other multiplier:1.0 constant:0.0];
}

- (NSArray <NSLayoutConstraint *> *)size:(id _Nullable)other trim:(CGSize)trim {
    if ([self.mark isEqualToString:@"Size"]) {
        if ([other isKindOfClass:[UIView class]]) {
            NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeWidth) multiplier:1.0 constant:trim.width];
            widthConstraint.active = YES;
            NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeHeight) multiplier:1.0 constant:trim.height];
            heightConstraint.active = YES;
            return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
        } else if ([other isKindOfClass:[self class]]) {
            NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeWidth) multiplier:1.0 constant:trim.width];
            widthConstraint.active = YES;
            NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeHeight) multiplier:1.0 constant:trim.height];
            heightConstraint.active = YES;
            return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
        } else if ([other isKindOfClass:[NSValue class]]) {
            CGSize size = [other CGSizeValue];
            NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:size.width + trim.width];
            widthConstraint.active = YES;
            NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:size.height + trim.height];
            heightConstraint.active = YES;
            return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
        } else {
            NSAssert(NO, @"parameter must be (UIView | Layout | NSValue) type");
            return nil;
        }
    } else {
        NSAssert(NO, @"self.mark must be \"Size\"");
        return nil;
    }
}

- (NSArray <NSLayoutConstraint *> *)size:(id _Nullable)other {
    return [self size:other trim:(CGSizeZero)];
}

- (NSArray <NSLayoutConstraint *> *)center:(id _Nullable)other offset:(CGSize)offset {
    if ([self.mark isEqualToString:@"Center"]) {
        if ([other isKindOfClass:[UIView class]]) {
            NSLayoutConstraint * centerXConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeCenterX) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeCenterX) multiplier:1.0 constant:offset.width];
            centerXConstraint.active = YES;
            NSLayoutConstraint * centerYConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeCenterY) multiplier:1.0 constant:offset.height];
            centerYConstraint.active = YES;
            return [NSArray arrayWithObjects:centerXConstraint, centerYConstraint, nil];
        } else if ([other isKindOfClass:[self class]]) {
            NSLayoutConstraint * centerXConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeCenterX) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeCenterX) multiplier:1.0 constant:offset.width];
            centerXConstraint.active = YES;
            NSLayoutConstraint * centerYConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeCenterY) multiplier:1.0 constant:offset.height];
            centerYConstraint.active = YES;
            return [NSArray arrayWithObjects:centerXConstraint, centerYConstraint, nil];
        } else {
            NSAssert(NO, @"parameter must be (UIView | Layout) type");
            return nil;
        }
    } else {
        NSAssert(NO, @"self.mark must be \"Size\"");
        return nil;
    }
}

- (NSArray <NSLayoutConstraint *> *)center:(id _Nullable)other {
    return [self center:other offset:(CGSizeZero)];
}

@end
