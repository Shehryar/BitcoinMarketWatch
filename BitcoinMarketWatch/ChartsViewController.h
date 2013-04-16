//
//  ChartsViewController.h
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/9/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChartsViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *chartsWebView;

@end
