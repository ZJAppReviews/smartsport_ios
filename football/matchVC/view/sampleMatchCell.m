//
//  sampleMatchCell.m
//  football
//
//  Created by 雨停 on 2017/7/26.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "sampleMatchCell.h"

@implementation sampleMatchCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDic:(NSDictionary *)dic{
    _dic=dic;
    self.homelogo.layer.cornerRadius=20;
    self.awaylogo.layer.cornerRadius=20;
    [self.homelogo sd_setImageWithURL:imgUrl([dic objectForKey:@"home_logo"]) placeholderImage:nil];
    [self.awaylogo sd_setImageWithURL:imgUrl([dic objectForKey:@"away_logo"]) placeholderImage:nil];
    self.homename.text = [dic objectForKey:@"home_name"];
    self.awayname.text = [dic objectForKey:@"away_name"];
    self.status.text =[NSString stringWithFormat:@"%@-%@",[dic objectForKey:@"home_team"],[dic objectForKey:@"away_team"]];
    self.time.text = [dic objectForKey:@"start_time"];

    
}
@end
