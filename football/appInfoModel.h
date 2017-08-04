//
//  appInfoModel.h
//  BicycleApp
//
//  Created by 雨停 on 2017/7/3.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "myTeamModel.h"
#import "myMatchModel.h"
#import "myVideoModel.h"
@interface appInfoModel : NSObject
@property  (nonatomic,copy)NSString  * app_key;
@property  (nonatomic,copy)NSString  * app_secret;
@property  (nonatomic,copy)NSString  * authorize_url;
@property  (nonatomic,copy)NSString  * expire_time;
@property  (nonatomic,copy)NSString  * refresh_url;
@property  (nonatomic,copy)NSString  * seed_secret;
@property  (nonatomic,copy)NSString  * source_url;
@property  (nonatomic,copy)NSString  * token_url;
@property  (nonatomic,copy)NSString  * authorize_code;
@property  (nonatomic,copy)NSString  * message;
@property  (nonatomic,copy)NSString  * access_token;
@property  (nonatomic,copy)NSString  * refresh_token;
@property  (nonatomic,copy)NSString  * body;
@property  (nonatomic,copy)NSString  * createtime;
@property  (nonatomic,copy)NSString  * out_trade_no;
@property  (nonatomic,copy)NSString  * total_amout;
@property  (nonatomic,copy)NSString  * private_key;
@property  (nonatomic,copy)NSString  * appId;
@property  (nonatomic,copy)NSString  * orderid;
@property  (nonatomic,copy)NSString  * subject;

@property  (nonatomic,copy)NSString  * balance;
@property  (nonatomic,copy)NSString  * integral;
@property  (nonatomic,copy)NSString  * is_verified;
@property  (nonatomic,copy)NSString  * mobile;
@property  (nonatomic,copy)NSString  * truename;
@property  (nonatomic,copy)NSString  * nickname;
@property  (nonatomic,copy)NSString  * idno;
@property  (nonatomic,copy)NSString  * is_paydeposit;

@property  (nonatomic,strong)NSArray  *level;
@property  (nonatomic,strong)NSArray  *status;
@property  (nonatomic,strong)NSArray  *type;

@property  (nonatomic,copy)NSString  *address ;
@property  (nonatomic,copy)NSString  *apply_num;
@property  (nonatomic,copy)NSString  *county ;
@property  (nonatomic,copy)NSString  *cover ;
@property  (nonatomic,copy)NSString  *descrip;
@property  (nonatomic,copy)NSString  *end_time;
@property  (nonatomic,copy)NSString  *id ;
@property  (nonatomic,copy)NSString  *levelV ;
@property  (nonatomic,copy)NSString  *name ;
@property  (nonatomic,copy)NSString  *price ;
@property  (nonatomic,copy)NSString  *quota;
@property  (nonatomic,copy)NSString  *sell_price;
@property  (nonatomic,copy)NSString  *start_time;
@property  (nonatomic,copy)NSString  *statusV ;
@property  (nonatomic,copy)NSString  *surplus ;
@property  (nonatomic,copy)NSString  *typeV ;

@property  (nonatomic,strong)NSArray  *match_imgs;

@property  (nonatomic,strong)NSArray  *match_video;

@property  (nonatomic,strong)NSArray  *schedule;

@property  (nonatomic,strong)myMatchModel * match;
@property  (nonatomic,strong)myVideoModel  * video ;
@property  (nonatomic,strong)myTeamModel  * myteam;

@property  (nonatomic,copy)NSString   * team_name;
@property  (nonatomic,strong)NSArray  * members;
@property   (nonatomic,strong)NSArray  * rows;
@property  (nonatomic,strong) NSString *player;
@property  (nonatomic,strong) NSString *coach;
@property  (nonatomic,strong) NSString *assists;

@end
