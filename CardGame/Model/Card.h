//
//  Card.h
//  CardGame
//
//  Created by 黄 嘉恒 on 1/25/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (nonatomic,strong) NSString *contents;
@property (nonatomic,getter = isFaceUp) BOOL FaceUp;
@property (nonatomic,getter = isUnplayable) BOOL Unplayable;

- (int) match:(NSArray *)cards;

@end
