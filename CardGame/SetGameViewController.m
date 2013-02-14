//
//  SetGameViewController.m
//  CardGame
//
//  Created by 黄 嘉恒 on 2/12/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetGame.h"

#define UNMATCH_SCORE 2
#define MATCH_MULTIPLY 4

@interface SetGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardCollection;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong,nonatomic) SetGame *game;
@property (nonatomic) NSInteger score;
@end

@implementation SetGameViewController

- (SetGame *)game{
    if (!_game) {
        _game = [[SetGame alloc] init];
    }
    return _game;
}

//isFaceUp is isSelected here
- (void)flipCardAtIndex:(NSUInteger)index{
    Card *card = [self.game cardAtIndex:index];
    card.FaceUp = !card.isFaceUp;
    if (!card.isUnplayable && card.isFaceUp) {
        NSString *result = [[NSString alloc] initWithFormat:@"Flipped up %@",card.contents];
        for (Card *otherCard in self.game.cards) {
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
    }
}



- (void)setup{
    
}

- (void)awakeFromNib{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setup];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
