//
//  SideViewController.m
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/9/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import "SideViewController.h"

@interface SideViewController ()

@end

@implementation SideViewController

- (void)awakeFromNib {
    
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
	// Do any additional setup after loading the view.
    [self.sidePanelController showCenterPanelAnimated:YES];
 
    //[_mainScreen addTarget:self action:(showMain:) forControlEvents:UIControlEventTouchUpInside];
}



- (void)showMain:(id)sender {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changetoCharts:(id)sender {
    //self.sidePanelController.centerPanel = [self]
    //[self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"]];
    self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"chartsController"];

}

- (IBAction)changetoMarkets:(id)sender {
    self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"];
}

- (IBAction)changetoNews:(id)sender {
    self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"newsController"];
}
@end
