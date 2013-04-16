//
//  SideViewController.h
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/9/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface SideViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *marketsButton;
@property (weak, nonatomic) IBOutlet UIButton *chartsButton;

- (IBAction)changetoCharts:(id)sender;
- (IBAction)changetoMarkets:(id)sender;
- (IBAction)changetoNews:(id)sender;

@property (weak, nonatomic) IBOutlet UITableViewCell *charts;
@property (weak, nonatomic) IBOutlet UITableViewCell *markets;

@end
