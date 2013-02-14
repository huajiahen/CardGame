//
//  Deck.h
//  CardGame
//
//  Created by 黄 嘉恒 on 1/25/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addingcard:(Card *)card atTop:(BOOL)atTop;

- (Card *) drawRandomCard;

@property (strong, nonatomic)NSMutableArray *cards;

@end