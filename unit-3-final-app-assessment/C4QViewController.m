//
//  ViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 11/30/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QViewController.h"
#import "C4QColorPickerViewController.h"
#import "C4QCatFactsTableViewController.h"

@interface C4QViewController ()<ColourPassingDelegate>

@end

@implementation C4QViewController


- (void)colourPicked:(UIColor *)chosenColour {
   
    NSLog(@"%@", chosenColour);
    self.view.backgroundColor = chosenColour;
    
}

- (IBAction)hiddenButtonTapped:(id)sender {
    
    C4QCatFactsTableViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CatFacts"];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    C4QColorPickerViewController *vc = segue.destinationViewController;
    
    vc.delegate = self;
}


@end
