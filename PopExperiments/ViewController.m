//
//  ViewController.m
//  PopExperiments
//
//  Created by Jialiang Xiang on 2015-02-16.
//  Copyright (c) 2015 Jialiang Xiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CALayer* redLayer = [CALayer layer];
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    redLayer.bounds = CGRectMake(0, 0, 50, 50);
    redLayer.position = CGPointMake(100, 500);
    [self.view.layer addSublayer:redLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
