//
//  leftCollecStarCell.m
//  football
//
//  Created by 雨停 on 2017/6/28.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "leftCollecStarCell.h"
#import "XYUIKit.h"
@implementation leftCollecStarCell
{
    UIImageView  * photo;
    UILabel      * tag;
    UILabel      * name;
    UILabel      * team;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        photo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height-60)];
        photo.layer.cornerRadius = 5;
        photo.layer.masksToBounds = YES;
        photo.layer.borderWidth =1;
        photo.image = [UIImage imageNamed:@"cat2.jpeg"];
        
        photo.backgroundColor = [UIColor redColor];
        [self.contentView addSubview: photo];
        tag = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor grayColor] textAlignment:NSTextAlignmentCenter numberOfLines:1 text:@"091期" fontSize:13];
        
        [photo addSubview: tag];
        
        tag.frame = CGRectMake(photo.frame.size.width-80, 0, 80, 40);
        tag.layer.borderWidth =1;
        
        name  = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft numberOfLines:1 text:@"球星名字" fontSize:14];
        name.frame  = CGRectMake(10,self.contentView.frame.size.height-50 , self.contentView.frame.size.width-20, 20);
        [self.contentView addSubview:name];
        
        team  = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft numberOfLines:1 text:@"球星所在球队" fontSize:13];
        team.frame  = CGRectMake(10,self.contentView.frame.size.height-30 , self.contentView.frame.size.width-20, 20);

        [self.contentView addSubview:team];
    }
    return self;
}

@end
