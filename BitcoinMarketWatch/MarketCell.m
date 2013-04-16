//
//  MarketCell.m
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/3/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import "MarketCell.h"

@implementation MarketCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
