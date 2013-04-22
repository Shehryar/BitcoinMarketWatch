//
//  NewsViewController.m
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/15/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import "NewsViewController.h"
#import "AFNetworking.h"
#import "NewsDetailViewController.h"


@interface NewsViewController ()

@end

@implementation NewsViewController

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

    _newsArray = [NSMutableArray array];
    _currentString = [NSMutableString string];
    
    NSURL *url = [NSURL URLWithString:@"http://bitcoincharts.com/headlines.rss"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFXMLRequestOperation *operation = [AFXMLRequestOperation XMLParserRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSXMLParser *XMLParser){
        XMLParser.delegate = self;
        [XMLParser setShouldProcessNamespaces:NO];
        [XMLParser parse];
        NSLog(@"XML Parsed");
        NSLog(@"%@", [response description]);
        
    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, NSXMLParser *XMLParser) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving News" message:[NSString stringWithFormat:@"%@", error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [av show];
    }];
    [operation start];
     
}


#pragma mark - AFXMLRequestOperationDelegate

static NSString * const kTitleElementName = @"title";
static NSString * const kLinkElementName = @"link";
static NSString *const kItemName= @"item";

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if ([elementName isEqualToString:kItemName]) {
        _currentItem = [[NewsItem alloc] init];
    }
    
    if ([elementName isEqualToString:kTitleElementName]) {
        //_currentItem = [[NewsItem alloc] init];
        _currentString = [[NSMutableString alloc] init];
        [_currentString setString:@""];
        _storeCharacters = YES;
    }
    
    if ([elementName isEqualToString:kLinkElementName]) {
        _currentString = [[NSMutableString alloc] init];
        _storeCharacters = YES;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (_storeCharacters)
        [_currentString appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {

    if ([elementName isEqualToString:kTitleElementName]) {
        _currentItem.title = _currentString;
    }
    else if ([elementName isEqualToString:kLinkElementName]) {
        
        _currentItem.link = _currentString;
        //[self finishedNewsItem:_currentItem];
    }
    if ([elementName isEqualToString:kItemName]) {
        [self finishedNewsItem:_currentItem];
    }
    
    

    _storeCharacters = NO;
}

- (void)finishedNewsItem:(NewsItem *)n {
    [_newsArray addObject:n];
    //_currentItem = nil;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"%d", _newsArray.count);
    [self.tableView reloadData];
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
    return _newsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"newsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NewsItem *item = [_newsArray objectAtIndex:indexPath.row];
    NSLog(@"%@", item);
    
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.link;
    // Configure the cell...
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([[segue identifier] isEqualToString:@"newsDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NewsItem *news = _newsArray[indexPath.row];
        [[segue destinationViewController] setNewsItem:news];
        
        
        
    }
}

- (void)refreshView:(UIRefreshControl *)sender {
    _newsArray = [NSMutableArray array];
    _currentString = [NSMutableString string];
    
    NSURL *url = [NSURL URLWithString:@"http://bitcoincharts.com/headlines.rss"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFXMLRequestOperation *operation = [AFXMLRequestOperation XMLParserRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSXMLParser *XMLParser){
        XMLParser.delegate = self;
        [XMLParser setShouldProcessNamespaces:NO];
        [XMLParser parse];
        NSLog(@"XML Parsed");
        NSLog(@"%@", [response description]);
        
    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, NSXMLParser *XMLParser) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving News" message:[NSString stringWithFormat:@"%@", error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [av show];
    }];
    [operation start];
    
    [self.tableView reloadData];
    [sender endRefreshing];
}
#pragma mark - Table view delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//
//
//{
//    // Navigation logic may go here. Create and push another view controller.
//    
//   //  NewsDetailViewController *detailViewController = [[NewsDetailViewController alloc] initWithNibName:@"NewsDetailViewController" bundle:nil];
//    NewsDetailViewController *dvc = [[NewsDetailViewController alloc] init];
//     // ...
//     // Pass the selected object to the new view controller.
//    [self.navigationController presentViewController:dvc animated:YES completion:nil];
//     //[self.navigationController pushViewController:dvc animated:YES];
//    
//}

@end
