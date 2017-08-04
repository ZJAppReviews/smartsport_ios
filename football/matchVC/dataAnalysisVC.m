//
//  dataAnalysisVC.m
//  football
//
//  Created by 雨停 on 2017/7/27.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "dataAnalysisVC.h"
#import "ABSSegmentCate.h"
#import "integralCell.h"
#import "shooterCell.h"
@interface dataAnalysisVC ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)UIScrollView    * contentScrView;
@property  (nonatomic,strong)ABSSegmentCate  * segmentedControl;
@property (nonatomic,strong)UITableView    * leftTab;
@property (nonatomic,strong)UITableView    * rightTab;
@property (nonatomic,strong)UITableView    * centerTab;

@end

@implementation dataAnalysisVC
-(id)init{
    if(self = [super init]){
        self.matchID = [NSString string];
    }
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubview];
    // Do any additional setup after loading the view.
}
-(void)setSubview{
    [self setNavLeftItemTitle:@"返回" andImage:nil];
    self.title =@"数据分析";
    [self setLine];
    CGFloat const kSegmentedControlHeight = 44;
    NSArray *dataArray = @[@"积分榜", @"射手榜",@"助攻榜"];
    self.segmentedControl = [self setSegframe:CGRectMake(45, 64, KScreenWidth-90, kSegmentedControlHeight) titleArr:dataArray space:90];
    [self.view addSubview:_segmentedControl];
    
    
    CGFloat const kScrollViewHeight =KScreenHeight -44-50-64;
    self.contentScrView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 108, KScreenWidth, KScreenHeight-108)];
    [self.view  addSubview: self.contentScrView];
    self.contentScrView.contentSize = CGSizeMake(KScreenWidth * dataArray.count, kScrollViewHeight);
    self.contentScrView.delegate = self;
    self.contentScrView.pagingEnabled = YES;
    for (int i = 0; i < dataArray.count; i ++) {
        CGFloat left = i * KScreenWidth;
        
        UITableView * tab = [[UITableView alloc]initWithFrame:CGRectMake(left, 0, KScreenWidth, kScrollViewHeight) style:UITableViewStylePlain];
        tab.separatorStyle = UITableViewCellSeparatorStyleNone;
        tab.delegate = self;
        tab.dataSource = self;
        [self.contentScrView addSubview:tab];
        if(i==0){
          
            [tab registerNib:[UINib nibWithNibName:@"integralCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([integralCell  class])];
            tab.tableHeaderView = [self leftView];
            //[tab registerClass:[mathCell class ] forCellReuseIdentifier:];
            self.leftTab = tab;
        }else if(i==1){
            [tab registerNib:[UINib nibWithNibName:@"shooterCell" bundle:nil] forCellReuseIdentifier:@"shooterCell"];
             tab.tableHeaderView = [self centerView];
            self.centerTab = tab;
        }else{
             tab.tableHeaderView = [self rightView];
            [tab registerNib:[UINib nibWithNibName:@"shooterCell" bundle:nil] forCellReuseIdentifier:@"shooterCell"];
            self.rightTab  = tab;
        }
    }
    
    [_segmentedControl segmentedControlSelectedWithBlock:^(ABSSegmentCate *segmentedControl, NSInteger selectedIndex) {
        NSLog(@"selectedIndex : %zd", selectedIndex);
        
        [self.contentScrView setContentOffset:CGPointMake(selectedIndex * KScreenWidth, 0) animated:YES];
    }];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([tableView isEqual:self.leftTab]){
        return 4;
    }else{
        return 4;}
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if([tableView isEqual:self.leftTab]){
        Class currentClass = [integralCell class];
        integralCell * cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
        
    }else  if([tableView isEqual:self.centerTab]){
        
        Class currentClass = [shooterCell class];
        shooterCell * cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else{
        Class currentClass = [shooterCell class];
        shooterCell * cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

-(void)leftItemClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark - scrollView protocol methods
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if([scrollView isEqual:self.contentScrView]){
        NSInteger const kPageIndex = scrollView.contentOffset.x / KScreenWidth;
        [self.segmentedControl segmentedControlSetSelectedIndexWithSelectedBlock:kPageIndex];
        // 重设选中位置
        [self.segmentedControl segmentedControlSetSelectedIndex:kPageIndex];}
}


-(UIView *)centerView{
    UIView * left = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 32)];
    left.backgroundColor = KRgb(0.91, 0.91, 0.91);

    UILabel * leftLab = [XYUIKit labelWithBackgroundColor:KClearColor textColor:KBlackColor textAlignment:NSTextAlignmentLeft numberOfLines:0 text:@"球员" fontSize:13];
    leftLab.frame = CGRectMake(37, 7,40,18);
    [left  addSubview: leftLab];
    UILabel * centerLab = [XYUIKit labelWithBackgroundColor:KClearColor textColor:KBlackColor textAlignment:NSTextAlignmentLeft numberOfLines:0 text:@"球队" fontSize:13];
    centerLab.frame = CGRectMake(152, 7, 40, 18);
    [left  addSubview: centerLab];
    UILabel * rightLab = [XYUIKit labelWithBackgroundColor:KClearColor textColor:KBlackColor textAlignment:NSTextAlignmentLeft numberOfLines:0 text:@"进球" fontSize:13];
    rightLab.frame = CGRectMake(KScreenWidth-48, 7, 40, 18);
    [left  addSubview: rightLab];
    return left;
}
-(UIView *)leftView{
    UIView * center = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 32)];
    center.backgroundColor = KRgb(0.91, 0.91, 0.91);
    UILabel * leftLab = [XYUIKit labelWithBackgroundColor:KClearColor textColor:KBlackColor textAlignment:NSTextAlignmentLeft numberOfLines:0 text:@"球队" fontSize:13];
    leftLab.frame = CGRectMake(37, 7,40,18);
    [center  addSubview: leftLab];
    CGFloat  w =(KScreenWidth-166)/3.0;
    UILabel * centerLabL = [XYUIKit labelWithBackgroundColor:KClearColor textColor:KBlackColor textAlignment:NSTextAlignmentCenter numberOfLines:0 text:@"胜/平/负" fontSize:13];
    centerLabL.frame = CGRectMake(124, 7, w, 18);
    [center  addSubview: centerLabL];
    
    UILabel * centerLabC = [XYUIKit labelWithBackgroundColor:KClearColor textColor:KBlackColor textAlignment:NSTextAlignmentCenter numberOfLines:0 text:@"进/失球" fontSize:13];
    centerLabC.frame = CGRectMake(124+w, 7, w, 18);
    [center  addSubview: centerLabC];
    
    UILabel * centerLabR = [XYUIKit labelWithBackgroundColor:KClearColor textColor:KBlackColor textAlignment:NSTextAlignmentCenter numberOfLines:0 text:@"红黄牌" fontSize:13];
    centerLabR.frame = CGRectMake(124+2*w, 7, w, 18);
    [center  addSubview: centerLabR];

    UILabel * rightLab = [XYUIKit labelWithBackgroundColor:KClearColor textColor:KBlackColor textAlignment:NSTextAlignmentLeft numberOfLines:0 text:@"积分" fontSize:13];
    rightLab.frame = CGRectMake(KScreenWidth-42, 7, 40, 18);
    [center  addSubview: rightLab];
    return center;

}

-(UIView *)rightView{
    UIView * right = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 32)];
    right.backgroundColor = KRgb(0.91, 0.91, 0.91);

    UILabel * leftLab = [XYUIKit labelWithBackgroundColor:KClearColor textColor:KBlackColor textAlignment:NSTextAlignmentLeft numberOfLines:0 text:@"球员" fontSize:13];
    leftLab.frame = CGRectMake(37, 7,40,18);
    [right  addSubview: leftLab];
    UILabel * centerLab = [XYUIKit labelWithBackgroundColor:KClearColor textColor:KBlackColor textAlignment:NSTextAlignmentLeft numberOfLines:0 text:@"球队" fontSize:13];
    centerLab.frame = CGRectMake(152, 7, 40, 18);
    [right  addSubview: centerLab];
    UILabel * rightLab = [XYUIKit labelWithBackgroundColor:KClearColor textColor:KBlackColor textAlignment:NSTextAlignmentLeft numberOfLines:0 text:@"助攻" fontSize:13];
    rightLab.frame = CGRectMake(KScreenWidth-48, 7, 40, 18);
    [right  addSubview: rightLab];
    return right;
}
-(void)viewWillAppear:(BOOL)animated{
    [self requestType:HttpRequestTypePost
                  url:nil
           parameters:@{
                        @"action":@"viewMatchAnalysis",
                        @"match_id":self.matchID,
                        @"type":@"1"
                
                        }
         successBlock:^(BaseModel *response) {
             
         } failureBlock:^(NSError *error) {
             
         }];
    [self requestType:HttpRequestTypePost
                  url:nil
           parameters:@{
                        @"action":@"viewMatchAnalysis",
                        @"match_id":self.matchID,
                        @"type":@"2"
                        
                        }
         successBlock:^(BaseModel *response) {
             
         } failureBlock:^(NSError *error) {
             
         }];
    [self requestType:HttpRequestTypePost
                  url:nil
           parameters:@{
                        @"action":@"viewMatchAnalysis",
                        @"match_id":self.matchID,
                        @"type":@"3"
                        
                        }
         successBlock:^(BaseModel *response) {
             
         } failureBlock:^(NSError *error) {
             
         }];
}

@end
