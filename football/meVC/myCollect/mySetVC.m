//
//  mySetVC.m
//  football
//
//  Created by 雨停 on 2017/7/14.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "mySetVC.h"
#import "InfoSetCell.h"
#import "LoginVC.h"
#import "NavigationVC.h"
@interface mySetVC ()<UITableViewDelegate,UITableViewDataSource>
@property  (nonatomic , strong)UITableView    * tab ;
@property  (nonatomic , strong)NSMutableArray * arr;
@property  (nonatomic , strong)UIButton    * photo;
@end

@implementation mySetVC

- (void)viewDidLoad {
    [self setSubview];
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setSubview{
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSArray * arr = @[
                      @{@"title":@"用户名",@"detaile":@"账户名字"},
                      @{@"title":@"真实姓名",@"detaile":@"张某某"},
                      @{@"title":@"年龄",@"detaile":@"22"},
                      @{@"title":@"性别",@"detaile":@"男"},
                      @{@"title":@"身高",@"detaile":@"175CM"},
                      @{@"title":@"体重",@"detaile":@"66KG"},
                      @{@"title":@"惯用脚",@"detaile":@"右脚"},


                      
                      ];
    NSArray * arr2 = @[
                         @{@"title":@"居住地",@"detaile":@"上海杨浦区"},
                         @{@"title":@"俱乐部",@"detaile":@"上海青少年俱乐部"},
                         @{@"title":@"球龄",@"detaile":@"6年"}
                       
                       ];
    NSArray * arr3 = @[
                        @{@"title":@"手机绑定",@"detaile":@"188*****234"},
                        @{@"title":@"密码修改",@"detaile":@""}
                        ];
    self.arr = [NSMutableArray array];
    [self.arr addObject:arr];
    [self.arr addObject:arr2];
    [self.arr addObject:arr3];

    
    self.title = @"账户设置";
    [self setNavLeftItemTitle:@"返回" andImage:nil];
    [self setNavRightItemTitle:@"保存" andImage:nil];
    
    self.tab = [[UITableView alloc ]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight-64) style:UITableViewStyleGrouped];
    [self.tab registerClass:[InfoSetCell class] forCellReuseIdentifier:NSStringFromClass([InfoSetCell class])];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.tableHeaderView = [self headView];
    self.tab.tableFooterView = [self footView];
    [self.view addSubview:self.tab];
    
}
-(void)leftItemClick:(id)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
    
}
-(void)rightItemClick:(id)sender{
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arr.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(section  ==0){
        NSArray * arr = self.arr[0];
        return arr.count ;
    }else if(section==1){
        NSArray * arr = self.arr[1];
        return arr.count ;
    }
    else if(section ==2){
        NSArray * arr = self.arr[2];
        return arr.count ;
    }
     return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    InfoSetCell * cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([InfoSetCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray * arr =   self.arr[indexPath.section];
    NSDictionary * dic =arr[indexPath.row];
    cell.title.text =  [dic objectForKey:@"title"];
    cell.detile.text = [dic objectForKey:@"detaile"];
    return cell;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    }
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0){
        return 0.000000001;
    }else{
        return 15;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.000000001;
}

-(UIView *)headView{
    UIView  * head = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 102)];
    self.photo = [[UIButton alloc] initWithFrame:CGRectMake(15, 15, 71, 71)];
    //self.photo.layer.cornerRadius = 35.5;
   // self.photo.backgroundColor = mainColor;
    [self.photo setBackgroundImage:Img(@"photoMe") forState:UIControlStateNormal];
    UIButton * PhotoTitle = [[UIButton alloc]initWithFrame:CGRectMake(self.photo.right+19, head.top+38, 100, 24)];
    
    [head addSubview:PhotoTitle];
    [PhotoTitle setTitle:@"跟换头像" forState:UIControlStateNormal];
    PhotoTitle.titleLabel.font = FontSize(15);
    [PhotoTitle setTitleColor:KBlackColor forState:UIControlStateNormal];
    PhotoTitle.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIImageView * pormort = [[UIImageView alloc]initWithFrame:CGRectMake(head.right-25, 45, 8, 13)];
    pormort.image = Img(@"Arrow");
    [head  addSubview:pormort];
    [head addSubview:self.photo];
    return head;

}

-(UIView *)footView{
    UIView  * foot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 80)];
   
    
    UIButton * exit = [[UIButton alloc]initWithFrame:CGRectMake(0, foot.top+16, 268, 46)];
    exit.centerX = KScreenWidth/2.0;
    [foot addSubview:exit];
    exit. backgroundColor = mainColor;
    exit. layer.cornerRadius = 4;
    [exit addTarget:self action:@selector(exit:) forControlEvents:UIControlEventTouchUpInside];
    [exit setTitle:@"退出登录" forState:UIControlStateNormal];
     exit.titleLabel.font = FontSize(15);

   
    return foot;

}
-(void)exit:(UIButton *)sender{
    [self initAppinfo];
    [store deleteObjectById:@"load" fromTable:@"person"];
    [store deleteObjectById:@"phoneNum" fromTable:@"person"];
    LoginVC * login = [[LoginVC alloc]init];
    login.exitBtn.alpha = 0;
    NavigationVC   * nav  = [[NavigationVC alloc]initWithRootViewController:login];
    [self  presentViewController:nav animated:YES completion:^{
        [kNotificationCenter postNotificationName:@"loadStatus" object:@"0"];
    }];


}
@end
