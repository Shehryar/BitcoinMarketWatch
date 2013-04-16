//
//  DetailViewController.m
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/8/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setRoundingMode:NSNumberFormatterRoundHalfUp];
    [fmt setNumberStyle:NSNumberFormatterDecimalStyle];
    
    self.currencyLabel.text = _ticker.currency;
    _fifteenLabel.text = [fmt stringFromNumber:_ticker.fifteen];
    _twentyLabel.text = [fmt stringFromNumber:_ticker.twenty4];
    _buyLabel.text = [fmt stringFromNumber:_ticker.buy];
    _sellLabel.text = [fmt stringFromNumber:_ticker.sell];
    NSString *str = [fmt stringFromNumber:_ticker.last];
    _lastLabel.text = [NSString stringWithFormat:@"%@ %@", _ticker.symbol, str];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipeBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
