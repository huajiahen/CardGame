//
//  SetGame.m
//  CardGame
//
//  Created by 黄 嘉恒 on 2/13/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import "SetGame.h"

@interface SetGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong,readwrite)NSMutableArray *cards;
@end

@implementation SetGame

-(NSMutableArray *)cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    if (self && count <= [deck.cards count]) {
        for (int i = 0; i < count; i++) {
            self.cards[i] = [deck drawRandomCard];
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? self.cards[index]:nil;
}


@end
