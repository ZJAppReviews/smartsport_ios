//
//  coachVC.m
//  football
//
//  Created by 雨停 on 2017/6/30.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "coachVC.h"
#import "coachCell.h"
@interface coachVC ()<UITableViewDelegate,UITableViewDataSource>
@property  (nonatomic, strong)UITableView    * tab;
@end

@implementation coachVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubView];
}
-(void)setSubView{
    self.title = @"全部教练";
    
    self.tab = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self.view addSubview:self.tab];
    [self.tab registerClass:[coachCell class] forCellReuseIdentifier:NSStringFromClass([coachCell class])];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 101;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Class currentClass = [coachCell class];
    coachCell * cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = nil;
    return cell;
   
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
