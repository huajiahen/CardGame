//
//  PlayingCard.h
//  CardGame
//
//  Created by 黄 嘉恒 on 1/25/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (nonatomic)NSUInteger rank;
@property (nonatomic,strong)NSString *suit;

+(NSArray *)ranks;
+(NSArray *)suits;
+(NSUInteger)maxRank;
//convience initializer
-(id)initWithRank:(NSUInteger)rank andSuit:(NSString *)suit;
@end
