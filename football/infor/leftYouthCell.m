//
//  leftYouthCell.m
//  football
//
//  Created by 雨停 on 2017/6/28.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "leftYouthCell.h"
#import "SDAutoLayout.h"
#import "XYUIKit.h"
@implementation leftYouthCell
{
    UIImageView  * _pic ;
    UILabel      * _title;
    UILabel      * _detaile;
    UILabel      * _timeraddress;
    UIImageView  * _line;
    
    UILabel      * _num;
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *pic = [UIImageView new];
        
        pic.backgroundColor = [UIColor redColor];
        _pic = pic;
        UILabel * title  = [XYUIKit labelTextColor:[UIColor blackColor] fontSize:14 ];
        _title = title;
        UILabel  *detaitle = [XYUIKit labelTextColor:[UIColor grayColor] fontSize:13];
        
        _detaile = detaitle;
        UILabel * timeraddress = [XYUIKit labelTextColor:[UIColor grayColor] fontSize:12];
        
        _timeraddress = timeraddress ;
        UIImageView *line = [[UIImageView alloc]init];
        line.backgroundColor = [UIColor grayColor];
        _line = line;
        UILabel * num = [XYUIKit labelTextColor:[UIColor grayColor] fontSize:12];
        num.textAlignment  = NSTextAlignmentRight;
        _num = num;
        
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
        
        [self.contentView sd_addSubviews:@[pic, title, detaitle, timeraddress ,line,num]];
        
        
        
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
        
        _num.sd_layout
        .rightSpaceToView(self.contentView, 10)
        .heightIs(30)
        .bottomEqualToView(_pic)
        ;
        
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
        [self setupAutoHeightWithBottomViewsArray:@[ _pic, _title, _detaile, _timeraddress ,_line,_num] bottomMargin:0];
        // [self setupAutoHeightWithBottomView:_view4 bottomMargin:10];
        
    }
    return self;
}
- (void)setModel:(youthModel *)model
{
    _model = model;
    _pic .image = [UIImage imageNamed:@"cat.jpeg"];
    _title.text =@"运动标题";
    _detaile.text = @"运动内容详情介绍";
    _timeraddress.text = @"2017-05-28";
    _num.text  = @"阅读:983";
   
}
-(void)setModelcenter:(youthModel *)modelcenter{
    _modelcenter= modelcenter;
    _title.text =@"活动标题";
    _pic .image = [UIImage imageNamed:@"cat.jpeg"];
    _detaile.text = @"活动内容详情介绍";
    _timeraddress.text = @"2017-05-28";
    _num.text  = @"阅读:983";
}
-(void)setModelright:(youthModel *)modelright{
    _modelcenter  = modelright;
    _title.text =@"新闻标题";
    _pic .image = [UIImage imageNamed:@"cat.jpeg"];
    _detaile.text = @"新闻内容详情介绍";
    _timeraddress.text = @"2017-05-28";
    _num.text  = @"阅读:983";
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
