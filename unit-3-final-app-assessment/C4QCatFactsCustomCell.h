//
//  C4QCatFactsCustomCell.h
//  unit-3-final-app-assessment
//
//  Created by Felicia Weathers on 12/20/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "C4QSavedCatFactsTableViewController.h"

@interface C4QCatFactsCustomCell : UITableViewCell

@property (nonatomic) NSMutableArray *savedFactsArray;

@property (nonatomic) NSMutableArray *selectedProducts;

@property (nonatomic, weak) IBOutlet UILabel *catFactLabel;

- (IBAction)addButtonTapped:(id)sender;


@end
