//
//  leftStarCell.h
//  football
//
//  Created by 雨停 on 2017/6/28.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^BlockType)();
@interface leftStarCell : UITableViewCell
@property (nonatomic,copy)BlockType block;
@end
