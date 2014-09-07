//
//  RecipeDetailViewController.h
//  CustomTable
//
//  Created by Anuj Katiyal on 07/09/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface RecipeDetailViewController : UIViewController <UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UILabel *prepTimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *recipeImageView;

@property (nonatomic, strong) Recipe *recipe;


@end
