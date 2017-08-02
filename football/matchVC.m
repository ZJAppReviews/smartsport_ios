//
//  matchVC.m
//  football
//
//  Created by 雨停 on 2017/6/27.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "matchVC.h"
#import "ABSSegmentCate.h"
#import "Header.h"
#import "XYUIKit.h"
#import "mathCell.h"
#import "videoCell.h"
#import "SDAutoLayout.h"
//#import "signupVC.h"
#import "NavigationVC.h"
#import "matchDetailVC.h"
#import "matchSelectVC.h"
#import "zhiBoVC.h"

@interface matchVC ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,selectInfodelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrView;
@property  (nonatomic,strong)ABSSegmentCate  *segmentedControl;
@property (nonatomic,strong)UITableView    * leftTab;
@property (nonatomic,strong)UITableView    * rightTab;

@property (nonatomic,strong)NSMutableArray * leftArr;
@property (nonatomic,strong)NSMutableDictionary  * dic;
@end

@implementation matchVC
- (void)viewDidLoad {
    self.dic =[NSMutableDictionary  dictionary];

    self.leftArr = [NSMutableArray array];
    [super viewDidLoad];
    [self setSegmentedControl];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)rightItemClick:(id)sender{
    matchSelectVC * select = [[matchSelectVC alloc]init];
    select.seledelegate=self;
    NavigationVC  * nav =[[NavigationVC alloc]initWithRootViewController:select];
    [self presentViewController:nav animated:YES completion:nil];

}
-(void)setRequest:(NSMutableDictionary *)dic{
    [self.dic addEntriesFromDictionary:dic];
   }
-(void)setSegmentedControl{
    [self setNavRightItemTitle:nil andImage:Img(@"select")];
    [self setLine];
    CGFloat const kSegmentedControlHeight = 44;
    NSArray *dataArray = @[@"赛事", @"直播"];
    self.segmentedControl = [self setSegframe:CGRectMake(45, 64, KScreenWidth-90, kSegmentedControlHeight) titleArr:dataArray space:90];
    [self.view addSubview:_segmentedControl];

    
    CGFloat const kScrollViewHeight =KScreenHeight -44-50-64;
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
             [tab registerClass:[mathCell class ] forCellReuseIdentifier:NSStringFromClass([mathCell  class])];
             self.leftTab = tab;
         }else{
             [tab registerClass:[videoCell class ] forCellReuseIdentifier:NSStringFromClass([videoCell  class])];
         
             self.rightTab = tab;
                      }
        }
    
    [_segmentedControl segmentedControlSelectedWithBlock:^(ABSSegmentCate *segmentedControl, NSInteger selectedIndex) {
        NSLog(@"selectedIndex : %zd", selectedIndex);
        if(selectedIndex ==0){
             [self setNavRightItemTitle:nil andImage:Img(@"select")];
        }else{
             [self setNavRightItemTitle:nil andImage:nil];
        }
        [self.contentScrView setContentOffset:CGPointMake(selectedIndex * KScreenWidth, 0) animated:YES];
    }];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(tableView==self.leftTab){
    matchDetailVC * detaile = [[matchDetailVC alloc]init];
    NSDictionary * dic = self.leftArr[indexPath.row];
    detaile.idTag =[dic objectForKey:@"id"];
    NavigationVC  * nav =[[NavigationVC alloc]initWithRootViewController:detaile];
    [self presentViewController:nav animated:YES completion:nil];
    
    }else{
        zhiBoVC *zhibo = [[zhiBoVC alloc]init];
       NavigationVC  * nav =[[NavigationVC alloc]initWithRootViewController:zhibo];
        [self presentViewController:nav animated:YES completion:nil];}
}
#pragma mark -
#pragma mark - scrollView protocol methods
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if([scrollView isEqual:self.contentScrView]){
    NSInteger const kPageIndex = scrollView.contentOffset.x / KScreenWidth;
    // [self.segmentedControl segmentedControlSetSelectedIndexWithSelectedBlock:kPageIndex];
        if(kPageIndex == 0){
            [self setNavRightItemTitle:nil andImage:Img(@"select")];
        }else{
            [self setNavRightItemTitle:nil andImage:nil];
        }
    // 重设选中位置
    [self.segmentedControl segmentedControlSetSelectedIndex:kPageIndex];
    }
}
 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([tableView isEqual:self.leftTab]){
        return self.leftArr.count;
    }else{
        return 4;}
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if([tableView isEqual:self.leftTab]){
        Class currentClass = [mathCell class];
        mathCell * cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.dic = self.leftArr[indexPath.row];
        
      // WeakSelf(self);
   /* cell.cheak = ^{
          //跳转下单
        matchDetailVC * detaile = [[matchDetailVC alloc]init];
        NSDictionary * dic = self.leftArr[indexPath.row];
        detaile.idTag =[dic objectForKey:@"id"];
        
        NavigationVC  * nav =[[NavigationVC alloc]initWithRootViewController:detaile];
        [weakself presentViewController:nav animated:YES completion:nil];
        };*/
        return cell;
        
    }else {

        Class currentClass = [videoCell class];
        videoCell * cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
        cell.model = nil;
        return cell;

    }
    
    ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
    
    //    [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
    
    ///////////////////////////////////////////////////////////////////////
    
    
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if([tableView isEqual:self.leftTab]){
        //    int index = indexPath.row % 5;
        //    NSString *str = _textArray[index];
        
        // >>>>>>>>>>>>>>>>>>>>> * cell自适应步骤2 * >>>>>>>>>>>>>>>>>>>>>>>>
        /* model 为模型实例， keyPath 为 model 的属性名，通过 kvc 统一赋值接口 */
        return [tableView cellHeightForIndexPath:indexPath model:@"wqewqewq" keyPath:@"model" cellClass:[mathCell class] contentViewWidth:[self cellContentViewWith]];
    }
    else{
        
       return  [tableView cellHeightForIndexPath:indexPath model:@"wqewqewq" keyPath:@"model" cellClass:[videoCell class] contentViewWidth:[self cellContentViewWith]];
    }
}


- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    appInfoModel * model = [appInfoModel yy_modelWithDictionary:[store getObjectById:@"urlInfo" fromTable:@"person"]];
    NSMutableDictionary  * dic =[NSMutableDictionary  dictionary];

    if(self.dic){
        [dic addEntriesFromDictionary:self.dic];
        
    }
    
    [ dic addEntriesFromDictionary:@{
                                     @"client_id" : model.app_key,
                                     @"state" : model.seed_secret,
                                     @"access_token" :model.access_token,
                                     @"action"       : @"getMatchList",
                                     @"page"         : @"1"
                                     }];
    [RequestManager requestWithType:HttpRequestTypePost
                          urlString:model.source_url
                         parameters:dic
                       successBlock:^(id response){
                           [self.leftArr removeAllObjects];
                           NSLog(@"%@",response);
                           [self.leftArr addObjectsFromArray:[response objectForKey:@"data"]];
                           [self.leftTab reloadData];
                       }failureBlock:^(NSError *error) {
                           
                       } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
                           
                       }];

   /* NSDictionary * dic =@{
                          @"action" : @"getMatchList",
                          // @"page" : @"2",    //选填 页数
                          // @"type" : @"11",   //选填 赛事赛制
                           //@"status" :@"1",   //选填 比赛状态 1报名中2进行中
                          // @"level" : @"19",  //选填  比赛级别
                          // @"city" :@"310100",  //选填 城市id
                           //@"county" : @"310104"  //选填  区县id

                          };
    [self requestType:HttpRequestTypePost url:nil parameters:dic  successBlock:^(BaseModel *response) {
        
    } failureBlock:^(NSError *error) {
        
    }];*/
    
    
}


@end
