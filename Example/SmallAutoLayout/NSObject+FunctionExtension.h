//
//  MyBaseLayout.h
//  MyLayout
//
//  Created by oybq on 15/6/14.
//  Copyright (c) 2015年 YoungSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma - mark -
#pragma - mark FunctionExtension
@interface NSObject (FunctionExtension)

@end

#pragma - mark -
#pragma - mark CornerRadius
@interface NSObject (ChainedMode)

- (instancetype _Nullable)objcetThen:(void (^_Nullable)(id _Nonnull source))configure;

@end

#pragma - mark -
#pragma - mark Initialize
@interface NSObject (Initialize)

+ (instancetype _Nullable)objcetInitialize;

@end
