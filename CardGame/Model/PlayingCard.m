//
//  PlayingCard.m
//  CardGame
//
//  Created by 黄 嘉恒 on 1/25/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()

@end

@implementation PlayingCard

@synthesize suit = _suit;

+(NSArray *)ranks{
    return @[@"?",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSArray *)suits{
    return @[@"♥",@"♦",@"♣",@"♠"];
}

+(NSUInteger)maxRank{
    return [PlayingCard ranks].count -1;
}

-(NSString *)contents{
    return [[PlayingCard ranks][self.rank] stringByAppendingString:self.suit];
}

-(void)setSuit:(NSString *)suit{
    if ([[PlayingCard suits] containsObject:suit]) {
        _suit = suit;
    }
}

-(NSString *)suit{
    return _suit ? _suit:@"?";
}

-(void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

//convience initializer
-(id)initWithRank:(NSUInteger)rank andSuit:(NSString *)suit{
    if (self = [self init]) {
        [self setRank:rank];
        [self setSuit:suit];
    }
    return self;
}

- (int) match:(NSArray *)cards{
    int score = 0;
    if ([cards count] == 1) {
        if ([cards[0] isKindOfClass:[PlayingCard class]]) {
            PlayingCard *card = cards[0];
            if ([self.suit isEqualToString:card.suit]) {
                score = 1;
            }else if (self.rank = card.rank){
                score = 4;
            }
        }
    }
    return score;
}

@end
