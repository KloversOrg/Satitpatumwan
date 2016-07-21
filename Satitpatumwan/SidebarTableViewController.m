//
//  SidebarTableViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "SidebarTableViewController.h"
#import "SWRevealViewController.h"
#import "LoginViewController.h"

@interface SidebarTableViewController (){
    NSMutableArray      *sectionTitleArray;
    NSMutableDictionary *sectionContentDict;
    NSMutableArray      *arrayForBool;
}
@end

@implementation SidebarTableViewController {
    NSArray *menuItems;
}

/*

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menuItems = @[@"HOME", @"INFO", @"MANAGENMENT" , @"DEPARTMENT", @"AGENCIES", @"EDUCLUB", @"CALENDAR" , @"CONTACT"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return menuItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = [menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"%d", indexPath.row); // you can see selected row number in your console;
//    
//    if ([indexPath row] == 2) {
//        NSLog(@"->");
//        
//        
//        
//        
////        NSString *query = @"select _name from tbl_user";
////        
////        NSArray *arrData = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
//        
////        
////        if ([[arrData objectAtIndex:0][0] isEqualToString:myConfig.username_annonymous]  ||  [[arrData objectAtIndex:0][0] isEqualToString:@"(null)"]) {
////
////            NSString *query = @"select _sessid, _session_name, _token from tbl_user LIMIT 1";
//        
//
//            
////            NSArray *_user = [[[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]] objectAtIndex:0];
////            
////            NSLog(@"");
////            
////            
////            // NSURL *aUrl = [NSURL URLWithString:@"http://gotuktuk.net/rest/user/logout"];
////            NSURL *aUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@", myConfig.URL, myConfig.endpoint, @"user/logout"]];
////            
////            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:aUrl
////                                                                   cachePolicy:NSURLRequestUseProtocolCachePolicy
////                                                               timeoutInterval:30.0];
////            [request setHTTPMethod:@"POST"];
////            // [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
////            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
////            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
////            
////
////             httppost.setHeader("X-CSRF-Token", pTokenLogin);
////             httppost.setHeader("Cookie", pSessionName + "=" + pSessionId);
////
////            
////            // Create a mutable copy of the immutable request and add more headers
////            //    NSMutableURLRequest *mutableRequest = [request mutableCopy];
////            [request setValue:[_user objectAtIndex:2] forHTTPHeaderField:@"X-CSRF-Token"];
////            [request setValue:[NSString stringWithFormat:@"%@=%@", [_user objectAtIndex:1], [_user objectAtIndex:0]] forHTTPHeaderField:@"Cookie"];
////            
////            // Now set our request variable with an (immutable) copy of the altered request
////            // request = [mutableRequest copy];
////            
////            
////            // [request setHTTPBody:postData];
////            
////            // NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
////            
////            if(connection)
////            {
////                [connection cancel];
////                connection = nil;
////                self.data = nil;
////            }
////            
////            if (!connection) {
////                
////                connection= [[NSURLConnection alloc] initWithRequest:request delegate:self];
////                
////                self.data = [NSMutableData data];
////            }else{
////            }
////            
////        }else{
////            
//            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
//            
//            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
//            
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Logout" message:@"Confirm Logout." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
//        
//            alertView.tag = -999;
//            [alertView show];
////
////        }
//    }
//}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    switch (alertView.tag) {
        case -999:
            if (buttonIndex == 0)
            {
                NSLog(@"ยกเลิก");
            }
            else
            {
                NSLog(@"ตกลง");
//                // [self dismissModalViewControllerAnimated:YES];
//                LoginViewController *login = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
//                login.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//                [self.presentingViewController presentModalViewController:login animated:YES];
                
                LoginViewController *mtc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
                [self presentViewController:mtc animated:YES completion:nil];

            }
            
            break;
            
        default:
            break;
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[menuItems objectAtIndex:indexPath.row] capitalizedString];
    
    // Set the photo if it navigates to the PhotoView
//    if ([segue.identifier isEqualToString:@"showPhoto"]) {
//        UINavigationController *navController = segue.destinationViewController;
//        PhotoViewController *photoController = [navController childViewControllers].firstObject;
//        NSString *photoFilename = [NSString stringWithFormat:@"%@_photo", [menuItems objectAtIndex:indexPath.row]];
//        photoController.photoFilename = photoFilename;
//    }
}
*/


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView setOpaque:NO];
    [self.tableView  setBackgroundColor:[UIColor clearColor]];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"ic_bg.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    if (!sectionTitleArray) {
        sectionTitleArray = [NSMutableArray arrayWithObjects:@"หน้าหลัก", @"เกี่ยวกับโรงเรียน", @"ฝ่ายบริหาร", @"กลุ่มสาระการเรียนรู้", @"หน่วยงาน", @"สมาคม", @"ปฏิทินการศึกษา", @"ติดต่อโรงเรียน",nil];
    }
    if (!arrayForBool) {
        arrayForBool    = [NSMutableArray arrayWithObjects:
                           [NSNumber numberWithBool:NO],
                           [NSNumber numberWithBool:NO],
                           [NSNumber numberWithBool:NO],
                           [NSNumber numberWithBool:NO],
                           [NSNumber numberWithBool:NO] ,
                           [NSNumber numberWithBool:NO] ,
                           [NSNumber numberWithBool:NO] ,
                           [NSNumber numberWithBool:NO] ,nil];
    }
    if (!sectionContentDict) {
        sectionContentDict  = [[NSMutableDictionary alloc] init];
        NSArray *array1     = [NSArray arrayWithObjects:nil];
        [sectionContentDict setValue:array1 forKey:[sectionTitleArray objectAtIndex:0]];
        /*
         @"ข้อมูลทั่วไป" : @"http://www.satitpatumwan.ac.th/?page_id=2157",
         @"ประวัติความเป็นมา" : @"http://www.satitpatumwan.ac.th/?page_id=2152",
         @"ปรัชญา/วิสัยทัศน์/พันธกิจ" : @"http://www.satitpatumwan.ac.th/?page_id=2068",
         @"เกียรติภูมิสาธิตปทุมวัน" : @"http://www.satitpatumwan.ac.th/?page_id=2115",
         @"แผนที่และอาคารเรียน" : @"http://www.satitpatumwan.ac.th/?page_id=2194",
         @"คณะกรรมการบริหารโรงเรียน" : @"http://www.satitpatumwan.ac.th/?page_id=2204",
         */
        NSArray *array2     = [NSArray arrayWithObjects:@"ข้อมูลทั่วไป", @"ประวัติความเป็นมา", @"ปรัชญา/วิสัยทัศน์/พันธกิจ", @"เกียรติภูมิสาธิตปทุมวัน",   @"แผนที่และอาคารเรียน", @"คณะกรรมการบริหารโรงเรียน",  nil];
        
        /*
         @"ฝ่ายวิชาการ" : @"http://www.satitpatumwan.ac.th/?page_id=3030",
         @"ฝ่ายบริหารและธุรการ" : @"http://www.satitpatumwan.ac.th/?page_id=2947",
         @"ฝ่ายปกครอง" : @"http://discipline.satitpatumwan.ac.th",
         @"ฝ่ายบริการ" : @"http://www.satitpatumwan.ac.th/?page_id=2970",
         @"ฝ่ายแผน ประกันคุณภาพ และเทคโนโลยีสารสนเทศ" : @"hhttp://www.satitpatumwan.ac.th/?page_id=2981",
         @"ฝ่ายกิจการนักเรียน" : @"http://www.satitpatumwan.ac.th/?page_id=2",
         @"ฝ่ายฝึกประสบการณ์วิชาชีพครู" : @"http://www.satitpatumwan.ac.th/?page_id=2995",
         @"โครงการส่งเสริมวัฒนธรรม และศิลปะ" : @"http://www.satitpatumwan.ac.th/?page_id=3001",
         @"โครงการภาคภาษาอังกฤษ (EPTS)" : @"http://www.epts.satitpatumwan.ac.th",
         */
        [sectionContentDict setValue:array2 forKey:[sectionTitleArray objectAtIndex:1]];
        NSArray *array3     = [NSArray arrayWithObjects:@"ฝ่ายวิชาการ", @"ฝ่ายบริหารและธุรการ", @"ฝ่ายปกครอง", @"ฝ่ายบริการ", @"ฝ่ายแผน ประกันคุณภาพ และเทคโนโลยีสารสนเทศ", @"ฝ่ายกิจการนักเรียน", @"ฝ่ายฝึกประสบการณ์วิชาชีพครู", @"โครงการส่งเสริมวัฒนธรรม และศิลปะ", @"โครงการภาคภาษาอังกฤษ (EPTS)",  nil];
        [sectionContentDict setValue:array3 forKey:[sectionTitleArray objectAtIndex:2]];
        
        /*
         @"คณิตศาสตร์" : @"http://mathematics.satitpatumwan.ac.th",
         @"วิทยาศาสตร์" : @"http://science.satitpatumwan.ac.th",
         @"สังคม ศาสนา และวัฒนธรรม" : @"http://social.satitpatumwan.ac.th",
         @"ภาษาไทย" : @"ttp://thai.satitpatumwan.ac.th",
         @"ภาษาต่างประเทศ" : @"https://sites.google.com/site/pdsforeignlanguagedepartment/",
         @"ศิลปะ" : @"http://art.pds",
         @"การงานอาชีพและเทคโนโลยี" : @"http://computer.satitpatumwan.ac.th",
         @"สุขศึกษาและพลศึกษา" : @"http://physedu.satitpatumwan.ac.th",
         @"กิจกรรมพัฒนาผู้เรียน" : @"http://stdactivities.satitpatumwan.ac.th",
         */
        NSArray *array4     = [NSArray arrayWithObjects:@"คณิตศาสตร์", @"วิทยาศาสตร์", @"สังคม ศาสนา และวัฒนธรรม", @"ภาษาไทย", @"ภาษาต่างประเทศ", @"ศิลปะ", @"การงานอาชีพและเทคโนโลยี", @"สุขศึกษาและพลศึกษา", @"กิจกรรมพัฒนาผู้เรียน",  nil];
        [sectionContentDict setValue:array4 forKey:[sectionTitleArray objectAtIndex:3]];
        
        /*
         @"สำนักงานบริการการศึกษา (ทะเบียน)" : @"http://pds-reg.satitpatumwan.ac.th",
         @"งานแนะแนว" : @"http://stdactivities.satitpatumwan.ac.th/Guidance/default.htm",
         @"งานนักศึกษาวิชาทหาร" : @"http://ruksadindan.satitpatumwan.ac.th",
         @"สระว่ายน้ำสาธิตปทุมวัน" : @"http://www.satitpatumwan.ac.th/swimmingpool/swim.html",
         @"สโมสรอาจารย์และเจ้าหน้าที่" : @"http://www.facebook.com/samosornpatumwan",
         */
        
        NSArray *array5     = [NSArray arrayWithObjects:@"สำนักงานบริการการศึกษา (ทะเบียน)", @"งานแนะแนว", @"งานนักศึกษาวิชาทหาร", @"สระว่ายน้ำสาธิตปทุมวัน", @"สโมสรอาจารย์และเจ้าหน้าที่",  nil];
        [sectionContentDict setValue:array5 forKey:[sectionTitleArray objectAtIndex:4]];
        
        
        /*
         @"สมาคมผู้ปกครองและครู" : @"http://pta-satitpatumwan.com",
         @"สมาคมศิษย์เก่า" : @"http://www.alumnisatitpatumwan.org",
         */
        NSArray *array6     = [NSArray arrayWithObjects:@"สมาคมผู้ปกครองและครู", @"สมาคมศิษย์เก่า", nil];
        [sectionContentDict setValue:array6 forKey:[sectionTitleArray objectAtIndex:5]];
        
        NSArray *array7     = [NSArray arrayWithObjects:nil];
        [sectionContentDict setValue:array7 forKey:[sectionTitleArray objectAtIndex:6]];
        
        NSArray *array8     = [NSArray arrayWithObjects:nil];
        [sectionContentDict setValue:array8 forKey:[sectionTitleArray objectAtIndex:7]];
    }
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [sectionTitleArray count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([[arrayForBool objectAtIndex:section] boolValue]) {
        return [[sectionContentDict valueForKey:[sectionTitleArray objectAtIndex:section]] count];
    }
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView              = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    headerView.tag                  = section;
    headerView.backgroundColor      = [UIColor whiteColor];
    UILabel *headerString           = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-20-50, 50)];
    BOOL manyCells                  = [[arrayForBool objectAtIndex:section] boolValue];
   
    headerString.text = [sectionTitleArray objectAtIndex:section];
    
    headerString.textAlignment      = NSTextAlignmentLeft;
    headerString.textColor          = [UIColor whiteColor];
    [headerView addSubview:headerString];
    
    UITapGestureRecognizer  *headerTapped   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderTapped:)];
    [headerView addGestureRecognizer:headerTapped];
    
    //up or down arrow depending on the bool
    if ([[sectionContentDict valueForKey:[sectionTitleArray objectAtIndex:section]] count] > 0) {
        
//        if (!manyCells) {
//            headerString.text = @"click to enlarge";
//        }else{
//            headerString.text = @"click again to reduce";
//        }
//        headerString.textAlignment      = NSTextAlignmentLeft;
//        headerString.textColor          = [UIColor blackColor];
//        [headerView addSubview:headerString];
//        
//        UITapGestureRecognizer  *headerTapped   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderTapped:)];
//        [headerView addGestureRecognizer:headerTapped];
        
        UIImageView *upDownArrow        = [[UIImageView alloc] initWithImage:manyCells ? [UIImage imageNamed:@"upArrowBlack"] : [UIImage imageNamed:@"downArrowBlack"]];
        upDownArrow.autoresizingMask    = UIViewAutoresizingFlexibleLeftMargin;
        upDownArrow.frame               = CGRectMake(self.view.frame.size.width-100, 10, 30, 30);
        [headerView addSubview:upDownArrow];
    }else{
        
        // NAV_INDEX
        
        
        

    }
   
    [headerView setBackgroundColor:[UIColor clearColor]];
    return headerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footer  = [[UIView alloc] initWithFrame:CGRectZero];
    return footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[arrayForBool objectAtIndex:indexPath.section] boolValue]) {
        return 50;
    }
    return 0;
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    BOOL manyCells  = [[arrayForBool objectAtIndex:indexPath.section] boolValue];
    if (!manyCells) {
        cell.textLabel.hidden = YES;
    }
    else{
        NSArray *content = [sectionContentDict valueForKey:[sectionTitleArray objectAtIndex:indexPath.section]];
        cell.textLabel.text = [content objectAtIndex:indexPath.row];
        cell.textLabel.textColor = [UIColor whiteColor];
        
        cell.textLabel.hidden = NO;
    }
    
    [cell setBackgroundColor:[UIColor clearColor]];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
//    DetailViewController *dvc;
//    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
//        dvc = [[DetailViewController alloc] initWithNibName:@"DetailViewController_iPhone"  bundle:[NSBundle mainBundle]];
//    }else{
//        dvc = [[DetailViewController alloc] initWithNibName:@"DetailViewController_iPad"  bundle:[NSBundle mainBundle]];
//    }
//    dvc.title        = [sectionTitleArray objectAtIndex:indexPath.section];
//    dvc.detailItem   = [[sectionContentDict valueForKey:[sectionTitleArray objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
//    [self.navigationController pushViewController:dvc animated:YES];
    
    
//    UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
//    //
//    [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
    
    /*
     NAV_t
     */
    
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
//                                                             bundle: nil];
//
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *controller = (UINavigationController*)[storyboard
                                                                   instantiateViewControllerWithIdentifier: @"NAV_t"];
//    [self presentViewController:controller animated:YES completion:nil];
    

//    SecondViewController *rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
//    
//    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
//    [navController setViewControllers: @[rootViewController] animated: YES];
    
    
    [self.revealViewController setFrontViewController:controller];
    [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
}


#pragma mark - gesture tapped
- (void)sectionHeaderTapped:(UITapGestureRecognizer *)gestureRecognizer{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:gestureRecognizer.view.tag];
    if (indexPath.row == 0) {
        BOOL collapsed  = [[arrayForBool objectAtIndex:indexPath.section] boolValue];
        collapsed       = !collapsed;
        [arrayForBool replaceObjectAtIndex:indexPath.section withObject:[NSNumber numberWithBool:collapsed]];
        
        //reload specific section animated
        NSRange range   = NSMakeRange(indexPath.section, 1);
        NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.tableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationFade];
    }
    
    NSLog(@"%d", gestureRecognizer.view.tag);
    if (gestureRecognizer.view.tag == 0) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UINavigationController *controller = (UINavigationController*)[storyboard
                                                                           instantiateViewControllerWithIdentifier: @"NAV_INDEX"];
            [self.revealViewController setFrontViewController:controller];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
    }else if(gestureRecognizer.view.tag == 6)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UINavigationController *controller = (UINavigationController*)[storyboard
                                                                       instantiateViewControllerWithIdentifier: @"NAV_t"];
        [self.revealViewController setFrontViewController:controller];
        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
    }else if(gestureRecognizer.view.tag == 7)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UINavigationController *controller = (UINavigationController*)[storyboard
                                                                       instantiateViewControllerWithIdentifier: @"NAV_t"];
        [self.revealViewController setFrontViewController:controller];
        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        
    }

}


@end
