//
//  PXRulerMenueView.h
//  LineSpaceDemo
//
//  Created by YOUGUOLEI on 2018/9/26.
//  Copyright © 2018 YOUGUOLEI. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PXRulerMenueDelegate;

@interface PXRulerMenueView : UIView

@property (nonatomic, weak) id <PXRulerMenueDelegate> menueDelegate;

@end

@protocol PXRulerMenueDelegate <NSObject>

- (void)didChangedUnitValue:(NSInteger)unitValue;

- (void)didClickCloseRuler;

@end

NS_ASSUME_NONNULL_END
