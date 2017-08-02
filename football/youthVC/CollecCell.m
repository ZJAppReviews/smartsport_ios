//
//  CollecCell.m
//  football
//
//  Created by 雨停 on 2017/6/28.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "CollecCell.h"
#import "Masonry.h"
#import "SDAutoLayout.h"
#import "XYUIKit.h"
@implementation CollecCell{
    UILabel  * title;
    UILabel  * num;
    UILabel  * detatile;
    UILabel  * time;
    UIImageView * backImg;
    UIImageView * centerImg;
}
-(instancetype)initWithFrame:(CGRect)frame {
    if(self= [super initWithFrame:frame]){
        [self setView];
    }
    return self;
}
-(void)setView{
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.borderWidth= 1;
    UIView *vc = self.contentView;
    title = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:KBlackColor textAlignment:NSTextAlignmentLeft numberOfLines:1 text:nil fontSize:17];
    num = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter numberOfLines:1 text:nil fontSize:13];
    num.layer.borderWidth=1;
    
    detatile  = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter numberOfLines:1 text:nil fontSize:12];
    [self.contentView addSubview:detatile];
    
    time =[XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter numberOfLines:1 text:nil fontSize:12];
    time.layer.cornerRadius =10;
    time.layer.borderWidth  = 1;
    
    backImg = [[UIImageView alloc]init];
    
    
    
}
-(void)setModel:(collecModel *)model{
    _model=model;
    
    title.text = @"基础教学";
    num.text =@"2";
    detatile.text = @"共10个教学小视频";
    time.text  = @"10小时课时";
}
@end
