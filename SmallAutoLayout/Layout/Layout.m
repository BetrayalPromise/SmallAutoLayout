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

@property (nonatomic, strong) Layout * Left;
@property (nonatomic, strong) Layout * Right;
@property (nonatomic, strong) Layout * Top;
@property (nonatomic, strong) Layout * Bottom;
@property (nonatomic, strong) Layout * Leading;
@property (nonatomic, strong) Layout * Trailing;
@property (nonatomic, strong) Layout * Width;
@property (nonatomic, strong) Layout * Height;
@property (nonatomic, strong) Layout * CenterX;
@property (nonatomic, strong) Layout * CenterY;
@property (nonatomic, strong) Layout * LastBaseline;
@property (nonatomic, strong) Layout * Baseline;
@property (nonatomic, strong) Layout * FirstBaseline;
@property (nonatomic, strong) Layout * LeftMargin;
@property (nonatomic, strong) Layout * RightMargin;
@property (nonatomic, strong) Layout * TopMargin;
@property (nonatomic, strong) Layout * BottomMargin;
@property (nonatomic, strong) Layout * LeadingMargin;
@property (nonatomic, strong) Layout * TrailingMargin;
@property (nonatomic, strong) Layout * CenterXMargin;
@property (nonatomic, strong) Layout * CenterYMargin;


@property (nonatomic, strong) Layout * Center;
@property (nonatomic, strong) Layout * Size;
@property (nonatomic, strong) Layout * Insert;

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

- (Layout *)Leading {
    if (!_Leading) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"Leading"];
        _Leading = layout;
        _Leading.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _Leading;
    }
    return _Leading;
}

- (Layout *)Trailing {
    if (!_Trailing) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"Trailing"];
        _Trailing = layout;
        _Trailing.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _Leading;
    }
    return _Trailing;
}

- (Layout *)Width {
    if (!_Width) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"Width"];
        _Width = layout;
        _Width.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _Width;
    }
    return _Width;
}

- (Layout *)Height {
    if (!_Height) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"Height"];
        _Height = layout;
        _Height.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _Height;
    }
    return _Height;
}

- (Layout *)CenterX {
    if (!_CenterX) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"CenterX"];
        _CenterX = layout;
        _CenterX.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _CenterX;
    }
    return _CenterX;
}

- (Layout *)CenterY {
    if (!_CenterY) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"CenterY"];
        _CenterY = layout;
        _CenterY.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _CenterY;
    }
    return _CenterY;
}

- (Layout *)LastBaseline {
    if (!_LastBaseline) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"LastBaseline"];
        _LastBaseline = layout;
        _LastBaseline.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _LastBaseline;
    }
    return _LastBaseline;
}

- (Layout *)Baseline {
    if (!_Baseline) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"Baseline"];
        _Baseline = layout;
        _Baseline.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _Baseline;
    }
    return _Baseline;
}

- (Layout *)FirstBaseline {
    if (!_FirstBaseline) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"FirstBaseline"];
        _FirstBaseline = layout;
        _FirstBaseline.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _FirstBaseline;
    }
    return _FirstBaseline;
}

- (Layout *)LeftMargin {
    if (!_LeftMargin) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"LeftMargin"];
        _LeftMargin = layout;
        _LeftMargin.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _LeftMargin;
    }
    return _LeftMargin;
}

- (Layout *)RightMargin {
    if (!_RightMargin) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"RightMargin"];
        _RightMargin = layout;
        _RightMargin.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _RightMargin;
    }
    return _RightMargin;
}

- (Layout *)TopMargin {
    if (!_TopMargin) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"TopMargin"];
        _TopMargin = layout;
        _TopMargin.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _TopMargin;
    }
    return _TopMargin;
}

- (Layout *)BottomMargin {
    if (!_BottomMargin) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"BottomMargin"];
        _BottomMargin = layout;
        _BottomMargin.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _BottomMargin;
    }
    return _BottomMargin;
}

- (Layout *)LeadingMargin {
    if (!_LeadingMargin) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"LeadingMargin"];
        _LeadingMargin = layout;
        _LeadingMargin.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _LeadingMargin;
    }
    return _LeadingMargin;
}

- (Layout *)TrailingMargin {
    if (!_TrailingMargin) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"TrailingMargin"];
        _TrailingMargin = layout;
        _TrailingMargin.safeAreaGuideFlag = self.safeAreaGuideFlag;
        return _TrailingMargin;
    }
    return _TrailingMargin;
}

- (Layout *)CenterXMargin {
    if (!_CenterXMargin) {
        Layout * layou = [Layout buildWithItem:self.item mark:@"CenterXMargin"];
        _CenterXMargin = layou;
        _CenterXMargin.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _CenterXMargin.item = self.item;
        return _CenterXMargin;
    }
    return _CenterXMargin;
}

- (Layout *)CenterYMargin {
    if (!_CenterYMargin) {
        Layout * layou = [Layout buildWithItem:self.item mark:@"CenterYMargin"];
        _CenterYMargin = layou;
        _CenterYMargin.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _CenterYMargin.item = self.item;
        return _CenterYMargin;
    }
    return _CenterYMargin;
}

- (Layout *)Center {
    if (!_Center) {
        Layout * layou = [Layout buildWithItem:self.item mark:@"Center"];
        _Center = layou;
        _Center.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _Center.item = self.item;
        return _Center;
    }
    return _Center;
}

- (Layout *)Size {
    if (!_Size) {
        Layout * layout = [Layout buildWithItem:self.item mark:@"Size"];
        _Size = layout;
        _Size.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _Size.item = self.item;
        return _Size;
    }
    return _Size;
}

- (Layout *)Insert {
    if (!_Insert) {
        Layout * layout = [Layout buildWithItem:self mark:@"Insert"];
        _Insert = layout;
        _Insert.safeAreaGuideFlag = self.safeAreaGuideFlag;
        _Insert.item = self.item;
        return _Insert;
    }
    return _Insert;
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
                NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeWidth) multiplier:1.0 constant:trim.width];
                widthConstraint.active = YES;
                NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeHeight) multiplier:1.0 constant:trim.height];
                heightConstraint.active = YES;
                return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
            } else {
                NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                return nil;
            }
        } else if ([other isKindOfClass:[Layout class]]) {
            if ([(Layout *)other safeAreaGuideFlag]) {
                if (@available(iOS 11.0, *)) {
                    NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other item] safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) multiplier:1.0 constant:trim.width];
                    widthConstraint.active = YES;
                    NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other item] safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) multiplier:1.0 constant:trim.height];
                    heightConstraint.active = YES;
                    return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
                } else {
                    NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                    return nil;
                }
            } else {
                if (@available(iOS 11.0, *)) {
                    NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeWidth) multiplier:1.0 constant:trim.width];
                    widthConstraint.active = YES;
                    NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeHeight) multiplier:1.0 constant:trim.height];
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
                NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:size.width + trim.width];
                widthConstraint.active = YES;
                NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:size.height + trim.height];
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
            NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeWidth) multiplier:1.0 constant:trim.width];
            widthConstraint.active = YES;
            NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeHeight) multiplier:1.0 constant:trim.height];
            heightConstraint.active = YES;
            return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
        } else if ([other isKindOfClass:[Layout class]]) {
            if ([(Layout *)other safeAreaGuideFlag]) {
                if (@available(iOS 11.0, *)) {
                    NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other item] safeAreaLayoutGuide] attribute:(NSLayoutAttributeWidth) multiplier:1.0 constant:trim.width];
                    widthConstraint.active = YES;
                    NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other item] safeAreaLayoutGuide] attribute:(NSLayoutAttributeHeight) multiplier:1.0 constant:trim.height];
                    heightConstraint.active = YES;
                    return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
                } else {
                    // Fallback on earlier versions
                    NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                    return nil;
                }
            } else {
                NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeWidth) multiplier:1.0 constant:trim.width];
                widthConstraint.active = YES;
                NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeHeight) multiplier:1.0 constant:trim.height];
                heightConstraint.active = YES;
                return [NSArray arrayWithObjects:widthConstraint, heightConstraint, nil];
            }
        } else if ([other isKindOfClass:[NSValue class]]) {
            CGSize size = [other CGSizeValue];
            NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:size.width + trim.width];
                widthConstraint.active = YES;
            NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:size.height + trim.height];
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
        NSLayoutConstraint * centerXConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeCenterX) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeCenterX) multiplier:1.0 constant:trim.width];
        centerXConstraint.active = YES;
        NSLayoutConstraint * centerYConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeCenterY) multiplier:1.0 constant:trim.height];
        centerYConstraint.active = YES;
        return [NSArray arrayWithObjects:centerXConstraint, centerYConstraint, nil];
    } else if ([other isKindOfClass:[self class]]) {
        NSLayoutConstraint * centerXConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeCenterX) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeCenterX) multiplier:1.0 constant:trim.width];
        centerXConstraint.active = YES;
        NSLayoutConstraint * centerYConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeCenterY) multiplier:1.0 constant:trim.height];
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
                NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:trim.top];
                topConstraint.active = YES;
                NSLayoutConstraint * leftConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:trim.left];
                leftConstraint.active = YES;
                NSLayoutConstraint * bottomConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:trim.bottom];
                bottomConstraint.active = YES;
                NSLayoutConstraint * rightConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:trim.right];
                rightConstraint.active = YES;
                return [NSArray arrayWithObjects:topConstraint, leftConstraint, bottomConstraint, rightConstraint, nil];
            } else {
                NSAssert(NO, @"other参数只支持NSValue UIView Layout类型");
                return nil;
            }
        } else if ([other isKindOfClass:[Layout class]]) {
            if ([(Layout *)other safeAreaGuideFlag]) {
                if (@available(iOS 11.0, *)) {
                    NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other item] safeAreaLayoutGuide] attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:trim.top];
                    topConstraint.active = YES;
                    NSLayoutConstraint * leftConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other item] safeAreaLayoutGuide] attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:trim.left];
                    leftConstraint.active = YES;
                    NSLayoutConstraint * bottomConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other item] safeAreaLayoutGuide] attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:trim.bottom];
                    bottomConstraint.active = YES;
                    NSLayoutConstraint * rightConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other item] safeAreaLayoutGuide] attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:trim.right];
                    rightConstraint.active = YES;
                    return [NSArray arrayWithObjects:topConstraint, leftConstraint, bottomConstraint, rightConstraint, nil];
                } else {
                    NSAssert(NO, @"other参数只支持NSValue UIView Layout类型");
                    return nil;
                }
            } else {
                if (@available(iOS 11.0, *)) {
                    NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:trim.top];
                    topConstraint.active = YES;
                    NSLayoutConstraint * leftConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:trim.left];
                    leftConstraint.active = YES;
                    NSLayoutConstraint * bottomConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:trim.bottom];
                    bottomConstraint.active = YES;
                    NSLayoutConstraint * rightConstraint = [NSLayoutConstraint constraintWithItem:[(UIView *)self.item safeAreaLayoutGuide] attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:trim.right];
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
            NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:trim.top];
            topConstraint.active = YES;
            NSLayoutConstraint * leftConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:trim.left];
            leftConstraint.active = YES;
            NSLayoutConstraint * bottomConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:trim.bottom];
            bottomConstraint.active = YES;
            NSLayoutConstraint * rightConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:other attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:trim.right];
            rightConstraint.active = YES;
            return [NSArray arrayWithObjects:topConstraint, leftConstraint, bottomConstraint, rightConstraint, nil];
        } else if ([other isKindOfClass:[Layout class]]) {
            if ([(Layout *)other safeAreaGuideFlag]) {
                if (@available(iOS 11.0, *)) {
                    NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other item] safeAreaLayoutGuide] attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:trim.top];
                    topConstraint.active = YES;
                    NSLayoutConstraint * leftConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other item] safeAreaLayoutGuide] attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:trim.left];
                    leftConstraint.active = YES;
                    NSLayoutConstraint * bottomConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other item] safeAreaLayoutGuide] attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:trim.bottom];
                    bottomConstraint.active = YES;
                    NSLayoutConstraint * rightConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:[(UIView *)[(Layout *)other item] safeAreaLayoutGuide] attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:trim.right];
                    rightConstraint.active = YES;
                    return [NSArray arrayWithObjects:topConstraint, leftConstraint, bottomConstraint, rightConstraint, nil];
                } else {
                    NSAssert(NO, @"安全区API需要系统版本为11.0及其以上才可使用");
                    return nil;
                }
            } else {
                NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeTop) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:trim.top];
                topConstraint.active = YES;
                NSLayoutConstraint * leftConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:trim.left];
                leftConstraint.active = YES;
                NSLayoutConstraint * bottomConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeBottom) multiplier:1.0 constant:trim.bottom];
                bottomConstraint.active = YES;
                NSLayoutConstraint * rightConstraint = [NSLayoutConstraint constraintWithItem:self.item attribute:(NSLayoutAttributeRight) relatedBy:(NSLayoutRelationEqual) toItem:[(Layout *)other item] attribute:(NSLayoutAttributeRight) multiplier:1.0 constant:trim.right];
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
