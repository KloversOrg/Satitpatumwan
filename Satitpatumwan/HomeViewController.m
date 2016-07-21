//
//  HomeViewController.m
//  Satitpatumwan
//
//  Created by somkid simajarn on 6/8/2559 BE.
//  Copyright © 2559 satitpatumwan.ac.th. All rights reserved.
//

#import "HomeViewController.h"

#import "MyWebViewViewController.h"
#import "HomeListCategoryViewController.h"
#import "MemberViewController.h"

#import "SWRevealViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    
    
    // transparent top bar
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
    switch (indexPath.row) {
        case 0:
            return 130;
        case 1:
            return 55;
        default:
            break;
    }
    
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell =nil;
    
    switch (indexPath.row) {
        case 0:{
            cell = [tableView dequeueReusableCellWithIdentifier:@"headerLogo" forIndexPath:indexPath];
            
            //imageView.contentMode = UIViewContentModeScaleAspectFit;
            // cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"ic_map.png.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
            
//            UIImageView *UImageV =[[UIImageView alloc] initWithImage: [UIImage imageNamed:@"ic_map.png"]];
//            UImageV.contentMode = UIViewContentModeScaleAspectFill;
//            
//            cell.backgroundView =UImageV;
            cell.backgroundColor = [UIColor colorWithRed:0.03 green:0.09 blue:0.24 alpha:1.0];
            
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            break;
        }
        case 1:{
            cell = [tableView dequeueReusableCellWithIdentifier:@"social" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:0.3];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            UIButton *facebook = (UIButton *)[cell viewWithTag:10];
            UIButton *gplus = (UIButton *)[cell viewWithTag:11];
            UIButton *www = (UIButton *)[cell viewWithTag:12];
            UIButton *member = (UIButton *)[cell viewWithTag:13];
            
            facebook.tag = indexPath.row;
            facebook.userInteractionEnabled = YES;
            [facebook addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(facebookViewTapped:)]];
            
            
            gplus.tag = indexPath.row;
            gplus.userInteractionEnabled = YES;
            [gplus addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gplusViewTapped:)]];
            
            www.tag = indexPath.row;
            www.userInteractionEnabled = YES;
            [www addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wwwViewTapped:)]];
            
            member.tag = indexPath.row;
            member.userInteractionEnabled = YES;
            [member addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(memberViewTapped:)]];
            
            break;
        }
            
//        case 1:{
//            cell = [tableView dequeueReusableCellWithIdentifier:@"item" forIndexPath:indexPath];
//            UIImageView *ic_image = (UIImageView *)[cell viewWithTag:13];
//            UILabel *text = (UILabel *)[cell viewWithTag:14];
//            break;
//        }
            
        default:{
            cell = [tableView dequeueReusableCellWithIdentifier:@"item" forIndexPath:indexPath];
            
            [cell setBackgroundColor:[UIColor clearColor]];
            
            // UIImageView *ic_image = (UIImageView *)[cell viewWithTag:13];
            UILabel *text = (UILabel *)[cell viewWithTag:14];
            text.textColor = [UIColor whiteColor];
            
            switch (indexPath.row) {
                case 2:
                    [text setText:@"ประมวลภาพกิจกรรม"];
                    break;
                    
                case 3:
                    [text setText:@"ข่าวประชาสัมพันธ์"];
                    break;
                    
                case 4:
                    [text setText:@"ประกาศจัดซื้อจัดจ้าง"];
                    break;
                    
                case 5:
                    [text setText:@"ประกาศรับสมัครงาน"];
                    break;
                    
                case 6:
                    [text setText:@"จดหมายผู้ปกครอง"];
                    break;
                    
                case 7:
                    [text setText:@"เว็บไซต์บริการข้อมูลภายใน (PDS Service)"];
                    break;
                    
                case 8:
                    [text setText:@"เว็บไซต์ที่เกี่ยวข้องภายใน มศว"];
                    break;
                    
                default:
                    break;
            }
            
            
            break;
        }

    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.google.co.th/maps/place/Patumwan+Demonstration+School/@13.740196,100.5342084,15z/data=!4m5!3m4!1s0x0:0xfcbddfe1118e27c6!8m2!3d13.740196!4d100.5342084"]];
    }else{
        switch (indexPath.row) {
            case 2:{
                //เกี่ยวกับโรงเรียน
                // -ข้อมูลทั่วไป : http://www.satitpatumwan.ac.th/?page_id=2157
                // -ประวัติความเป็นมา : http://www.satitpatumwan.ac.th/?page_id=2152
                // -ปรัชญา / วิสัยทัศน์ / พันธกิจ : http://www.satitpatumwan.ac.th/?page_id=2068
                // -เกียรติภูมิสาธิตปทุมวัน  : http://www.satitpatumwan.ac.th/?page_id=2115
                // -แผนที่และอาคารเรียน  : http://www.satitpatumwan.ac.th/?page_id=2194
                // -คณะกรรมการบริหารโรงเรียน : http://www.satitpatumwan.ac.th/?page_id=2204

                NSDictionary *data = @{
                                            @"ผลการแข่งขันคณิตศาสตร์โลก" : @"http://www.satitpatumwan.ac.th/?p=8068",
                                            @"ผลการแข่งขันคณิตศาสตร์โอลิมปิกระหว่างประเทศ" : @"http://www.satitpatumwan.ac.th/?p=8064",
                                            @"ประมวลภาพแห่เทียนพรรษา" : @"http://www.satitpatumwan.ac.th/?p=8059",
                                            @"บันทึกเทปโทรทัศน์ถวายพระพร" : @"http://www.satitpatumwan.ac.th/?p=8059",
                                            @"ประมวลภาพการรับรางวัลไหว้ครู" : @"http://www.satitpatumwan.ac.th/?p=8059",
                                            @"ประมวลภาพลงนามถวายพระพร" : @"http://www.satitpatumwan.ac.th/?p=8059",
                                            @"ประมวลภาพชมรมจิตอาสาป้องกันเอดส์" : @"http://www.satitpatumwan.ac.th/?p=8059",
                                            @"ประมวลภาพกิจกรรมวันสุนทรภู่" : @"http://www.satitpatumwan.ac.th/?p=8059",
                                            @"ประมวลภาพพิธีไหว้ครู" : @"http://www.satitpatumwan.ac.th/?p=8059",
                                            @"พิธีแสดงตนเป็นพุธมามะกะ" : @"http://www.satitpatumwan.ac.th/?p=8059",
                                            };
                
                //
                
                UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                HomeListCategoryViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"HomeListCategoryViewController"];
                homeViewController.data = data;
                
                [self.navigationController pushViewController:homeViewController animated:YES];
                break;
            }
                
            case 3:{
                //ฝ่ายบริหาร
                // -ฝ่ายวิชาการ : http://www.satitpatumwan.ac.th/?page_id=3030
                // -ฝ่ายบริหารและธุรการ  : http://www.satitpatumwan.ac.th/?page_id=2947
                // -ฝ่ายปกครอง : http://discipline.satitpatumwan.ac.th
                // -ฝ่ายบริการ  : http://www.satitpatumwan.ac.th/?page_id=2970
                // -ฝ่ายแผน ประกันคุณภาพ และเทคโนโลยีสารสนเทศ  : http://www.satitpatumwan.ac.th/?page_id=2981
                // -ฝ่ายกิจการนักเรียน  : http://www.satitpatumwan.ac.th/?page_id=2
                // -ฝ่ายฝึกประสบการณ์วิชาชีพครู : http://www.satitpatumwan.ac.th/?page_id=2995
                // -โครงการส่งเสริมวัฒนธรรม และศิลปะ : http://www.satitpatumwan.ac.th/?page_id=3001
                // -โครงการภาคภาษาอังกฤษ (EPTS) : http://www.epts.satitpatumwan.ac.th

                NSDictionary *data = @{
                                       @"ฝ่ายวิชาการ" : @"http://www.satitpatumwan.ac.th/?page_id=3030",
                                       @"ฝ่ายบริหารและธุรการ" : @"http://www.satitpatumwan.ac.th/?page_id=2947",
                                       @"ฝ่ายปกครอง" : @"http://discipline.satitpatumwan.ac.th",
                                       @"ฝ่ายบริการ" : @"http://www.satitpatumwan.ac.th/?page_id=2970",
                                       @"ฝ่ายแผน ประกันคุณภาพ และเทคโนโลยีสารสนเทศ" : @"hhttp://www.satitpatumwan.ac.th/?page_id=2981",
                                       @"ฝ่ายกิจการนักเรียน" : @"http://www.satitpatumwan.ac.th/?page_id=2",
                                       @"ฝ่ายฝึกประสบการณ์วิชาชีพครู" : @"http://www.satitpatumwan.ac.th/?page_id=2995",
                                       @"โครงการส่งเสริมวัฒนธรรม และศิลปะ" : @"http://www.satitpatumwan.ac.th/?page_id=3001",
                                       @"โครงการภาคภาษาอังกฤษ (EPTS)" : @"http://www.epts.satitpatumwan.ac.th",
                                       };
                
                UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                HomeListCategoryViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"HomeListCategoryViewController"];
                homeViewController.data = data;
                
                [self.navigationController pushViewController:homeViewController animated:YES];
                break;
            }
                
            case 4:{
                //กลุ่มสาระการเรียนรู้
                // - คณิตศาสตร์ : http://mathematics.satitpatumwan.ac.th
                // - วิทยาศาสตร์ : http://science.satitpatumwan.ac.th
                // - สังคม ศาสนา และวัฒนธรรม : http://social.satitpatumwan.ac.th
                // - ภาษาไทย :  http://thai.satitpatumwan.ac.th
                // - ภาษาต่างประเทศ : https://sites.google.com/site/pdsforeignlanguagedepartment/
                // - ศิลปะ :  http://art.pds
                // - การงานอาชีพและเทคโนโลยี : http://computer.satitpatumwan.ac.th
                // - สุขศึกษาและพลศึกษา  :  http://physedu.satitpatumwan.ac.th
                // - กิจกรรมพัฒนาผู้เรียน  :  http://stdactivities.satitpatumwan.ac.th
                
                NSDictionary *data = @{
                                       @"คณิตศาสตร์" : @"http://mathematics.satitpatumwan.ac.th",
                                       @"วิทยาศาสตร์" : @"http://science.satitpatumwan.ac.th",
                                       @"สังคม ศาสนา และวัฒนธรรม" : @"http://social.satitpatumwan.ac.th",
                                       @"ภาษาไทย" : @"ttp://thai.satitpatumwan.ac.th",
                                       @"ภาษาต่างประเทศ" : @"https://sites.google.com/site/pdsforeignlanguagedepartment/",
                                       @"ศิลปะ" : @"http://art.pds",
                                       @"การงานอาชีพและเทคโนโลยี" : @"http://computer.satitpatumwan.ac.th",
                                       @"สุขศึกษาและพลศึกษา" : @"http://physedu.satitpatumwan.ac.th",
                                       @"กิจกรรมพัฒนาผู้เรียน" : @"http://stdactivities.satitpatumwan.ac.th",
                                       };
                
                UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                HomeListCategoryViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"HomeListCategoryViewController"];
                homeViewController.data = data;
                
                [self.navigationController pushViewController:homeViewController animated:YES];
                
                break;
            }
                
            case 5:{
                //หน่วยงาน
             
                NSDictionary *data = @{
                                       @"สำนักงานบริการการศึกษา (ทะเบียน)" : @"http://pds-reg.satitpatumwan.ac.th",
                                       @"งานแนะแนว" : @"http://stdactivities.satitpatumwan.ac.th/Guidance/default.htm",
                                       @"งานนักศึกษาวิชาทหาร" : @"http://ruksadindan.satitpatumwan.ac.th",
                                       @"สระว่ายน้ำสาธิตปทุมวัน" : @"http://www.satitpatumwan.ac.th/swimmingpool/swim.html",
                                       @"สโมสรอาจารย์และเจ้าหน้าที่" : @"http://www.facebook.com/samosornpatumwan",
                                       };
                
                UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                HomeListCategoryViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"HomeListCategoryViewController"];
                homeViewController.data = data;
                
                [self.navigationController pushViewController:homeViewController animated:YES];
                
                break;
            }
                
            case 6:{
                //สมาคม
               
                NSDictionary *data = @{
                                       @"สมาคมผู้ปกครองและครู" : @"http://pta-satitpatumwan.com",
                                       @"สมาคมศิษย์เก่า" : @"http://www.alumnisatitpatumwan.org",
                                       };
                
                UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                HomeListCategoryViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"HomeListCategoryViewController"];
                homeViewController.data = data;
                
                [self.navigationController pushViewController:homeViewController animated:YES];

                break;
            }
                
            case 7:{
                // ปฏิทินการศึกษา
                //
                
                
                UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                MyWebViewViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"MyWebViewViewController"];
                
                homeViewController.urlString = @"http://www.satitpatumwan.ac.th/?page_id=2138";
                // homeViewController.title = @"Home";
                // UINavigationController* homeNavController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
                
                // [self presentViewController:homeNavController animated:YES completion:nil];
                
                [self.navigationController pushViewController:homeViewController animated:YES];
                break;
            }
                
            case 8:{
                // ติดต่อโรงเรียน
                //
                
                
                UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                MyWebViewViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"MyWebViewViewController"];
                
                homeViewController.urlString = @"http://www.satitpatumwan.ac.th/?page_id=100";
                // homeViewController.title = @"Home";
                // UINavigationController* homeNavController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
                
                // [self presentViewController:homeNavController animated:YES completion:nil];
                
                [self.navigationController pushViewController:homeViewController animated:YES];

                break;
            }
                
            default:
                break;
        }
        
        [self._table reloadData];
    }
}

-(void)facebookViewTapped:(UITapGestureRecognizer *)gestureRecognizer{
    NSLog(@"not access tag >%d", [(UIGestureRecognizer *)gestureRecognizer view].tag);
    
    UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MyWebViewViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"MyWebViewViewController"];
    
    homeViewController.urlString = @"https://www.facebook.com/samosornpatumwan";
    // homeViewController.title = @"Home";
    // UINavigationController* homeNavController = [[UINavigationController alloc] initWithRootViewController:homeViewController];

    // [self presentViewController:homeNavController animated:YES completion:nil];
    
    [self.navigationController pushViewController:homeViewController animated:YES];
    
}

-(void)gplusViewTapped:(UITapGestureRecognizer *)gestureRecognizer{
    NSLog(@"not access tag >%d", [(UIGestureRecognizer *)gestureRecognizer view].tag);
    
    UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MyWebViewViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"MyWebViewViewController"];
    
    homeViewController.urlString = @"https://plus.google.com/111809891029576965143";
    // homeViewController.title = @"Home";
    // UINavigationController* homeNavController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    
    // [self presentViewController:homeNavController animated:YES completion:nil];
    
    [self.navigationController pushViewController:homeViewController animated:YES];
}

-(void)wwwViewTapped:(UITapGestureRecognizer *)gestureRecognizer{
    NSLog(@"not access tag >%d", [(UIGestureRecognizer *)gestureRecognizer view].tag);
    
    UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MyWebViewViewController *homeViewController =[storybrd instantiateViewControllerWithIdentifier:@"MyWebViewViewController"];
    
    homeViewController.urlString = @"http://www.satitpatumwan.ac.th";
    // homeViewController.title = @"Home";
    // UINavigationController* homeNavController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    
    // [self presentViewController:homeNavController animated:YES completion:nil];
    
    [self.navigationController pushViewController:homeViewController animated:YES];
}

-(void)memberViewTapped:(UITapGestureRecognizer *)gestureRecognizer{
    NSLog(@"");
    
    UIStoryboard *storybrd = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    MemberViewController *memberViewController =[storybrd instantiateViewControllerWithIdentifier:@"MemberViewController"];
    // memberViewController.title = @"Member";
    [self.navigationController pushViewController:memberViewController animated:YES];
    
}

@end
