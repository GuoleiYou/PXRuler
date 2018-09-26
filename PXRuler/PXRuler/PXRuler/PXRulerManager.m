//
//  PXRulerManager.m
//  LineSpaceDemo
//
//  Created by YOUGUOLEI on 2018/9/25.
//  Copyright © 2018 YOUGUOLEI. All rights reserved.
//

#import "PXRulerManager.h"
#import "PXRulerWindow.h"


@interface PXRulerManager()

@property (nonatomic, strong) PXRulerWindow *rulerWindow;

@end

@implementation PXRulerManager

+ (instancetype)shareManager
{
    static PXRulerManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[[self class] alloc] init];
    });
    return sharedManager;
}

- (PXRulerWindow *)rulerWindow
{
    NSAssert([NSThread isMainThread], @"You must use %@ from the main thread only.", NSStringFromClass([self class]));
    
    if (!_rulerWindow) {
        _rulerWindow = [[PXRulerWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    }
    
    return _rulerWindow;
}

- (void)showRuler
{
    self.rulerWindow.hidden = NO;
}

- (void)hideRuler
{
    self.rulerWindow.hidden = YES;
}

@end
