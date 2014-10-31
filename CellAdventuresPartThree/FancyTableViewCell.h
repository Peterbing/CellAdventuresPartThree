//
//  FancyTableViewCell.h
//  CellAdventuresPartThree
//
//  Created by Peter on 10/30/14.
//  Copyright (c) 2014 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FancyTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *theLabel;

@property (nonatomic, weak) IBOutlet UISwitch *theSwitch;

@end
