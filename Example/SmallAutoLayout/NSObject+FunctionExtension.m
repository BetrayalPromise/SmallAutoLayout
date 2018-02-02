//
//  MyBaseLayout.h
//  MyLayout
//
//  Created by oybq on 15/6/14.
//  Copyright (c) 2015年 YoungSoft. All rights reserved.
//

#import "NSObject+FunctionExtension.h"

#pragma - mark -
#pragma - mark FunctionExtension
@implementation NSObject (FunctionExtension)

@end

#pragma - mark -
#pragma - mark ChainedMode
@implementation NSObject (ChainedMode)

- (instancetype _Nullable)objcetThen:(void (^_Nullable)(id _Nonnull source))configure {
    if (configure) {
        configure(self);
    }
    return self;
}

@end
#pragma - mark -
#pragma - mark Initialize
@implementation NSObject (Initialize)

+ (instancetype _Nullable)objcetInitialize {
    return [[[self class] alloc] init];
}

@end

