//
//  SetCardDeck.m
//  CardGame
//
//  Created by 黄 嘉恒 on 2/13/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import "SetCardDeck.h"

@implementation SetCardDeck
- (id)init{
    self = [super init];
    if (self) {
        for (NSNumber *number in [SetCard numbers]) {
            for (NSString *symbol in [SetCard symbols]) {
                for (NSString *shading in [SetCard shadings]) {
                    [self addingcard:
                     [[SetCard alloc] initWithNumber:[number integerValue] 
                                           andSymbol:symbol 
                                          andShading:shading]
                               atTop:YES];
                }
            }
        }
    }
    return self;
}
@end