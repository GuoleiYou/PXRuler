//
//  PXRulerWindow.m
//  LineSpaceDemo
//
//  Created by YOUGUOLEI on 2018/9/25.
//  Copyright © 2018年 YOUGUOLEI. All rights reserved.
//

#import "PXRulerWindow.h"
#import "PXRulerView.h"
#import "PXRulerMenueView.h"

@interface PXRulerWindow () <PXRulerMenueDelegate>

@property (nonatomic, strong) PXRulerView *rulerView;
@property (nonatomic, strong) PXRulerMenueView *menueView;
@property (nonatomic, strong) UIView *containerView;

@end

@implementation PXRulerWindow

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.containerView];
    }
    return self;
}

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 60, self.frame.size.width)];
        _containerView.center = self.center;
        [_containerView addSubview:self.rulerView];
        [_containerView addSubview:self.menueView];
        
        UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        [_containerView addGestureRecognizer:panGes];
    }
    return _containerView;
}

- (PXRulerMenueView *)menueView
{
    if (!_menueView) {
        _menueView = [[PXRulerMenueView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 60, 40)];
        _menueView.menueDelegate = self;
    }
    return _menueView;
}

- (PXRulerView *)rulerView
{
    if (!_rulerView) {
        _rulerView = [[PXRulerView alloc] initWithFrame:CGRectMake(0, 40, self.frame.size.width - 60, self.frame.size.width - 40)];
    }
    return _rulerView;
}

- (void)panAction:(UIPanGestureRecognizer *)ges
{
    CGPoint panPoint = [ges locationInView:ges.view];
    if (![self.rulerView pointInside:[self convertPoint:panPoint toView:self.rulerView] withEvent:nil]) {
        return;
    }
    
    static CGPoint startPoint;
    static CGPoint movePoint;
    if (ges.state == UIGestureRecognizerStateBegan) {
        startPoint = [ges locationInView:ges.view];
    } else if (ges.state == UIGestureRecognizerStateEnded || ges.state == UIGestureRecognizerStateFailed || ges.state == UIGestureRecognizerStateCancelled) {
        startPoint = CGPointZero;
    } else if (ges.state == UIGestureRecognizerStateChanged) {
        movePoint = [ges locationInView:ges.view];
        ges.view.frame = CGRectMake(ges.view.frame.origin.x + movePoint.x - startPoint.x, ges.view.frame.origin.y + movePoint.y - startPoint.y, ges.view.frame.size.width, ges.view.frame.size.height);
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL isPointInRuler = NO;
    CGPoint pointInRuler = [self convertPoint:point toView:self.rulerView];
    isPointInRuler = [self.rulerView pointInside:pointInRuler withEvent:event];
    
    BOOL isPointInMenue = NO;
    CGPoint pointInMenue = [self convertPoint:point toView:self.menueView];
    isPointInMenue = [self.menueView pointInside:pointInMenue withEvent:event];
    
    return isPointInRuler ||  isPointInMenue;
}

- (void)didChangedUnitValue:(NSInteger)unitValue
{
    self.rulerView.unitValue = unitValue;
}

- (void)didClickCloseRuler
{
    self.hidden = YES;
}

@end
