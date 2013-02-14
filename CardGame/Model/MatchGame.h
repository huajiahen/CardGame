//
//  MatchGame.h
//  CardGame
//
//  Created by 黄 嘉恒 on 1/31/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface MatchGame : NSObject

@property (nonatomic,readonly) NSInteger score;
@property (nonatomic,readonly) NSUInteger flipCount;
@property (nonatomic,strong,readonly)NSMutableArray *cards;
@property (nonatomic,strong,readonly)NSString *result;

-(id)initWithCardCount:(NSUInteger)count
             usingDeck:(Deck *)deck;

-(void)flipCardAtIndex:(NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;

@end
