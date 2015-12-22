//
//  C4QCatsTableViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

/*  Requirements
 
1. Populate the table with random cat facts. The API information is set for you at the top of C4QCatFactsTableViewController.m.
2. Create a custom UITableViewCell with a + button on the right side (asset is already in the project).
3. Save a cat fact in NSUserDefaults when the + button is tapped.
 The height of the cell should be variable based on the amount of text provided.
 */


#import "C4QCatFactsTableViewController.h"
#import "C4QCatFactsDetailViewController.h"
#import "C4QSavedCatFactsTableViewController.h"
#import "C4QCatFactsCustomCell.h"
#import <AFNetworking/AFNetworking.h>


#define CAT_API_URL @"http://catfacts-api.appspot.com/api/facts?number=100"

@interface C4QCatFactsTableViewController ()

@property (nonatomic)NSMutableArray *catData;

@end

@implementation C4QCatFactsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIBarButtonItem *savedButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Saved"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(savedButton:)];
    self.navigationItem.rightBarButtonItem = savedButton;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"application/javascript"];
    
    [manager GET:@"http://catfacts-api.appspot.com/api/facts?number=100"
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        self.catData = [[NSMutableArray alloc]init];
        NSMutableArray *catFacts = [responseObject objectForKey:@"facts"];
        
        NSLog(@"%@", catFacts);
        
        for (NSString *catInfo in catFacts) {
            [self.catData addObject:catInfo];
        }
        
        [self.tableView reloadData];
             
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"%@", error);
     }];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"C4QCatFactsCustomCell" bundle:nil] forCellReuseIdentifier:@"CatFactIdentifier"];

}


- (IBAction)savedButton:(id)sender {
    
    C4QSavedCatFactsTableViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@" SavedCatData"];
    
    [self.navigationController pushViewController:viewController animated:YES];

    
}

#pragma mark - Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.catData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    C4QCatFactsCustomCell *cell = (C4QCatFactsCustomCell *)[tableView dequeueReusableCellWithIdentifier:@"CatFactIdentifier" forIndexPath:indexPath];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"C4QCatFactsCustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.catFactLabel.text = [self.catData objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *chosenCatLabel = cell.textLabel.text;
    chosenCatLabel = [self.catData objectAtIndex:indexPath.row];
    
    C4QCatFactsDetailViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Identifier"];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}



@end
