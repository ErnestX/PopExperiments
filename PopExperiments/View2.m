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
    whiteLayer = [CALayer layer];
    whiteLayer.backgroundColor = [UIColor whiteColor].CGColor;
    whiteLayer.bounds = CGRectMake(0, 0, 200, 400);
    whiteLayer.position = CGPointMake(180, 300);
    [self.layer addSublayer:whiteLayer];
    
    UIPanGestureRecognizer* panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self addGestureRecognizer:panRecognizer];
    
    return self;
}

- (void) handlePan:(UIPanGestureRecognizer*) uigr
{
    
}

@end
