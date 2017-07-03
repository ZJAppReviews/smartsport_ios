//
//  CollecCoachCell.m
//  football
//
//  Created by 雨停 on 2017/6/28.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "CollecCoachCell.h"

@implementation CollecCoachCell
{
    UIImageView  * photo;
    UILabel      * name;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        photo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height-40)];
        photo.backgroundColor = [UIColor redColor];
        
        photo.image = [UIImage imageNamed:@"cat1.jpeg"];
        photo.contentMode = UIViewContentModeScaleToFill;
        //photo.clipsToBounds = YES;
        [self.contentView addSubview: photo];
        
        name  = [[UILabel alloc]initWithFrame:CGRectMake(0, self.contentView.frame.size.height-30, self.contentView.frame.size.width, 20)];
        name.textAlignment = NSTextAlignmentCenter;
        name.font = [UIFont systemFontOfSize:13];
        name.text = @"教练名";
        [self.contentView addSubview:name];
    }
    return self;
}

@end
