//
//  Menu.m
//  Storyboard
//
//Just updated MainViewController and DrawerTableViewController (both programmed in Swift)
//to objectiveC version (MainViewControllerObjc and Menu), this way will be easier to implement on Objective-c Projects.
//
//  Created by Daniel Rosero on 22/01/16.
//  Copyright © 2016 Kyohei Yamaguchi. All rights reserved.
//

#import "Menu.h"
#import "KYDrawerController.h"


@implementation Menu

- (void)viewDidLoad
{
    self.imgProfile.layer.cornerRadius=50;
    self.imgProfile.clipsToBounds=YES;
    self.imgProfile.image=[UIImage imageNamed:@"user_white"];
    NSString *DocumentName=[[NSUserDefaults standardUserDefaults]objectForKey:@"user_image"];
    if(DocumentName.length != 0)
    {
        [self.imgProfile setImageWithURL:[NSURL URLWithString:DocumentName] placeholderImage:[UIImage imageNamed:@"user_white"]];
    }
    
}
-(void)viewWillAppear:(BOOL)animated
{
    NSString *DocumentName=[[NSUserDefaults standardUserDefaults]objectForKey:@"user_image"];
    if(DocumentName.length != 0)
    {
        [self.imgProfile setImageWithURL:[NSURL URLWithString:DocumentName] placeholderImage:[UIImage imageNamed:@"user_white"]];
        
//        UIImageView *imgDoc=[[UIImageView alloc]init];
//        [imgDoc setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",DocumentName]]] placeholderImage:[UIImage imageNamed:@"user"] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
//            self.imgProfile.image=image;
//            [self.tableView reloadData];
//        } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
//        }];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath{
    [tableView deselectRowAtIndexPath:newIndexPath animated:YES];
    
    KYDrawerController *elDrawer = (KYDrawerController*)self.navigationController.parentViewController;
    switch ([newIndexPath row]) {
        case 1:{
            
            UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeVC"];
            UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:viewController];
            navController.navigationBar.hidden=YES;
            elDrawer.mainViewController=navController;
            break;
        }
            
        case 2:{
            UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RatedTherapyVC"];
            UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:viewController];
            navController.navigationBar.hidden=YES;
            elDrawer.mainViewController=navController;
            
            break;
        }
        case 3:{
            UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MoodTrackerVC"];
            UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:viewController];
            navController.navigationBar.hidden=YES;
            elDrawer.mainViewController=navController;
            
            break;
        }
        case 4:{
            UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ProfileVC"];
            UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:viewController];
            navController.navigationBar.hidden=YES;
            elDrawer.mainViewController=navController;
            
            break;
        }
        case 5:{
            //======
            NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
            NSDictionary * dict = [defs dictionaryRepresentation];
            for (id key in dict) {
                [defs removeObjectForKey:key];
            }
            [defs synchronize];
            //======
            UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginVC"];
            UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:viewController];
            navController.navigationBar.hidden=YES;
            elDrawer.mainViewController=navController;
            
            break;
        }


            
        default:{
            break;
        }
    }
    [elDrawer setDrawerState:KYDrawerControllerDrawerStateClosed animated:YES];
}
@end
