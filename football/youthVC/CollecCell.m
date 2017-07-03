//
//  CollecCell.m
//  football
//
//  Created by 雨停 on 2017/6/28.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "CollecCell.h"
#import "Masonry.h"
#import "XYUIKit.h"
@implementation CollecCell{
    UILabel  * title;
    UILabel  * num;
    UILabel  * detatile;
    UILabel  * time;
    UIImageView * img;
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
    title = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter numberOfLines:1 text:nil fontSize:15];
    [self.contentView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vc.mas_top).offset(10);
        make.left.equalTo(vc.mas_left).offset(0);
        make.right.equalTo(vc.mas_right).offset(0);
        make.height.equalTo(@20);
    }];
    num = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter numberOfLines:1 text:nil fontSize:13];
    num.layer.borderWidth=1;
    
    [self.contentView addSubview:num];
    
    [num mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.top.equalTo(vc.mas_top).offset(0);
        make.right.equalTo(vc.mas_right).offset(0);
    }];
    detatile  = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter numberOfLines:1 text:nil fontSize:12];
    [self.contentView addSubview:detatile];
    
    [detatile mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(title.mas_bottom).offset(0);
        make.left.equalTo(vc.mas_left).offset(0);
        make.right.equalTo(vc.mas_right).offset(0);
        make.height.equalTo(@15);
    }];
    
    time =[XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter numberOfLines:1 text:nil fontSize:12];
    time.layer.cornerRadius =10;
    time.layer.borderWidth  = 1;
    [self.contentView addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
        make.bottom.equalTo(vc.mas_bottom).offset(-5);
        make.left.equalTo(vc.mas_left).offset(10);
    }];
    
    img = [[UIImageView alloc]init];
    img.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:img];
     [img mas_makeConstraints:^(MASConstraintMaker *make) {
         make.size.mas_equalTo(CGSizeMake(20, 20));
         make.right.equalTo(vc.mas_right).offset(0);
         make.centerY.equalTo(time);
     }];
    
    
}
-(void)setModel:(collecModel *)model{
    _model=model;
    
    title.text = @"基础教学";
    num.text =@"2";
    detatile.text = @"共10个教学小视频";
    time.text  = @"10小时课时";
}
@end
