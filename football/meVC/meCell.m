//
//  meCell.m
//  football
//
//  Created by 雨停 on 2017/6/29.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "meCell.h"
#import "SDAutoLayout.h"
#import "XYUIKit.h"
@implementation meCell{
    UIImageView   * _icon;
    UILabel       * _title;
    UILabel       * _detaile;
    UIImageView   * _pomort;
    UIImageView   * _line;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
    [self setSubView];
    }
    return self;
}
-(void)setSubView{
    UIImageView  * icon = [[UIImageView alloc]init];
    icon.layer.cornerRadius =2;
    _icon  = icon;
    
    UILabel      * title = [XYUIKit labelTextColor:[UIColor blackColor] fontSize:13];
    _title  = title;
    
    UILabel      * detaile = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentRight numberOfLines:1 text:nil fontSize:13];
    _detaile  = detaile;
    
    UIImageView  * pomort = [[UIImageView alloc]init];
    _pomort  = pomort ;
    
    UIImageView  * line = [[UIImageView alloc]init];
    line .backgroundColor = [UIColor grayColor];
    _line  = line;
    
    [self.contentView sd_addSubviews:@[icon,title,detaile,pomort,line]];
    UIView * vc = self.contentView;
    _icon.sd_layout
    .topSpaceToView(vc, 10)
    .leftSpaceToView(vc, 10)
    .heightIs(20)
    .widthIs(20);
    
    _title.sd_layout
    .leftSpaceToView(_icon, 20)
    .centerYEqualToView(_icon)
    .heightIs(20)
    .widthIs(100);
    
    _pomort.sd_layout
    .rightSpaceToView(vc, 20)
    .centerYEqualToView(_icon)
    .heightIs(15)
    .widthIs(10);
    
    _detaile.sd_layout
    .rightSpaceToView(_pomort, 10)
    .centerYEqualToView(_icon)
    .heightIs(20)
    .widthIs(180);
    
    _line.sd_layout
    .leftSpaceToView(vc, 0)
    .rightSpaceToView(vc, 0)
    .topSpaceToView(_icon, 9)
    .heightIs(1);
   // [self setupAutoHeightWithBottomView:_line bottomMargin:10];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(youthModel *)model{
    _model = model;
    _icon.image = [UIImage imageNamed:@"cat.jpeg"];
    _title .text   = @"我的课程";
    _detaile.text  = @"青训课程标题";
    _pomort.backgroundColor = [UIColor grayColor];
    
    
}
@end
