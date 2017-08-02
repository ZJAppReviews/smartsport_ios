//
//  homePersonCell.h
//  football
//
//  Created by 雨停 on 2017/7/27.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "membersModel.h"
@interface homePersonCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *team;
@property  (nonatomic,strong)membersModel   * model;
@end
