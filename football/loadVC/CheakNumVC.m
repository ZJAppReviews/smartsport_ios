//
//  CheakNumVC.m
//  football
//
//  Created by 雨停 on 2017/7/12.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "CheakNumVC.h"
#import "loginField.h"
#import "LogoTextField.h"
#import "RegistVC.h"
@interface CheakNumVC ()
@property  (nonatomic,strong)loginField      * cheakNum;
@property  (nonatomic,strong)LogoTextField   * phoneNum;
@property  (nonatomic,strong)UIButton        * nextBtn;
@property  (nonatomic,strong)UIButton        * agreement;
@property  (nonatomic,strong)UILabel         * pormort;
@end

@implementation CheakNumVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubview];
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
    
    self.title =@"请验证您的手机号";
    
    self.phoneNum = [[LogoTextField alloc]initWithFrame:CGRectMake(46, 67+64, SCREEN_WIDTH-92, 44)];
    self.phoneNum.tittle.text = @"中国 +86";
    self.phoneNum.field.placeholder = @"手机号";
    
    [self.view addSubview:self.phoneNum];
    self.cheakNum = [[loginField  alloc]initWithFrame:CGRectMake(46, self.phoneNum.bottom+46, SCREEN_WIDTH-92, 36)];
    self.cheakNum.field.placeholder = @"验证码";
    [self.view addSubview:self.cheakNum];
    
    self.nextBtn  =[XYUIKit buttonWithBackgroundColor:mainColor titleColor:[UIColor whiteColor] title:@"下一步" fontSize:16];
    [self.nextBtn addTarget:self action:@selector(nextFoundation ) forControlEvents:UIControlEventTouchUpInside];
    self.nextBtn.frame = CGRectMake(47, self.cheakNum.bottom +29, SCREEN_WIDTH-94, 46);
    self.nextBtn.layer.cornerRadius = 4;
    [self.view addSubview:self.nextBtn];
    self.pormort  = [XYUIKit labelWithTextColor:[UIColor lightGrayColor] numberOfLines:1 text:@"轻按上面的“下一步”，即表示你同意" fontSize:13];
    self.pormort.textAlignment = NSTextAlignmentCenter;
    self.pormort.frame = CGRectMake(0, self.nextBtn.bottom+16, SCREEN_WIDTH, 19);
    [self.view addSubview:self.pormort];
    
    self.agreement = [XYUIKit buttonWithBackgroundColor:[UIColor clearColor] titleColor:[UIColor blackColor] title:@"《数苗足球软件许可及服务协议》" fontSize:13];
    self.agreement.frame =CGRectMake(0, self.pormort.bottom, SCREEN_WIDTH, 19);
    [self.view addSubview:self.agreement];
    
    
}
-(void)nextFoundation{
    RegistVC  * reg = [[RegistVC alloc]init];
    [self.navigationController   pushViewController:reg animated:YES];
}
-(void)backItemClick{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
