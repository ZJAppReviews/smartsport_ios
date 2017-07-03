//
//  leftCollecCell.h
//  football
//
//  Created by 雨停 on 2017/6/28.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^blockBtn) ();
@interface leftCollecCell : UITableViewCell
@property  (nonatomic,strong) blockBtn  blockBtn;
@end
