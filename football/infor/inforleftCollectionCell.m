//
//  inforleftCollectionCell.m
//  football
//
//  Created by 雨停 on 2017/6/28.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "inforleftCollectionCell.h"
#import "XYUIKit.h"
#import "Header.h"
@implementation inforleftCollectionCell
{
    UILabel * title;
    UILabel * detaile;
    UILabel * time;
    UILabel * price;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setSubview];
    }
    return self;
        }
-(void)setSubview{
    self.contentView.layer.borderWidth = 1;
    self.contentView.layer.cornerRadius = 2;
    
    title  = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft numberOfLines:1 text:@"推荐青训课程" fontSize:15];
    title.frame = CGRectMake(10, 10, SCREEN_WIDTH-20, 20);
    [self.contentView addSubview:title];
    
    detaile = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft numberOfLines:1 text:@"推荐青训课程描述" fontSize:13];
    detaile.frame  = CGRectMake(10,30 , SCREEN_WIDTH-20, 20);
    [self.contentView addSubview:detaile];
    
    time = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft numberOfLines:1 text:@"2017-05-28" fontSize:12];
    time.frame = CGRectMake(10, 60, 0.5*SCREEN_WIDTH, 20);
    [self.contentView addSubview:time];
    
    price = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor redColor] textAlignment:NSTextAlignmentRight numberOfLines:1 text:@"¥360.0" fontSize:15];
    price.frame = CGRectMake(10, 50, 0.5*SCREEN_WIDTH, 30);

    [self.contentView addSubview:price];
}
@end
