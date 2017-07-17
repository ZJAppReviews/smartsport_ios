//
//  coachCell.m
//  football
//
//  Created by 雨停 on 2017/6/30.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "coachCell.h"
#import "XYUIKit.h"
#import "Header.h"
@implementation coachCell{
    UIImageView   * photo;
    UILabel       * title;
    UILabel       * detaile;
    UIImageView   * line;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setSubView];
    }
    return  self;
}
-(void)setSubView{
    photo  = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 100)];
    [self.contentView addSubview:photo];
    
    title  =[XYUIKit labelTextColor:[UIColor blackColor] fontSize:13];
    title.frame = CGRectMake(70, 20,KScreenWidth-70, 20);
    [self.contentView addSubview:title];
    
    detaile = [XYUIKit labelTextColor:[UIColor grayColor] fontSize:14];
    detaile.frame = CGRectMake(70, 40,KScreenWidth-70, 20);
    [self.contentView addSubview:detaile];
    
    line =[[UIImageView alloc]initWithFrame:CGRectMake(0, 100, KScreenWidth, 1)];
    line.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:line];
    
   
}
-(void)setModel:(youthModel *)model{
    _model = model;
    photo.image = [UIImage imageNamed:@"cat1.jpeg"];
    title.text = @"教练名字";
    detaile.text = @"上海青少年足球队主教练";
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
