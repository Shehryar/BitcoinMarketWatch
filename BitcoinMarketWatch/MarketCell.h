//
//  MarketCell.h
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/3/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarketCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *currencyLabel;
@property (strong, nonatomic) IBOutlet UILabel *symbolLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *price24Label;


@end
