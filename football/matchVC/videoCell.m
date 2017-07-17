//
//  videoCell.m
//  football
//
//  Created by 雨停 on 2017/6/29.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "videoCell.h"
#import "SDAutoLayout.h"
#import "XYUIKit.h"
#import "Header.h"
@implementation videoCell{
    UIImageView  * _pic ;
    UILabel      * _title;
    UILabel      * _time;
    UIButton     * _btn;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setSubview];
    }
    return self;
}
-(void)setSubview{
    UIImageView    * pic  = [[UIImageView alloc]init];
    _pic  = pic;
    
    UILabel        * title = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft numberOfLines:0 text:nil fontSize:14];
    _title    = title;
    
    UILabel        * time  = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft numberOfLines:1 text:nil fontSize:12];
    _time   = time ;
    
    UIButton       * btn = [[UIButton alloc]init];
    btn.backgroundColor = [UIColor redColor];
    _btn  = btn;
    
    [self.contentView sd_addSubviews:@[pic,title,time,btn]];
    UIView * vc  = self.contentView;
    
    _pic.sd_layout
    .topEqualToView(vc)
    .widthIs(KScreenWidth)
    .heightIs(200);
    
    _title.sd_layout
    .topSpaceToView(_pic, 10)
    .leftSpaceToView(vc, 10)
    .rightSpaceToView(vc, 10)
    .autoHeightRatio(0);
    
    _time.sd_layout
    .topSpaceToView(_title, 20)
    .leftSpaceToView(vc, 10)
    .heightIs(20);
    [_time setSingleLineAutoResizeWithMaxWidth:120];

    
    _btn.sd_layout
    .rightSpaceToView(vc, 10)
    .centerYEqualToView(_time)
    .widthIs(30)
    .heightIs(30);
    
    [self setupAutoHeightWithBottomView:_btn bottomMargin:10];
}

-(void)setModel:(youthModel *)model{
    _model = model ;
    _pic.image = [UIImage imageNamed:@"cat2.jpeg"];
    _title .text = @"这里是直播标题，这里是直播标题，这里是直播标题，这里是直播标题";
    _time . text = @"2017-05-28";
}

@end
