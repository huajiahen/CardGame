//
//  SetGame.h
//  CardGame
//
//  Created by 黄 嘉恒 on 2/13/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetCardDeck.h"

@interface SetGame : NSObject

@property (nonatomic,readonly) NSInteger score;
@property (nonatomic,strong,readonly)NSMutableArray *cards;

-(id)initWithCardCount:(NSUInteger)count
             usingDeck:(Deck *)deck;
-(Card *)cardAtIndex:(NSUInteger)index;

@end
