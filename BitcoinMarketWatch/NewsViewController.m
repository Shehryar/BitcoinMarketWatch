//
//  NewsViewController.m
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/15/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import "NewsViewController.h"
#import "AFNetworking.h"

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
    _outstring = [NSMutableString string];
    
    NSURL *url = [NSURL URLWithString:@"http://bitcoincharts.com/headlines.rss"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFXMLRequestOperation *operation = [AFXMLRequestOperation XMLParserRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSXMLParser *XMLParser){
        _xmlNews = [NSMutableDictionary dictionary];
        XMLParser.delegate = self;
        [XMLParser setShouldProcessNamespaces:YES];
        [XMLParser parse];
        NSLog(@"XML Parsed");
        
    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, NSXMLParser *XMLParser) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving News" message:[NSString stringWithFormat:@"%@", error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [av show];
    }];
    [operation start];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - AFXMLRequestOperationDelegate
static NSString *kName_Item = @"item";
static NSString *kName_Title = @"title";
static NSString *kName_Link = @"link";


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
//    self.previousElementName = self.elementName;
//    
//    if (qName) {
//        self.elementName = qName;
//    }
//    if ([qName isEqualToString:@"item"]) {
//        self.currentDictionary = [NSMutableDictionary dictionary];
//    }
//    _outstring = [NSMutableString string];
    
    
    if ([elementName isEqualToString:@"item"]) {
        _currentItem = [[NewsItem alloc] init];
        _storeCharacters = NO;
    }
    else if ([elementName isEqualToString:@"title"] || [elementName isEqualToString:@"link"]) {
        [_outstring setString:@""];
        //_storeCharacters = YES;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
//    if (!self.elementName)
//        return;
//    [self.outstring appendFormat:@"%@", string];
    [_outstring appendString:string];
    

}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:kName_Title]) {
        _currentItem.title = _outstring;
    }
    if ([elementName isEqualToString:kName_Link]) {
        _currentItem.link = _outstring;
    }
    if ([elementName isEqualToString:kName_Item]) {
        [self finishedNewsItem:_currentItem];
    }
    
}

- (void)finishedNewsItem:(NewsItem *)n {
    [_newsArray addObject:n];
    _currentItem = nil;
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NewsItem *item = [_newsArray objectAtIndex:indexPath.row];
    NSLog(@"%@", item);
    
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.link;
    // Configure the cell...
    
    return cell;
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
