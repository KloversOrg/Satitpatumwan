//
//  SettingsViewController.m
//  Satitpatumwan
//
//  Created by somkid simajarn on 6/8/2559 BE.
//  Copyright © 2559 satitpatumwan.ac.th. All rights reserved.
//

#import "SettingsViewController.h"
#import "MyViewController.h"

#import "NavSettings.h"

#import "SWRevealViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    
    //    [self.navigationController.navigationBar.translucent = ]
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"ic_bg.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
    
    [self._table setOpaque:NO];
    [self._table  setBackgroundColor:[UIColor clearColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell =nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"item" forIndexPath:indexPath];
    
    UILabel *text = (UILabel *)[cell viewWithTag:10];
    
    switch (indexPath.row) {
        case 0:
            [text setText:@"Privacy Policy"];
            break;
        case 1:
            [text setText:@"Terms of Service"];
            break;
        case 2:
            [text setText:@"Logout"];
            break;
        default:
            break;
    }
    
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MyViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"MyViewController"];
    
    // homeViewController.urlString = @"https://www.facebook.com/samosornpatumwan";
    // homeViewController.title = @"Home";
    // UINavigationController* homeNavController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    
    // [self presentViewController:homeNavController animated:YES completion:nil];
    
    switch (indexPath.row) {
        case 0:
            homeViewController.textTitle = @"Privacy Policy";
            [self.navigationController pushViewController:homeViewController animated:YES];
            break;
        case 1:
            homeViewController.textTitle = @"Terms of Service";
            [self.navigationController pushViewController:homeViewController animated:YES];
            break;
        case 2:{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Logout"
                                                                message:@"Are you sure you want to logout?"
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:@"Cancel", nil];
            alertView.tag=0;
            [alertView show];
            break;
        }
        default:
            break;
    }
    
    
    [self._table reloadData];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView.tag==0){
        if(buttonIndex == 0)//OK button pressed
        {
            //do something
            UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            NavSettings *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"NavSettings"];
            
            // homeViewController.urlString = @"https://www.facebook.com/samosornpatumwan";
            // homeViewController.title = @"Home";
            // UINavigationController* homeNavController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
            
            [self presentViewController:homeViewController animated:YES completion:nil];

        }
        else if(buttonIndex == 1)//Annul button pressed.
        {
            //do something
        }
    }
}

@end
