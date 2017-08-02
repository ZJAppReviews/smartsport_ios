//
//  teamHomeVC.m
//  football
//
//  Created by 雨停 on 2017/7/27.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "teamHomeVC.h"
#import "homePersonCell.h"
#import "appInfoModel.h"
#import "membersModel.h"
@interface teamHomeVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTab;
@property  (nonatomic,strong)NSMutableArray  * arrGroup;
@property  (nonatomic,strong)NSMutableArray  * arrCoach;
@property  (nonatomic,strong)NSMutableArray  * arrPlayer;
@end

@implementation teamHomeVC
-(id)init{
    if(self = [super init]){
        self.teamID = [NSString string];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubview];
}
-(void)setSubview{
    self.arrCoach  =[NSMutableArray array];
    self.arrPlayer =[NSMutableArray array];
    self.arrGroup  =[NSMutableArray array];
    
    [self setNavLeftItemTitle:@"返回" andImage:nil];
    self.title=@"球队主页";
     self.myTab.separatorStyle = UITableViewScrollPositionNone;
    [self.myTab registerNib:[UINib nibWithNibName:@"homePersonCell" bundle:nil] forCellReuseIdentifier:@"homePerson"];
    
}
-(void)leftItemClick:(id)sender{
    [self.navigationController    popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arrGroup.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * arr =self.arrGroup[section];
    return    arr.count;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView  alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 40)];
    UILabel * lab = [XYUIKit labelWithBackgroundColor:KClearColor textColor:KGrayColor textAlignment:NSTextAlignmentLeft numberOfLines:0 text:nil fontSize:13];
    [view addSubview:lab];
    lab.frame = CGRectMake(20, 8, 200, 32);
    if(section==0){
        lab.text =@"教练";
    }else if(section==1){
        lab.text =@"球员";
    }
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section    {
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section    {
    return 40;
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    homePersonCell  * cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"homePerson"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone ;
    NSArray * arr =self.arrGroup[indexPath.section];
    cell.model = arr[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 102;
}
-(void)viewWillAppear:(BOOL)animated{
    [self requestType:HttpRequestTypePost
                  url:nil parameters:@{@"action" : @"getMyTeamDetail",
                                        @"team_id" : self.teamID

                                                }
         successBlock:^(BaseModel *response) {
             appInfoModel * model = response.data;
             self.teamName.text = model.team_name;
             for (membersModel *member in model.members) {
                 if([member.type isEqualToString:@"0"]){
                     [self.arrPlayer addObject:member];
                 }else{
                     [self.arrCoach addObject:member];
                 }
             }
             [self.arrGroup addObject:self.arrPlayer];
             [self.arrGroup insertObject:self.arrCoach atIndex:0];
             [self.myTab reloadData];
             
         } failureBlock:^(NSError *error) {
             
         }];
}

@end
