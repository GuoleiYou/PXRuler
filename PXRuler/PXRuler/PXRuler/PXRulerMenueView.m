//
//  PXRulerMenueView.m
//  LineSpaceDemo
//
//  Created by YOUGUOLEI on 2018/9/26.
//  Copyright © 2018 YOUGUOLEI. All rights reserved.
//

#import "PXRulerMenueView.h"

@interface PXRulerMenueView ()

@property (nonatomic, strong) UILabel *unitLabel;
@property (nonatomic, strong) UISlider *unitSlider;
@property (nonatomic, strong) UIButton *closeButton;

@end

@implementation PXRulerMenueView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:224/255.0 green:255/255.0 blue:255/255.0 alpha:0.5];
        
        [self addSubview:self.unitSlider];
        [self addSubview:self.unitLabel];
        [self addSubview:self.closeButton];
    }
    return self;
}

- (UISlider *)unitSlider
{
    if (!_unitSlider) {
        _unitSlider = [[UISlider alloc] initWithFrame:CGRectMake(0, 10, self.frame.size.width - self.frame.size.height * 3.0, self.frame.size.height - 20)];
        _unitSlider.backgroundColor = [UIColor clearColor];
        _unitSlider.minimumValue = 2.0;
        _unitSlider.maximumValue = 20.0;
        _unitSlider.value = 5;
        [_unitSlider addTarget:self action:@selector(sliderValueChangedAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _unitSlider;
}

- (UILabel *)unitLabel
{
    if (!_unitLabel) {
        _unitLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.unitSlider.frame.size.width, 0, self.frame.size.height, self.frame.size.height)];
        _unitLabel.text = @"5 px";
        _unitLabel.adjustsFontSizeToFitWidth = YES;
        _unitLabel.textAlignment = NSTextAlignmentCenter;
        _unitLabel.textColor = [UIColor darkGrayColor];
    }
    return _unitLabel;
}

- (UIButton *)closeButton
{
    if (!_closeButton) {
        _closeButton = [[UIButton alloc] initWithFrame:CGRectMake(self.unitLabel.frame.origin.x + self.unitLabel.frame.size.width, 0, self.frame.size.height * 2.0, self.frame.size.height)];
        [_closeButton setTitle:@"Close" forState:UIControlStateNormal];
        [_closeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_closeButton setBackgroundColor:[UIColor clearColor]];
        [_closeButton addTarget:self action:@selector(didClickCloseAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}

- (void)sliderValueChangedAction:(UISlider *)slider
{
    short unitValue = ceilf(slider.value);
    self.unitLabel.text = [NSString stringWithFormat:@"%d px", unitValue];
    if (self.menueDelegate && [self.menueDelegate respondsToSelector:@selector(didChangedUnitValue:)]) {
        [self.menueDelegate didChangedUnitValue:unitValue];
    }
}

- (void)didClickCloseAction
{
    if (self.menueDelegate && [self.menueDelegate respondsToSelector:@selector(didClickCloseRuler)]) {
        [self.menueDelegate didClickCloseRuler];
    }
}

@end
