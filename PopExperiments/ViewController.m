//
//  ViewController.m
//  PopExperiments
//
//  Created by Jialiang Xiang on 2015-02-16.
//  Copyright (c) 2015 Jialiang Xiang. All rights reserved.
//

#import "ViewController.h"
#import "POP.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CALayer* redLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    redLayer = [CALayer layer];
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    redLayer.bounds = CGRectMake(0, 0, 50, 50);
    redLayer.position = CGPointMake(100, 500);
    [self.view.layer addSublayer:redLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Button1:(id)sender forEvent:(UIEvent *)event {
    redLayer.position = CGPointMake(redLayer.position.x + 50, redLayer.position.y - 100);
}

- (IBAction)Button2:(id)sender forEvent:(UIEvent *)event {
    POPDecayAnimation *decayAnimation = [POPDecayAnimation animation];
    
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"position_on_screen" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.readBlock = ^(id obj, CGFloat values[]) {
            values[0] = redLayer.position.x;
            values[1] = redLayer.position.y;
        };
        
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            [redLayer setPosition:CGPointMake(values[0], values[1])];
        };
        // dynamics threshold
        prop.threshold = 0.01;
    }];
    
    decayAnimation.property = prop;
    decayAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(20, -40)];
    [self pop_addAnimation:decayAnimation forKey:@"pop_custom_decay"];
}

- (IBAction)Button3:(id)sender forEvent:(UIEvent *)event {
    POPCustomAnimation *customAnimation = [POPCustomAnimation animationWithBlock:^BOOL(id obj, POPCustomAnimation *animation) {
//        NSLog(@"block called");
        if (redLayer.position.y < 0) {
            return NO;
        } else {
            redLayer.position = CGPointMake(redLayer.position.x + 5, redLayer.position.y - 15);
            return YES;
        }
    }];
    //customAnimation.repeatCount = 10;
    [self pop_addAnimation:customAnimation forKey:@"custom_animation"];
}

- (IBAction)Button4:(id)sender forEvent:(UIEvent *)event {
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [scale setFromValue:[NSNumber numberWithFloat:1.0f]];
    [scale setToValue:[NSNumber numberWithFloat:0.8f]];
    [scale setDuration:0.5f];
    [scale setRemovedOnCompletion:NO];
    [scale setFillMode:kCAFillModeForwards];
    //self.view.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5);
    [self.view.layer addAnimation:scale forKey:@"scale"];
}


@end
