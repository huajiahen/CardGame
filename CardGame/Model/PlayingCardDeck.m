//
//  PlayingCardDeck.m
//  CardGame
//
//  Created by 黄 嘉恒 on 1/26/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck
-(id)init{
    if (self = [super init]) {
        for (NSString *suit in [PlayingCard suits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                [self addingcard:[[PlayingCard alloc]initWithRank:rank andSuit:suit] atTop:YES];
            }
        }
    }
    return self;
}

@end
