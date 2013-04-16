//
//  DetailViewController.h
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/8/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TickerData.h"

@interface DetailViewController : UIViewController
- (IBAction)swipeBack:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *twentyLabel;
@property (weak, nonatomic) IBOutlet UILabel *fifteenLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastLabel;


@property (strong, nonatomic) TickerData *ticker;

@end
