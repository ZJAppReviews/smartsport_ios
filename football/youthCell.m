//
//  youthCell.m
//  football
//
//  Created by 雨停 on 2017/6/27.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "youthCell.h"
#import "SDAutoLayout.h"
#import "youthModel.h"
@implementation youthCell
{
    UIImageView  * _pic ;
    UILabel      * _title;
    UILabel      * _detaile;
    UILabel      * _timeraddress;
    UIImageView  * _line;
    UIImageView  * _photo;
    UILabel      * _name;
    UILabel      * _vip;
    UILabel      * _num;
    UIButton     * _btn;
    UIImageView  * _bottom;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *pic = [UIImageView new];
        
        pic.backgroundColor = [UIColor redColor];
        _pic = pic;
        UILabel * title  = [[UILabel alloc]init];
        _title = title;
        UILabel  *detaitle = [[UILabel alloc]init];
        _detaile = detaitle;
        UILabel * timeraddress = [[UILabel alloc]init];
        timeraddress.font = [UIFont systemFontOfSize:12];
        _timeraddress = timeraddress ;
        UIImageView *line = [[UIImageView alloc]init];
        line.backgroundColor = [UIColor grayColor];
        _line = line;
        UIImageView *photo  = [[UIImageView alloc]init];
        photo.backgroundColor = [UIColor blueColor];
        photo.layer.cornerRadius=20;
        _photo = photo;
        UILabel * name = [[UILabel alloc]init];
        _name = name;
        UILabel * vip = [[UILabel alloc]init];
        vip.font = [UIFont systemFontOfSize:12];
        _vip = vip;
        UILabel * num = [[UILabel alloc]init];
        _num = num;
        UIButton * btn  = [[UIButton alloc]init];
        [btn setBackgroundColor:[UIColor redColor]];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.layer.cornerRadius = 4;
        _btn = btn;
        UIImageView *bottom = [[UIImageView alloc]init];
        bottom.backgroundColor = [UIColor grayColor];
        _bottom = bottom;
   
//        _titleLabel = [UILabel new];
//        [self.contentView addSubview:_titleLabel];
//        _titleLabel.textColor = [UIColor darkGrayColor];
//        _titleLabel.font = [UIFont systemFontOfSize:15];
//        _titleLabel.numberOfLines = 0;
//        
//        _imageView = [UIImageView new];
//        [self.contentView addSubview:_imageView];
//        _imageView.layer.borderColor = [UIColor grayColor].CGColor;
//        _imageView.layer.borderWidth = 1;
        
        
//        CGFloat margin = 15;
//        UIView *contentView = self.contentView;
//        
//        _titleLabel.sd_layout
//        .leftSpaceToView(contentView, margin)
//        .topSpaceToView(contentView, margin)
//        .rightSpaceToView(contentView, 120)
//        .autoHeightRatio(0);
//        
//        _imageView.sd_layout
//        .topEqualToView(_titleLabel)
//        .leftSpaceToView(_titleLabel, margin)
//        .rightSpaceToView(contentView, margin)
//        .heightIs(60);
        
        // 当你不确定哪个view在自动布局之后会排布在cell最下方的时候可以调用次方法将所有可能在最下方的view都传过去
       // [self setupAutoHeightWithBottomViewsArray:@[_titleLabel, _imageView] bottomMargin:margin];
        
        [self.contentView sd_addSubviews:@[pic, title, detaitle, timeraddress ,line, photo,name,vip,num,btn,bottom]];
        
        
        
        _pic.sd_layout
        .widthIs(100)
        .heightIs(100)
        .topSpaceToView(self.contentView, 10)
        .leftSpaceToView(self.contentView, 10);
        
        _title.sd_layout
        .topEqualToView(_pic)
        .leftSpaceToView(_pic, 10)
        .rightSpaceToView(self.contentView, 10)
        //.heightRatioToView(_pic, 0.4);
        .autoHeightRatio(0);
        
        _detaile.sd_layout
        .topSpaceToView(_title, 10)
        .leftSpaceToView(_pic, 10)
        .rightSpaceToView(self.contentView, 10)
        .autoHeightRatio(0);
        
        _timeraddress.sd_layout
        .bottomEqualToView(_pic)
        .leftSpaceToView(_pic, 10)
        .rightSpaceToView(self.contentView, 10)
        .heightIs(30);
        
        _line.sd_layout
        .topSpaceToView(_pic, 10)
        .leftSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0)
        .heightIs(1);
       
        _photo.sd_layout
        .leftSpaceToView(self.contentView, 10)
        .topSpaceToView(_line , 10)
        .widthIs(40)
        .heightIs(40);
        
        _name.sd_layout
        .leftSpaceToView(_photo, 10)
        .topSpaceToView(_line, 10)
        .heightIs(20)
        .widthIs(40);
        
        _vip.sd_layout
        .leftSpaceToView(_photo, 10)
        .bottomEqualToView(_photo)
        .heightIs(20)
        .widthIs(40);
        
        _bottom.sd_layout
        .topSpaceToView(_photo, 10)
        .leftSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0)
        .heightIs(1);
        
        _btn.sd_layout
        .rightSpaceToView(self.contentView, 10)
        .centerYEqualToView(_photo);
        [_btn setupAutoSizeWithHorizontalPadding:5 buttonHeight:25];
        
        _num.sd_layout
        .centerYEqualToView(_photo)
        .rightSpaceToView(_btn, 10)
        .heightIs(20)
        .widthIs(100);
//        _view4.sd_layout
//        .leftEqualToView(_view2)
//        .topSpaceToView(_view2, 10)
//        .heightIs(30)
//        .widthRatioToView(_view1, 0.7);
//        
//        _view5.sd_layout
//        .leftSpaceToView(_view4, 10)
//        .rightSpaceToView(self.contentView, 10)
//        .bottomSpaceToView(self.contentView, 10)
//        .heightRatioToView(_view4, 1);
        
        
        //***********************高度自适应cell设置步骤************************
        [self setupAutoHeightWithBottomViewsArray:@[ _pic, _title, _detaile, _timeraddress ,_line, _photo,_name,_vip,_num,_btn,_bottom] bottomMargin:0];
       // [self setupAutoHeightWithBottomView:_view4 bottomMargin:10];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(youthModel *)model
{
    _model = model;
    _pic .image = [UIImage imageNamed:@"cat.jpeg"];
    _photo.image = [UIImage imageNamed:@"cat.jpeg"];
    _title.text =@"运动标题";
    _detaile.text = @"运动内容详情介绍";
    _timeraddress.text = @"2017-05-28|上海虹口足球场";
    _name.text = @"姓名";
    _vip.text = @"国家级";
    _num.text = @"还有6个名额";
    [_btn setTitle:@"我要报名" forState:UIControlStateNormal];
   }

@end
