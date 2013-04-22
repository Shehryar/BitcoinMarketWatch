//
//  NewsItem.h
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/15/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsItem : NSObject {
    id currentElement;

}

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *link;

@end
