//
//  RecipeDetailViewController.h
//  CustomTable
//
//  Created by Anuj Katiyal on 07/09/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *recipeLabel;
@property (nonatomic, strong) IBOutlet UILabel *recipePrepTime;

@property (nonatomic, strong) NSString *recipeName;
@property (nonatomic, strong) NSString *recipePrepTimeString;

@end
