//
//  UINavigationController+UpsideDownSupport.m
//  CellAdventuresPartThree
//
//  Created by Peter on 10/31/14.
//  Copyright (c) 2014 Peter. All rights reserved.
//

#import "UINavigationController+UpsideDownSupport.h"

@implementation UINavigationController (UpsideDownSupport)

- (BOOL)shouldAutorotate
{
	return YES;
}

- (NSInteger)supportedInterfaceOrientations
{
	return UIInterfaceOrientationMaskAll;
}

@end
