//
//  mathCell.m
//  football
//
//  Created by 雨停 on 2017/6/29.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "mathCell.h"
#import "SDAutoLayout.h"
#import "XYUIKit.h"
@implementation mathCell{
    UIImageView * _head;
    UIImageView * _pic ;
    UILabel     * _tag ;
    UILabel     * _title ;
    UILabel     * _timeadreess;
    UIImageView * _line;
    UILabel     * _price;
    UILabel     * _originalprice;
    UILabel     * _num;
    UIButton    * _btn;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ( self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        [self setSubView];
    }
    
    return  self ;
    
}

-(void)setSubView{
    UIImageView  * head = [[UIImageView alloc]init];
    head.backgroundColor =[ UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:1];
    _head = head;
    
    UIImageView  * pic = [[UIImageView alloc]init];
    pic.backgroundColor = [UIColor orangeColor];
    _pic = pic ;
    
    UILabel      * tag = [XYUIKit labelWithBackgroundColor:[UIColor greenColor] textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter numberOfLines:1 text:nil fontSize:12];
    tag.layer.masksToBounds = YES ;
    tag.layer.cornerRadius =10;
    tag.backgroundColor = [UIColor greenColor];
    _tag = tag;

    UILabel      * title = [XYUIKit labelWithTextColor:[UIColor blackColor] numberOfLines:0 text:nil fontSize:13];
    _title  = title;
    
    UILabel      * timeadreess = [XYUIKit labelTextColor:[UIColor grayColor] fontSize:12];
    _timeadreess  = timeadreess;
    
    UIImageView  * line = [[UIImageView alloc]init] ;
    line.backgroundColor = [UIColor grayColor];
    _line = line;
    
    UILabel      * price = [XYUIKit labelTextColor:[UIColor redColor] fontSize:16];
    _price  = price;
    
    UILabel *originalprice = [XYUIKit labelTextColor:[UIColor grayColor] fontSize:12];
    _originalprice   = originalprice;
    
    UILabel      * num = [XYUIKit labelTextColor:[UIColor blackColor] fontSize:14];
    _num = num ;
    
    UIButton     * btn = [XYUIKit buttonWithBackgroundColor:[UIColor clearColor] titleColor:[UIColor blueColor] title:nil fontSize:14];
    btn.layer.cornerRadius = 12.5;
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor blueColor].CGColor ;
    _btn = btn ;
    
    [self.contentView sd_addSubviews:@[head,pic,tag,title,timeadreess,line,price,originalprice ,num,btn]];
    UIView *vc = self.contentView;
    _head.sd_layout
    .topSpaceToView(vc, 0)
    .leftSpaceToView(vc, 0)
    .rightSpaceToView(vc, 0)
    .heightIs(10);
    
    _pic.sd_layout
    .topSpaceToView(_head, 10)
    .leftSpaceToView(vc, 10)
    .rightSpaceToView(vc, 10)
    .heightIs(120);
   
    _tag.sd_layout
    .topSpaceToView(_head, 15)
    .rightSpaceToView(vc, 15)
    .heightIs(20)
    .widthIs(80);
    
   // [_tag setSingleLineAutoResizeWithMaxWidth:120];
    
    _title.sd_layout
    .topSpaceToView(_pic, 10)
    .leftSpaceToView(vc, 10)
    .rightSpaceToView(vc, 10)
    .autoHeightRatio(0);
    
    _timeadreess.sd_layout
    .topSpaceToView(_title, 10)
    .leftSpaceToView(vc, 10)
    .rightSpaceToView(vc, 10)
    .heightIs(20);
    
    _line.sd_layout
    .topSpaceToView(_timeadreess, 10)
    .leftSpaceToView(vc, 0)
    .rightSpaceToView(vc, 0)
    .heightIs(1);
    
    _price.sd_layout
    .topSpaceToView(_line, 10)
    .leftSpaceToView(vc, 10)
    .heightIs(20);
    [_price setSingleLineAutoResizeWithMaxWidth:60];
    
    _originalprice.sd_layout
    .leftSpaceToView(_price, 10)
    .centerYEqualToView(_price)
    .heightIs(20);
    [_originalprice setSingleLineAutoResizeWithMaxWidth:50];
    
    _btn.sd_layout
    .centerYEqualToView(_price)
    .rightSpaceToView(vc, 10);
    
    // 设置button根据文字size自适应
    [_btn setupAutoSizeWithHorizontalPadding:10 buttonHeight:25];
    
    _num.sd_layout
    .centerYEqualToView(_btn)
    .rightSpaceToView(_btn, 10)
    .heightIs(20);
    [_num setSingleLineAutoResizeWithMaxWidth:100];
    [self setupAutoHeightWithBottomView:_num bottomMargin:10];
    
}
-(void)setModel:(youthModel *)model{
    _model = model;
    _pic.image = [UIImage imageNamed:@"cat2.jpeg"];
    _tag.text = @"报名中";
    _title.text = @"这里是赛事标题最多两行，以写成自动适配";
    _timeadreess.text = @"2017-05-28|上海体育馆";
    
    _price.text  = @"¥299.0";
    _originalprice.text = @"¥666.0";
    [_btn setTitle:@"我要报名" forState:UIControlStateNormal];
    _num.text = @"还剩6个名额";
    
}
@end
