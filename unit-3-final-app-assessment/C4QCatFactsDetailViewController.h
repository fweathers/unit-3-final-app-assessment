//
//  C4QCatFactDetailViewController.h
//  unit-3-final-app-assessment
//
//  Created by Michael Kavouras on 12/18/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "C4QSavedCatFactsTableViewController.h"
#import "C4QCatFactsTableViewController.h"
#import "C4QCatFactsTableViewCell.h"

@interface C4QCatFactsDetailViewController : UIViewController

@property (nonatomic) NSString *chosenCatFact;

@property (weak, nonatomic) IBOutlet UIImageView *randomCatImage;

@property (weak, nonatomic) IBOutlet UILabel *chosenCatLabel;

@end
