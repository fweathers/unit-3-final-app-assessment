//
//  C4QCatFactsCustomCell.m
//  unit-3-final-app-assessment
//
//  Created by Felicia Weathers on 12/20/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsCustomCell.h"

@implementation C4QCatFactsCustomCell

@synthesize catFactLabel = _catFactLabel;

- (void)awakeFromNib {
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addButtonTapped:(id)sender {
    NSLog(@"Add a kitty fact");
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved"
                                                    message:@"You have saved the kitty"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    

    
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"savedCatFacts"]) {
        
        NSMutableArray *savedFactsArray = [[NSMutableArray alloc] init];
        
        [savedFactsArray addObject:self.catFactLabel.text];
        
        [[NSUserDefaults standardUserDefaults] setObject:savedFactsArray forKey:@"savedCatFacts"];
        
    } else {
        NSMutableArray *savedCatFacts2 = [[NSMutableArray alloc]
                                               initWithArray:[[[NSUserDefaults standardUserDefaults]
                                                               objectForKey:@"savedCatFacts"] mutableCopy]];
        
        [savedCatFacts2 addObject:self.catFactLabel.text];
        
        [[NSUserDefaults standardUserDefaults] setObject:savedCatFacts2 forKey:@"savedCatFacts"];
    }
    
    [alert show];

}
@end
