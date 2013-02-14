//
//  SetCard.h
//  CardGame
//
//  Created by 黄 嘉恒 on 2/12/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card
@property (nonatomic) NSUInteger number;
@property (nonatomic,strong) NSString *symbol;
@property (nonatomic,strong) NSString *shading;

+ (NSArray *)numbers;
+ (NSArray *)symbols;
+ (NSArray *)shadings;

//convience initializer
- (id)initWithNumber:(NSUInteger)number
           andSymbol:(NSString *)symbol
          andShading:(NSString *)shading;

@end
