//
//  PXRulerManager.h
//  LineSpaceDemo
//
//  Created by YOUGUOLEI on 2018/9/25.
//  Copyright © 2018 YOUGUOLEI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PXRulerManager : NSObject

+ (instancetype)shareManager;

- (void)showRuler;
- (void)hideRuler;

@end

NS_ASSUME_NONNULL_END
