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
    CATransform3D previousTransform;
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
    blueLayer.position = CGPointMake(100, 200);
    [whiteLayer addSublayer:blueLayer];
    
    UIPanGestureRecognizer* panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:uv action:@selector(handlePan:)];
    [uv addGestureRecognizer:panRecognizer];
}

- (void) handlePan:(UIPanGestureRecognizer*) uigr
{
    if (handlePanSwitch.on) {
        [self handlePanStrategyA:uigr];
    } else {
        [self handlePanStrategyB:uigr];
    }
}

- (void) handlePanStrategyA:(UIPanGestureRecognizer*) uigr
{
    switch (uigr.state) {
        case UIGestureRecognizerStateBegan:
        {
            NSLog(@"touch began");
            // Remember original location and transformation matrix
            previousLocation = blueLayer.position;
            previousTransform = whiteLayer.transform;
        }
            
        case UIGestureRecognizerStateChanged:
        {
            //lastScrollSpeed = [uigr velocityInView:self];
            CGPoint translation = [uigr translationInView:self]; // pan up or scroll down = negative
            CGPoint newPosition = CGPointMake(previousLocation.x, previousLocation.y + translation.y);
            [CATransaction begin];
            [CATransaction setDisableActions:YES];
            whiteLayer.transform = CATransform3DMakeScale(previousTransform.m11 + translation.y * 0.01, previousTransform.m22 + translation.y * 0.01, previousTransform.m33);
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

- (void) handlePanStrategyB:(UIPanGestureRecognizer*) uigr
{
    NSLog(@"stragegyB");
}

- (void) zoomIn
{
    whiteLayer.transform = CATransform3DMakeScale(whiteLayer.transform.m11 + 0.2, whiteLayer.transform.m22 + 0.2, whiteLayer.transform.m33);
}

- (void) zoomOut
{
    whiteLayer.transform = CATransform3DMakeScale(whiteLayer.transform.m11 - 0.2, whiteLayer.transform.m22 - 0.2, whiteLayer.transform.m33);
}

@end
