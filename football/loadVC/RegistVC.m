//
//  RegistVC.m
//  football
//
//  Created by 雨停 on 2017/7/12.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "RegistVC.h"
#import "loginField.h"
#import "InfoSetVC.h"
@interface RegistVC ()
@property  (nonatomic,strong)loginField  * name;
@property  (nonatomic,strong)loginField  * pass;
@property  (nonatomic,strong)loginField  * passRepeat;
@property  (nonatomic,strong)UIButton    * push;
@end

@implementation RegistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubview];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setSubview{
    //创建一个UIButton
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 24)];
    //设置UIButton的图像
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.titleLabel.font = FontSize(15);
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    backButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

    [backButton setImage:[UIImage imageNamed:@"Back Arrow Blue"] forState:UIControlStateNormal];
    //给UIButton绑定一个方法，在这个方法中进行popViewControllerAnimated
    [backButton addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    //然后通过系统给的自定义BarButtonItem的方法创建BarButtonItem
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    //覆盖返回按键
    self.navigationItem.leftBarButtonItem = backItem;
    
    
    self.title =@"注册";
    self.name = [[loginField alloc]initWithFrame:CGRectMake(48, 67+64, SCREEN_WIDTH-96, 34)];
    [self.view addSubview:self.name];
    self.name.field.placeholder  = @"用户名2-15位,且不能纯数字";
    
    self.pass = [[loginField  alloc]initWithFrame:CGRectMake(48, self.name.bottom+46, SCREEN_WIDTH-96, 34)];
    [self.view addSubview:self.pass];
    self.pass.field.placeholder  = @"密码6-16位";
    
    self.passRepeat = [[loginField  alloc]initWithFrame:CGRectMake(48, self.pass.bottom+46, SCREEN_WIDTH-96, 34)];
    [self.view addSubview:self.passRepeat];
    self.passRepeat.field.placeholder  = @"重复密码";
    
    self.push  =[XYUIKit buttonWithBackgroundColor:RGBAColor(60,185,99,0.5) titleColor:[UIColor whiteColor] title:@"注册" fontSize:16];
    
    [self.push addTarget:self action:@selector(pushInfo) forControlEvents:UIControlEventTouchUpInside];
    self.push.frame = CGRectMake(53, self.passRepeat.bottom +45, SCREEN_WIDTH-106, 46);
    self.push.layer.cornerRadius = 4;
    [self.view addSubview:self.push];
    
   
}
-(void)pushInfo{
    InfoSetVC * setVC = [[InfoSetVC alloc]init];
    [self.navigationController   pushViewController:setVC animated:YES];
    
}
-(void)backItemClick{
    [self.navigationController   popViewControllerAnimated:YES];
}

@end
