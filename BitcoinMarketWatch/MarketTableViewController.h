//
//  MarketTableViewController.h
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/3/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarketCell.h"
#import "TickerData.h"

@interface MarketTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *tickerArray;

@property (strong, nonatomic) TickerData *tickerData;





@end
