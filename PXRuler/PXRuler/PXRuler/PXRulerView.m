//
//  PXRulerView.m
//  LineSpaceDemo
//
//  Created by YOUGUOLEI on 2018/9/21.
//  Copyright © 2018年 YOUGUOLEI. All rights reserved.
//

#import "PXRulerView.h"

@implementation PXRulerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.unitValue = 5;
        self.backgroundColor = [UIColor colorWithRed:70/255.0 green:150/255.0 blue:60/255.0 alpha:0.5];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    UIColor *lineColor = [UIColor blackColor];
    [lineColor set];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 0.5;
    
    [bezierPath moveToPoint:CGPointZero];
    [bezierPath addLineToPoint:CGPointMake(rect.size.width, 0)];
    [bezierPath addLineToPoint:CGPointMake(rect.size.width, rect.size.height)];
    [bezierPath addLineToPoint:CGPointMake(0, rect.size.height)];
    [bezierPath closePath];
    
    CGFloat xPosition = 0.0, yPosition = 0.0, lineHeight = 0, lineWidth = 0, valueWidth = 0;
    NSString *value = @"";
    NSDictionary *valueAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:8]};
    for (NSInteger i = 0; i < rect.size.width / self.unitValue; i++) {
        
        lineHeight = i%10 ? 5 : 10;
        xPosition = i * self.unitValue;
        [bezierPath moveToPoint:CGPointMake(xPosition, 0)];
        [bezierPath addLineToPoint:CGPointMake(xPosition, lineHeight)];
        
        [bezierPath moveToPoint:CGPointMake(xPosition, rect.size.height - lineHeight)];
        [bezierPath addLineToPoint:CGPointMake(xPosition, rect.size.height)];
        
        if (i != 0 && i%10 == 0) {
            value = [NSString stringWithFormat:@"%.0f", xPosition];
            valueWidth = [value sizeWithAttributes:valueAttributes].width;
            [value drawAtPoint:CGPointMake(xPosition - valueWidth / 2.0, lineHeight) withAttributes:valueAttributes];
            [value drawAtPoint:CGPointMake(xPosition - valueWidth / 2.0, rect.size.height - lineHeight - 10) withAttributes:valueAttributes];
        }
    }
    
    for (NSInteger i = 0; i < rect.size.height / self.unitValue; i++) {

        lineWidth = i%10 ? 5 : 10;
        yPosition = i * self.unitValue;

        [bezierPath moveToPoint:CGPointMake(0, yPosition)];
        [bezierPath addLineToPoint:CGPointMake(lineWidth, yPosition)];
        
        [bezierPath moveToPoint:CGPointMake(self.frame.size.width - lineWidth, yPosition)];
        [bezierPath addLineToPoint:CGPointMake(rect.size.width, yPosition)];
        
        if (i != 0 && i%10 == 0) {
            value = [NSString stringWithFormat:@"%.0f", yPosition];
            valueWidth = [value sizeWithAttributes:valueAttributes].width;
            [value drawAtPoint:CGPointMake(lineWidth, yPosition - 5) withAttributes:valueAttributes];
            [value drawAtPoint:CGPointMake(rect.size.width - lineWidth - valueWidth, yPosition - 5) withAttributes:valueAttributes];
        }
    }
    
    [bezierPath stroke];
    
    lineColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    [lineColor set];
    for (NSInteger i = 1; i < rect.size.width / self.unitValue; i++) {
        xPosition = i * self.unitValue;
        [bezierPath moveToPoint:CGPointMake(xPosition, 0)];
        [bezierPath addLineToPoint:CGPointMake(xPosition, rect.size.height)];
    }
    
    for (NSInteger i = 1; i < rect.size.height / self.unitValue; i++) {
        yPosition = i * self.unitValue;
        [bezierPath moveToPoint:CGPointMake(0, yPosition)];
        [bezierPath addLineToPoint:CGPointMake(rect.size.width, yPosition)];
    }
    [bezierPath stroke];
}

- (void)setUnitValue:(NSInteger)unitValue
{
    _unitValue = unitValue;
    
    [self setNeedsDisplay];
}

@end
