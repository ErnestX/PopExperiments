//
//  View2.m
//  PopExperiments
//
//  Created by Jialiang Xiang on 2015-04-27.
//  Copyright (c) 2015 Jialiang Xiang. All rights reserved.
//

#import "View2.h"

@implementation View2
{
    CALayer* whiteLayer;
    CALayer* blueLayer;
    CGPoint previousLocation;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    [self customInit:self];
    
    return self;
}

- (void) customInit: (UIView*) uv
{
    whiteLayer = [CALayer layer];
    whiteLayer.backgroundColor = [UIColor whiteColor].CGColor;
    whiteLayer.bounds = CGRectMake(0, 0, 200, 400);
    whiteLayer.position = CGPointMake(180, 300);
    [uv.layer addSublayer:whiteLayer];
    
    blueLayer = [CALayer layer];
    blueLayer.backgroundColor = [UIColor colorWithRed:0.1 green:0.6 blue:1 alpha:1].CGColor;
    blueLayer.bounds = CGRectMake(0, 0, 50, 50);
    blueLayer.position = CGPointMake(50, 55);
    [whiteLayer addSublayer:blueLayer];
    
    UIPanGestureRecognizer* panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:uv action:@selector(handlePan:)];
    [uv addGestureRecognizer:panRecognizer];
}

- (void) handlePan:(UIPanGestureRecognizer*) uigr
{
    switch (uigr.state) {
        case UIGestureRecognizerStateBegan:
        {
            NSLog(@"touch began");
            // Remember original location
            previousLocation = blueLayer.position;
        }
            
        case UIGestureRecognizerStateChanged:
        {
            //lastScrollSpeed = [uigr velocityInView:self];
            CGPoint translation = [uigr translationInView:self]; // pan up or scroll down = negative
            CGPoint newPosition = CGPointMake(previousLocation.x + translation.x, previousLocation.y + translation.y);
            [CATransaction begin];
            [CATransaction setDisableActions:YES];
            blueLayer.position = newPosition;
            [CATransaction commit];
        }
            
        case UIGestureRecognizerStateEnded:
        {
            // NSLog(@"touch ended");
            // start animation with lastScrollSpeed as initial speed
        }
    }

}

@end
