//
//  SetCard.m
//  CardGame
//
//  Created by 黄 嘉恒 on 2/12/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard
+ (NSArray *)numbers{
    return @[@1,@2,@3];
}

+ (NSArray *)symbols{
    return @[@"▲",@"●",@"■"];
}

+ (NSArray *)shadings{
    return @[@"solid",@"striped",@"open"];
}

- (void)setNumber:(NSUInteger)number{
    if ([[SetCard numbers] containsObject:@(number)]){
        _number = number;
    }
}

- (void)setSymbol:(NSString *)symbol{
    if ([[SetCard symbols] containsObject:symbol]){
        _symbol = symbol;
    }
}

- (void)setShading:(NSString *)shading{
    if ([[SetCard shadings] containsObject:shading]){
        _shading = shading;
    }
}

- (int)match:(NSArray *)cards{
    int score = 0;
    if ([cards count] == 2 && [cards respondsToSelector:@selector(setSymbol:)]){
        SetCard *card1 = cards[0];
        SetCard *card2 = cards[1];
        if ([SetCard checkObjectsAreSameOrDifferent:@[@(self.number),@(card1.number),@(card2.number)]] &&
            [SetCard checkObjectsAreSameOrDifferent:@[self.symbol,card1.symbol,card2.symbol]] &&
            [SetCard checkObjectsAreSameOrDifferent:@[self.shading,card1.shading,card2.shading]])
            score = 1;
    }
    return score;
}

+ (BOOL)checkObjectsAreSameOrDifferent:(NSArray *)objects{
    BOOL areSame = YES;
    BOOL areDifferent = YES;
    for (NSInteger i=0; i<[objects count];i++){
        for (NSInteger j=i+1; j<[objects count]; j++){
            if (![objects[i] isEqual:objects[j]]) areSame = NO;
        }
    }
    for (NSInteger i=0; i<[objects count];i++){
        for (NSInteger j=i+1; j<[objects count]; j++){
            if ([objects[i] isEqual:objects[j]]) areDifferent = NO;
        }
    }
    return areSame || areDifferent;
}

//convience initializer
- (id)initWithNumber:(NSUInteger)number
           andSymbol:(NSString *)symbol
          andShading:(NSString *)shading{
    self = [self init];
    if (self) {
        self.number = number;
        self.symbol = symbol;
        self.shading = shading;
    }
    return self;
}

@end
