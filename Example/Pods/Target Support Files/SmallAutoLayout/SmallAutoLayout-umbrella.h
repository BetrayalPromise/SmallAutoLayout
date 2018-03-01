#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "SmallAutoLayout.h"
#import "CommonAdaptive.h"
#import "Constraint.h"
#import "Layout.h"
#import "NSLayoutConstraint+AliasName.h"
#import "UIView+Layout.h"
#import "UIViewController+Layout.h"

FOUNDATION_EXPORT double SmallAutoLayoutVersionNumber;
FOUNDATION_EXPORT const unsigned char SmallAutoLayoutVersionString[];

