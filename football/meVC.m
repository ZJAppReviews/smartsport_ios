//
//  meVC.m
//  football
//
//  Created by 雨停 on 2017/6/27.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "meVC.h"
#import "Header.h"
#import "meCell.h"
#import "meHeadView.h"
@interface meVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)  UITableView *tab;

@end

@implementation meVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubview];
   }
-(void)setSubview{
    self.view.backgroundColor = [UIColor colorWithHexString:@"#3CB963"];
    UIView  * topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    topView.backgroundColor = [UIColor colorWithHexString:@"#3CB963"];
    [self.view addSubview:topView];
    CGFloat const ViewHeight =SCREENH_HEIGHT-50-64;
    self.tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, ViewHeight) style:UITableViewStyleGrouped];
    [self.view addSubview: self.tab];
    self.tab.delegate   = self;
    self.tab.dataSource = self;
    self.tab.bounces= NO;
    //self.tab.backgroundColor =[UIColor colorWithHexString:@"#3CB963"];
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tab.tableHeaderView = [self setView];
    [self.tab registerClass:[meCell class] forCellReuseIdentifier: NSStringFromClass([meCell class])];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section  ==0){
        return 4;
    }else if(section==1){
        return 1;
    }
    else if(section ==2){
        return 2;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 10;//这里是设置tableView的第一部分的头视图高度为0.01
    }else {
        return 10;//这里设置其他部分的头视图高度为10
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0000001;//设置尾视图高度为0.01
}



-(UIView *)setView{
    meHeadView * vic = [[NSBundle mainBundle] loadNibNamed:@"meHead" owner:nil options:nil].lastObject;
    vic.frame = CGRectMake(0, 0, SCREEN_WIDTH, 144);
    
    return vic;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Class currentClass = [meCell class];
    meCell * cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = nil;
    return cell;
 
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}
//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    
//    meHeadView *vc = [NSBundle  mainBundle]loadNibNamed:@"" owner:<#(nullable id)#> options:<#(nullable NSDictionary *)#>
//    return vc ;
//}
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


@end
