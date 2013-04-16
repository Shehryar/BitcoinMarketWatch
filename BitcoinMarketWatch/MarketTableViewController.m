//
//  MarketTableViewController.m
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/3/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import "MarketTableViewController.h"
#import "TickerData.h"
#import "DetailViewController.h"

@interface MarketTableViewController ()

@end

@implementation MarketTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tickerArray = [NSMutableArray array];
    
    NSURL *tickerDataURL = [NSURL URLWithString:@"https://blockchain.info/ticker"];
    NSData *jsonData = [NSData dataWithContentsOfURL:tickerDataURL];
    NSError *error = nil;
    
    /*
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    NSLog(@"%@", dataDictionary);
    NSArray *ar = [NSArray arrayWithObject:dataDictionary];
    for (NSString *key in [dataDictionary allKeys]) {
        for (NSDictionary *dict in ar) {
            TickerData *t = [[TickerData alloc] init];
            t.currency = key;
            t.symbol = [dataDictionary objectForKey:@"symbol"];
            t.last = [dataDictionary objectForKey:@"last"];
            [_tickerArray addObject:t];
            
        }

    }
    
    */
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    NSLog(@"%@", dataDictionary);
    
    
    for (NSString *key in dataDictionary) {
        NSDictionary *dic=[dataDictionary objectForKey:key];
        TickerData *t=[[TickerData alloc] init];
        t.currency = key;//EDITED
        t.symbol = [dic objectForKey:@"symbol"];
        t.last = [dic objectForKey:@"last"];
        t.twenty4 = [dic objectForKey:@"24h"];
        t.fifteen = [dic objectForKey:@"15m"];
        t.buy = [dic objectForKey:@"buy"];
        t.sell = [dic objectForKey:@"sell"];
        [_tickerArray addObject:t];
        
    }
    
    // Handle the refresh control
    [self.refreshControl addTarget:self action:@selector(refreshView:) forControlEvents:UIControlEventValueChanged];
    
    
    

    
    NSLog(@"%d", [_tickerArray count]);
    

    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"detailCheck"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TickerData *t = _tickerArray[indexPath.row];
        DetailViewController *dvc = (DetailViewController *)[segue destinationViewController];
        [dvc setTicker:t];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _tickerArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MarketCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[MarketCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    TickerData *t = [_tickerArray objectAtIndex:indexPath.row];
    if ([t.last doubleValue] < [t.twenty4 doubleValue]) {
        cell.contentView.backgroundColor = [UIColor redColor];
    }
    else {
        cell.contentView.backgroundColor = [UIColor greenColor];
    }

    cell.currencyLabel.text = t.currency;
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setRoundingMode:NSNumberFormatterRoundHalfUp];
    [fmt setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *str = [fmt stringFromNumber:t.last];
    
    NSString *str2 = [NSString stringWithFormat:@"%@ %@", t.symbol, str];
    cell.priceLabel.text = str2;
    
        
    
    return cell;
    
    
}


- (void)refreshView:(UIRefreshControl *)sender {
    //[self.tableView reloadData];
    NSLog(@"Refreshing");
    
    NSURL *tickerDataURL = [NSURL URLWithString:@"https://blockchain.info/ticker"];
    NSData *jsonData = [NSData dataWithContentsOfURL:tickerDataURL];
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    NSLog(@"%@", dataDictionary);
    _tickerArray = [NSMutableArray array];
    
    for (NSString *key in dataDictionary) {
        NSDictionary *dic=[dataDictionary objectForKey:key];
        TickerData *t=[[TickerData alloc] init];
        t.currency = key;//EDITED
        t.symbol = [dic objectForKey:@"symbol"];
        t.last = [dic objectForKey:@"last"];
        t.twenty4 = [dic objectForKey:@"24h"];
        t.fifteen = [dic objectForKey:@"15m"];
        t.buy = [dic objectForKey:@"buy"];
        t.sell = [dic objectForKey:@"sell"];
        // Add in a value for the 24h price and then create a ticker from there
        [_tickerArray addObject:t];
    }
    NSLog(@"%d", [_tickerArray count]);
    [self.tableView reloadData];
    [sender endRefreshing];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


@end
