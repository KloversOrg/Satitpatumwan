//
//  HomeListCategoryViewController.h
//  Satitpatumwan
//
//  Created by somkid simajarn on 6/8/2559 BE.
//  Copyright © 2559 satitpatumwan.ac.th. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeListCategoryViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *_table;

@property(nonatomic)NSDictionary *data;


@end
