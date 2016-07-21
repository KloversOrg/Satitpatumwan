//
//  HomeListCategoryViewController.m
//  Satitpatumwan
//
//  Created by somkid simajarn on 6/8/2559 BE.
//  Copyright © 2559 satitpatumwan.ac.th. All rights reserved.
//

#import "HomeListCategoryViewController.h"
#import "MyWebViewViewController.h"

@interface HomeListCategoryViewController ()

@end

@implementation HomeListCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // NSLog(@"%@", self.data);
    
    // NSArray *keys = [self.data allKeys];
    
    
    // NSLog(@"%@", self.data);
    
    
    
    //    [self.navigationController.navigationBar.translucent = ]
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"ic_bg.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    // transparent top bar
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    [self._table setOpaque:NO];
    [self._table  setBackgroundColor:[UIColor clearColor]];
    self._table.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell =nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"item" forIndexPath:indexPath];
    
    UILabel *text = (UILabel *)[cell viewWithTag:10];
    
    // NSArray *keys = [self.data allKeys];
    [text setText:[[self.data allKeys] objectAtIndex:indexPath.row]];
    
    text.textColor = [UIColor whiteColor];
    
    [cell setBackgroundColor:[UIColor clearColor]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MyWebViewViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"MyWebViewViewController"];
    
    homeViewController.urlString = [[self.data allValues] objectAtIndex:indexPath.row];//@"http://www.satitpatumwan.ac.th/?page_id=2138";
    // homeViewController.title = @"Home";
    // UINavigationController* homeNavController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    
    // [self presentViewController:homeNavController animated:YES completion:nil];
    
    [self.navigationController pushViewController:homeViewController animated:YES];
    
    [self._table reloadData];

}

@end
