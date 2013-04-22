//
//  NewsViewController.h
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/15/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsItem.h"
#import "NewsDetailViewController.h"

@interface NewsViewController : UITableViewController <NSXMLParserDelegate> 


@property (nonatomic, strong) NSArray *itemsToDisplay;


@property (strong) NSMutableArray *newsArray;

@property (strong) NSMutableDictionary *xmlNews;

@property(strong) NSMutableString *currentString;

@property (strong) NewsItem *currentItem;

@property (nonatomic, assign) BOOL storeCharacters;


- (void)finishedNewsItem: (NewsItem *)n;



@end
