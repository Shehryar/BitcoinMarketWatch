//
//  TickerData.h
//  BitcoinMarketWatch
//
//  Created by Shehryar Hussain on 4/3/13.
//  Copyright (c) 2013 Shehryar Hussain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TickerData : NSObject


@property (nonatomic, strong) NSString *symbol;
@property (strong, nonatomic) NSString *currency;
@property (nonatomic, strong) NSNumber *last;
@property (nonatomic, strong) NSNumber *twenty4;
@property (nonatomic, strong) NSNumber *buy;
@property (nonatomic, strong) NSNumber *sell;
@property (nonatomic, strong) NSNumber *fifteen;




//- (id)initWithTitle:(NSString *)currency ;
//+ (id)objectWithTitle:(NSString *)currency;


@end
