//
//  CustomTableViewController.m
//  CustomTable
//
//  Created by Anuj Katiyal on 06/09/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import "CustomTableViewController.h"
#include "CustomTableCell.h"

@interface CustomTableViewController ()

@end

@implementation CustomTableViewController{
    NSArray *recipeNames;
    NSArray *recipeImages;
    NSArray *recipePrepTimes;
    BOOL recipeChecked[16];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipes" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    recipeNames = [dict objectForKey:@"Name"];
    recipeImages = [dict objectForKey:@"Image"];
    recipePrepTimes = [dict objectForKey:@"PrepTime"];
    
    [self.tableView setContentInset:UIEdgeInsetsMake(20, self.tableView.contentInset.left,
                                                     self.tableView.contentInset.bottom, self.tableView.contentInset.right)];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [recipeNames count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *CellIdentifier = @"CustomTableCell";
    
    CustomTableCell *cell = (CustomTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[CustomTableCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    cell.nameLabel.text = [recipeNames objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
    cell.prepTimeLabel.text = [recipePrepTimes objectAtIndex:indexPath.row];
    
    if(recipeChecked[indexPath.row]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* selectedRecipe = [recipeNames objectAtIndex:indexPath.row];
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Row Selected" message:selectedRecipe
                                 delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    // Display Alert Message
    [messageAlert show];

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    if (recipeChecked[indexPath.row]) {
        recipeChecked[indexPath.row] = NO;
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else{
        recipeChecked[indexPath.row] = YES;
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
