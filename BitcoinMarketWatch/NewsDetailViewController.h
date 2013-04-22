//
//  NewsDetailViewController.h
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/16/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsItem.h"

@interface NewsDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;


- (IBAction)back:(id)sender;
@property (strong, nonatomic) NewsItem *newsItem;

@end
