//
//  LoginViewController.m
//  Satitpatumwan
//
//  Created by somkid simajarn on 6/8/2559 BE.
//  Copyright © 2559 satitpatumwan.ac.th. All rights reserved.
//

#import "LoginViewController.h"
#import "MainTabBarController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)onLogin:(id)sender {
    
    UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MainTabBarController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"MainTabBarController"];
    
    // homeViewController.urlString = @"https://www.facebook.com/samosornpatumwan";
    // homeViewController.title = @"Home";
    // UINavigationController* homeNavController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    
    [self presentViewController:homeViewController animated:YES completion:nil];
    
    // homeViewController.textTitle = @"Tutorial";
    // [self.navigationController pushViewController:homeViewController animated:YES];
}
@end
