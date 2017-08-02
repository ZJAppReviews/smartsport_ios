//
//  zhiBoVC.m
//  football
//
//  Created by 雨停 on 2017/7/26.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "zhiBoVC.h"

@interface zhiBoVC ()

@end

@implementation zhiBoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubview];
}
-(void)setSubview{
    [self setNavLeftItemTitle:@"返回" andImage:nil];
    self.title = @"直播详情";
    [self setNavRightItemTitle:nil andImage:Img(@"shearW")];
}
-(void)leftItemClick:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
