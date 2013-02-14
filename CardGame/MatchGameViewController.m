//
//  ViewController.m
//  CardGame
//
//  Created by 黄 嘉恒 on 1/25/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import "MatchGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "MatchGame.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *CardsCollection;
@property (weak, nonatomic) IBOutlet UILabel *FlipCounter;
@property (weak, nonatomic) IBOutlet UILabel *ScoreCounter;
@property (weak, nonatomic) IBOutlet UILabel *ResultLabel;
@property (nonatomic,strong)MatchGame *game;
@property (nonatomic,strong)UIAlertView *restartAlart;
@end

@implementation ViewController
-(void)syncUI{
    for (UIButton *cardButton in self.CardsCollection) {
        Card *card = self.game.cards[[self.CardsCollection indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = (card.isUnplayable ? 0.6 : 1.0);
    }
    self.ResultLabel.text = self.game.result;
    self.ResultLabel.alpha = 1.0;
    self.FlipCounter.text = [[NSString alloc] initWithFormat: @"Flip Count:%d",self.game.flipCount];
    self.ScoreCounter.text = [[NSString alloc]initWithFormat:@"Score:%d",self.game.score];
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.CardsCollection indexOfObject:sender]];
    [self syncUI];
}

- (IBAction)deal:(id)sender {
    self.restartAlart = [[UIAlertView alloc] initWithTitle:@"Are you sure to restart the game?"
                                                   message:@"Correct game will not be saved!"
                                                  delegate:self
                                         cancelButtonTitle:@"No"
                                         otherButtonTitles:@"New game", nil];
    [self.restartAlart show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView == self.restartAlart && buttonIndex == 1) {
        [self newGame];
    }
}


- (void)newGame{
    self.game = [[MatchGame alloc]initWithCardCount:[self.CardsCollection count]
                                          usingDeck:[[PlayingCardDeck alloc]init]];
    [self syncUI];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self newGame];
}

@end
