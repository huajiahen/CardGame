//
//  Deck.m
//  CardGame
//
//  Created by 黄 嘉恒 on 1/25/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@end

@implementation Deck

- (NSMutableArray *)cards{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (void) addingcard:(Card *)card atTop:(BOOL)atTop{
    atTop ? [self.cards insertObject:card atIndex:0]:[self.cards addObject:card];
}

- (Card *) drawRandomCard{
    Card *randomCard = nil;
    if (self.cards.count) {
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}


@end
