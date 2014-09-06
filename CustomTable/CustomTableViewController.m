//
//  CustomTableViewController.m
//  CustomTable
//
//  Created by Anuj Katiyal on 06/09/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import "CustomTableViewController.h"

@interface CustomTableViewController ()

@end

@implementation CustomTableViewController{
    NSArray *recipeNames;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    recipeNames = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [recipeNames objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"creme_brelee.jpg"];
    return cell;
}

@end
