//
//  appInfoModel.m
//  BicycleApp
//
//  Created by 雨停 on 2017/7/3.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "appInfoModel.h"
#import "typeModel.h"
#import "statusSmodel.h"
 
#import "schdeuleModel.h"
#import "matchViewModel.h"
#import "picModel.h"
#import "membersModel.h"
@implementation appInfoModel
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper
{

    return @{
           @"descrip":@"description",
           @"levelV":@"level",
           @"typeV":@"type",
           @"statusV":@"status"
             };
}
// Dic -> model
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {

    self.descrip = dic[@"description"];
    self.levelV = dic[@"level"];
    self.typeV  = dic[@"type"];
    self.statusV = dic[@"status"];

    return YES;
}

// model -> Dic
- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic {

    dic[@"description"] =self.descrip;
    dic[@"level"] = self.levelV   ;
    dic[@"type"]  = self.typeV  ;
    dic[@"status"] = self.statusV ;

    return YES;
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"type"   :    [statusSmodel class],
             @"status" :    [statusSmodel class],
             @"level"  :    [statusSmodel class],
             @"match_video":[matchViewModel class],
             @"schedule" :  [schdeuleModel class],
             @"match_imgs": [picModel class],
             @"memebers"  : [membersModel class]
              };
}


@end
