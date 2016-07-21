//
//  MainTabBarController.m
//  Satitpatumwan
//
//  Created by somkid simajarn on 6/8/2559 BE.
//  Copyright © 2559 satitpatumwan.ac.th. All rights reserved.
//

#import "MainTabBarController.h"


#import "HomeViewController.h"
#import "MemberViewController.h"
#import "SettingsViewController.h"
#import "MoreViewController.h"

#import "SWRevealViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

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
    
    self.tabBarController.delegate = self;
    
    UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HomeViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"HomeViewController"];
    homeViewController.title = @"Home";
    homeViewController.tabBarItem.image=[UIImage imageNamed:@"ic_home.png"];
    UINavigationController* homeNavController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    
    
    /*
    MemberViewController *memberViewController =[storybrd instantiateViewControllerWithIdentifier:@"MemberViewController"];
    memberViewController.title = @"Member";
    // เป็นการ add observer tab Heart
    // [tabBarChatWall NotificationCenterAddObserver];
    UINavigationController* memberNavController = [[UINavigationController alloc] initWithRootViewController:memberViewController];
    */
    
    SettingsViewController *settingsViewController =[storybrd instantiateViewControllerWithIdentifier:@"SettingsViewController"];
    settingsViewController.title = @"Settings";
    settingsViewController.tabBarItem.image=[UIImage imageNamed:@"ic_home.png"];
    UINavigationController* setttingsNavController = [[UINavigationController alloc] initWithRootViewController:settingsViewController];
    
    
    MoreViewController *moreViewController =[storybrd instantiateViewControllerWithIdentifier:@"MoreViewController"];
    moreViewController.title = @"More";
    moreViewController.tabBarItem.image=[UIImage imageNamed:@"ic_more.png"];
    UINavigationController* moreNavController = [[UINavigationController alloc] initWithRootViewController:moreViewController];
    
    // UITabBarController* tabBar = [[UITabBarController alloc] init];
    //    [self.tabBarController setViewControllers:[NSArray arrayWithObjects:nav3,nil]];
    //
    //    // [self.navigationController pushViewController:tabBar animated:YES];
    //
    //[self.navigationController pushViewController:self.tabBarController animated:YES];
    
    NSArray *controllers = @[homeNavController, /*memberNavController, setttingsNavController,*/ moreNavController];
    
    // populate our tab bar controller with the above
    
    [self setViewControllers:controllers animated:YES];
    
    // UITabBarItem
//    self.tabBarController
    
//    UIImage *normalImg = [UIImage imageNamed:@"downArrowBlack.png"];
//    UIImage *selectedImg = [UIImage imageNamed:@"upArrowBlack.png"];
    
    // [self.tabBarItem setBackgroundImage:normalImg forState:UIControlStateNormal]; //Normal
    // [self.tabBarItem setBackgroundImage:selectedImg forState:UIControlStateSelected]; //Selected
    

    
    // transparent top bar
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
//                                                  forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
//    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.hidden = YES;
    
    
    /*
     [[UITabBar appearance] setBarTintColor:[UIColor clearColor]];
     [[UITabBar appearance] setBackgroundImage:[UIImage new]];
     */
    // transparent UITabBar
    [[UITabBar appearance] setBarTintColor:[UIColor clearColor]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
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

@end
