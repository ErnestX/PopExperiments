//
//  View2.h
//  PopExperiments
//
//  Created by Jialiang Xiang on 2015-04-27.
//  Copyright (c) 2015 Jialiang Xiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View2 : UIView
{
    __weak IBOutlet UISwitch *handlePanSwitch;
}

- (void) zoomIn;
- (void) zoomOut;

@end
