//
//  SelectTypeUserViewController.m
//  Satitpatumwan
//
//  Created by somkid simajarn on 6/8/2559 BE.
//  Copyright © 2559 satitpatumwan.ac.th. All rights reserved.
//

#import "SelectTypeUserViewController.h"
#import "LoginViewController.h"

@interface SelectTypeUserViewController ()

@end

@implementation SelectTypeUserViewController{
    NSArray * data;// = @[@"Mercedes-Benz", @"BMW", @"Porsche", @"Opel", @"Volkswagen", @"Audi"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    data = @[@"Students", @"Teacher", @"Parents", @"Staff"];
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
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell =nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"item" forIndexPath:indexPath];
    
    UILabel *text = (UILabel *)[cell viewWithTag:10];
    [text setText:[data objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LoginViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    // homeViewController.urlString = @"https://www.facebook.com/samosornpatumwan";
    // homeViewController.title = @"Home";
    // UINavigationController* homeNavController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    
    // [self presentViewController:homeNavController animated:YES completion:nil];
    
    // homeViewController.textTitle = @"Tutorial";
    [self.navigationController pushViewController:homeViewController animated:YES];
    
    [self._table reloadData];
}

@end
