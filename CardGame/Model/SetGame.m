//
//  SetGame.m
//  CardGame
//
//  Created by 黄 嘉恒 on 2/13/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import "SetGame.h"

#define UNMATCH_SCORE 2
#define MATCH_MULTIPLY 4

@interface SetGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,readwrite) NSUInteger flipCount;
@property (nonatomic,strong,readwrite)NSMutableArray *resultHistory;
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
        self.resultHistory = [[NSMutableArray alloc] initWithArray:@[@"Game started!"]];
        self.flipCount = 0;
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? self.cards[index]:nil;
}

-(void)flipCardAtIndex:(NSUInteger)index{
    if (index < [self.cards count]) {
        Card *card = self.cards[index];
        card.FaceUp = !card.isFaceUp;
        if (!card.isUnplayable && card.isFaceUp) {
            NSString *result = [[NSString alloc] initWithFormat:@"Flipped up %@",card.contents];
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable && otherCard != card) {
                    NSInteger matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_MULTIPLY;
                        card.Unplayable = YES;
                        otherCard.Unplayable = YES;
                        result = [[NSString alloc] initWithFormat:@"Matched %@ & %@ for %d points",otherCard.contents,card.contents,matchScore * MATCH_MULTIPLY];
                    } else {
                        self.score -= UNMATCH_SCORE;
                        card.FaceUp = NO;
                        otherCard.FaceUp = NO;
                        result = [[NSString alloc] initWithFormat:@"%@ and %@ don’t match! %d point penalty!",otherCard.contents,card.contents,UNMATCH_SCORE];
                    }
                    break;
                }
            }
            [self.resultHistory addObject:result];
        }
    }
}

@end
