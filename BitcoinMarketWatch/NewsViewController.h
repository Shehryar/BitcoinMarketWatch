//
//  NewsViewController.h
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/15/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsItem.h"

@interface NewsViewController : UITableViewController <NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableArray *newsArray;

@property (strong) NSDictionary *news;

@property (strong) NSMutableDictionary *xmlNews;
//@property(strong) NSMutableDictionary *currentDictionary;//current section being parsed
//@property(strong) NSString *previousElementName;
//@property(strong) NSString *elementName;

@property (assign, nonatomic) BOOL *storeCharacters;

@property(strong) NSMutableString *outstring;

@property (strong) NewsItem *currentItem;

- (void)finishedNewsItem: (NewsItem *)n;



@end
