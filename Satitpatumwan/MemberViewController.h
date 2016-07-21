//
//  MemberViewController.h
//  Satitpatumwan
//
//  Created by somkid simajarn on 6/8/2559 BE.
//  Copyright © 2559 satitpatumwan.ac.th. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *_table;
- (IBAction)onOpenMail:(id)sender;

@end
