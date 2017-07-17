//
//  BackPassVC.m
//  football
//
//  Created by 雨停 on 2017/7/12.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "BackPassVC.h"
#import "loginField.h"
#import "LogoTextField.h"
#import "inforVC.h"
@interface BackPassVC ()
@property  (nonatomic,strong)LogoTextField   * phoneNum;
@property  (nonatomic,strong)loginField   * cheakNum;
@property  (nonatomic,strong)loginField  * pass;
@property  (nonatomic,strong)loginField  * passRepeat;
@property  (nonatomic,strong)UIButton    * push;

@end

@implementation BackPassVC

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
    
    self.title =@"找回密码";
    
    self.phoneNum = [[LogoTextField alloc]initWithFrame:CGRectMake(46, 64+30, KScreenWidth-92, 44)];
    self.phoneNum.tittle.text = @"中国 +86";
    self.phoneNum.field.placeholder = @"手机号";
    
    [self.view addSubview:self.phoneNum];
    self.cheakNum = [[loginField  alloc]initWithFrame:CGRectMake(46, self.phoneNum.bottom+46, KScreenWidth-92, 36)];
    self.cheakNum.field.placeholder = @"验证码";
    [self.view addSubview:self.cheakNum];
    
    self.pass = [[loginField  alloc]initWithFrame:CGRectMake(48, self.cheakNum.bottom+46, KScreenWidth-96, 34)];
    [self.view addSubview:self.pass];
    self.pass.field.placeholder  = @"密码6-16位";
    
    self.passRepeat = [[loginField  alloc]initWithFrame:CGRectMake(48, self.pass.bottom+46, KScreenWidth-96, 34)];
    [self.view addSubview:self.passRepeat];
    self.passRepeat.field.placeholder  = @"重复密码";
    

    
    self.push  =[XYUIKit buttonWithBackgroundColor:mainColor titleColor:[UIColor whiteColor] title:@"下一步" fontSize:16];
    [self.push  addTarget:self action:@selector(nextFoundation ) forControlEvents:UIControlEventTouchUpInside];
    self.push .frame = CGRectMake(48, self.passRepeat.bottom +14, KScreenWidth-96, 46);
    self.push .layer.cornerRadius = 4;
    [self.view addSubview:self.push];
    
    
    
}
-(void)nextFoundation{
   // NSNotification * notification = [NSNotification notificationWithName:@"backMeVC" object:nil];
    //[[NSNotificationCenter defaultCenter] postNotification:notification];
     [self dismissViewControllerAnimated:NO completion:nil];
   // [self.navigationController popToRootViewControllerAnimated:NO];

}
-(void)backItemClick{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
