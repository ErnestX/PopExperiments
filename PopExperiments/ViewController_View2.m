//
//  ViewController_View2.m
//  PopExperiments
//
//  Created by Jialiang Xiang on 2015-04-24.
//  Copyright (c) 2015 Jialiang Xiang. All rights reserved.
//

#import "ViewController_View2.h"
#import "View2.h"

@interface ViewController_View2 ()

@end

@implementation ViewController_View2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Plus:(id)sender {
    [((View2*)(self.view)) zoomIn];
}

- (IBAction)Minus:(id)sender {
    [((View2*)(self.view)) zoomOut];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
