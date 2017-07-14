//
//  InfoSetVC.m
//  football
//
//  Created by 雨停 on 2017/7/13.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "InfoSetVC.h"
#import "InfoSetCell.h"
@interface InfoSetVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView  * tab;
@property (nonatomic,strong)UILabel      * promort;
@property (nonatomic, strong) UIButton    * selectBtn;
@property (nonatomic,strong) NSMutableArray  * arr ;

@end

@implementation InfoSetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubview ];
    self.automaticallyAdjustsScrollViewInsets = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setSubview{
    NSArray * arr = @[
  @{@"title":@"真实姓名",@"detaile":@"姓名"},
  @{@"title":@"年龄",@"detaile":@"22"},
  @{@"title":@"性别",@"detaile":@"男"},
  @{@"title":@"身高",@"detaile":@"180CM"},
  @{@"title":@"体重",@"detaile":@"65KG"},
  @{@"title":@"惯用脚",@"detaile":@"右脚"}];
    self.arr = [NSMutableArray arrayWithArray:arr];
    self.title = @"完善个人信息";
    //创建一个UIButton
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 24)];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    //覆盖返回按键
    self.navigationItem.leftBarButtonItem = backItem;
    
    [self setNavRightItemTitle:@"跳过" andImage:nil];
    self.tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 272) style:UITableViewStylePlain ];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self.tab registerClass:[InfoSetCell class] forCellReuseIdentifier:NSStringFromClass([InfoSetCell class])];
    [self.view addSubview:self.tab];
    
    self.promort = [XYUIKit labelWithTextColor:[UIColor lightGrayColor] numberOfLines:1 text:@"完善个人信息有助于帮你找到最佳的青训训练与足球赛事" fontSize:12];
    self.promort.frame = CGRectMake(17, self.tab.bottom+7.5, SCREEN_WIDTH-51, 18);

    [self.view addSubview:self.promort];
    
    self.selectBtn = [XYUIKit buttonWithBackgroundColor:mainColor titleColor:[UIColor whiteColor] title:@"确定" fontSize:14];
    self.selectBtn.frame = CGRectMake(48, self.promort.bottom+42, SCREEN_WIDTH-96, 46);
    self.selectBtn.layer.cornerRadius = 4;
    [self.view addSubview:self.selectBtn];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.arr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Class currentClass = [InfoSetCell class];
    InfoSetCell * cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if(indexPath.row==0){
        cell.img.hidden=YES;
    }
    NSDictionary * dic =self.arr[indexPath.row];
    cell.title.text =  [dic objectForKey:@"title"];
    cell.detile.text = [dic objectForKey:@"detaile"];
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (void)rightItemClick:(id)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
