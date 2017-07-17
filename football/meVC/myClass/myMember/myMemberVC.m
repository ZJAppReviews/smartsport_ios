//
//  myMemberVC.m
//  football
//
//  Created by 雨停 on 2017/7/17.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "myMemberVC.h"

@interface myMemberVC ()

@end

@implementation myMemberVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  setNavi];
    [self setNaivTitle:@"我的会员"];
    [self.view addSubview:[self headView]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden=YES;
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBar.hidden =NO;
    
    
}
-(void)leftFoundation{
    [self.navigationController popViewControllerAnimated:YES];
}
-(UIView * )headView{
    UIView * head  = [[UIView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, kScaleHeight(227.0))];
    
    head.backgroundColor = mainColor;
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(16, 0, KScreenWidth-32, kScaleHeight(227.0)-16)];
    img.image = Img(@"mymebBac");
    [head addSubview:img];
    return head;
    
}
@end
