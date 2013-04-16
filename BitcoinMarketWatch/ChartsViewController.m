//
//  ChartsViewController.m
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/9/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import "ChartsViewController.h"

@interface ChartsViewController ()

@end

@implementation ChartsViewController

- (void)loadUIWebView {
    [self.chartsWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mtgoxlive.com/orders"]]];
    self.chartsWebView.hidden = NO;
    self.chartsWebView.frame = self.view.bounds;
    self.chartsWebView.scalesPageToFit = YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self loadUIWebView];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
