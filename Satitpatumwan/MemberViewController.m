//
//  MemberViewController.m
//  Satitpatumwan
//
//  Created by somkid simajarn on 6/8/2559 BE.
//  Copyright © 2559 satitpatumwan.ac.th. All rights reserved.
//

#import "MemberViewController.h"
#import "MyViewController.h"

@interface MemberViewController ()



@end

@implementation MemberViewController{
    int count;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    count = 3;
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
    if (indexPath.row == count) {
        return 80;
    }
    
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //
    UITableViewCell *cell =nil;
    
    /*
    switch (indexPath.row) {
        case 4- indexPath.row:{
            cell = [tableView dequeueReusableCellWithIdentifier:@"item_add" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            break;
        }
            
        default:{
            cell = [tableView dequeueReusableCellWithIdentifier:@"item" forIndexPath:indexPath];
//            UIImageView *ic_image = (UIImageView *)[cell viewWithTag:13];
//            UILabel *text = (UILabel *)[cell viewWithTag:14];
//            
//            switch (indexPath.row) {
//                case 1:
//                    [text setText:@"เกี่ยวกับโรงเรียน"];
//                    break;
//                    
//                case 2:
//                    [text setText:@"ฝ่ายบริหาร"];
//                    break;
//                    
//                case 3:
//                    [text setText:@"กลุ่มสาระการเรียนรู้"];
//                    break;
//                    
//                case 4:
//                    [text setText:@"หน่วยงาน"];
//                    break;
//                    
//                case 5:
//                    [text setText:@"สมาคม"];
//                    break;
//                    
//                case 6:
//                    [text setText:@"ปฏิทินการศึกษา"];
//                    break;
//                    
//                case 7:
//                    [text setText:@"ติดต่อโรงเรียน"];
//                    break;
//                    
//                default:
//                    break;
//            }
            
            break;
        }
            
    }
    */
    
    if (indexPath.row == count) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"item_add" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        
         UIButton *add = (UIButton *)[cell viewWithTag:44];
         
         add.tag = indexPath.row;
         add.userInteractionEnabled = YES;
         [add addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addViewTapped:)]];
        
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"item" forIndexPath:indexPath];
        
        UIImageView *icon = (UIImageView *)[cell viewWithTag:10];
        UILabel *text = (UILabel *)[cell viewWithTag:11];
        
        switch (indexPath.row) {
            case 0:
                [text setText:@"Profile"];
                break;
                
            case 1:
                [text setText:@"Class"];
                
                [icon setImage:[UIImage imageNamed:@"ic_class.png"]];
                break;
                
            case 2:
                [text setText:@"Schedule"];
                
                [icon setImage:[UIImage imageNamed:@"ic_schedule.png"]];
                break;
            default:
                break;
        }
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
            homeViewController.textTitle = @"Profile";
            break;
        case 1:
            homeViewController.textTitle = @"Class";
            break;
        case 2:
            homeViewController.textTitle = @"Schedule";
            break;
        default:
            break;
    }
    
    [self.navigationController pushViewController:homeViewController animated:YES];
    
    [self._table reloadData];
}

- (IBAction)onOpenMail:(id)sender {
    
    NSLog(@"onOpenMail");
    
    UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MyViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"MyViewController"];
    
    homeViewController.textTitle = @"Mail";
    
    [self.navigationController pushViewController:homeViewController animated:YES];
}

-(void)addViewTapped:(UITapGestureRecognizer *)gestureRecognizer{
    NSLog(@"not access tag >%d", [(UIGestureRecognizer *)gestureRecognizer view].tag);
    
    UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MyViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"MyViewController"];
    
    homeViewController.textTitle = @"ADD";
    
    [self.navigationController pushViewController:homeViewController animated:YES];
    
}
@end
