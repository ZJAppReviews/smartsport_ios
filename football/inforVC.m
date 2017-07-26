//
//  inforVC.m
//  football
//
//  Created by 雨停 on 2017/6/27.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "inforVC.h"
#import "SDCycleScrollView.h"
#import "ABSSegmentCate.h"
#import "NavigationVC.h"
#import "leftCollecCell.h"
#import "leftYouthCell.h"
#import "SDAutoLayout.h"
#import "leftCoachCell.h"
#import "leftStarCell.h"
#import "subjectVC.h"
#import "coachVC.h"
#import "starVC.h"
#import "ViewController.h"
@interface inforVC () <SDCycleScrollViewDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIScrollView *contentSrcView;
@property (nonatomic,strong)ABSSegmentCate * segmentedControl;
@property (nonatomic,strong)UITableView    * leftTab;
@property (nonatomic,strong)UITableView    * centerTab;
@property (nonatomic,strong)UITableView    * rightTab;

@end

@implementation inforVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSegmentedControl];
    [self setScrollerPhoto];

    
}
-(void)location:(id)sender{
    ViewController *vc=[[ViewController alloc]init];
    NavigationVC * nav = [[NavigationVC alloc]initWithRootViewController:vc];
    [vc returnText:^(NSString *cityname) {
        
        NSLog(@"%@",cityname);
        [self setNavLeftItemTitle:cityname andImage:Img(@"zhankai") ];
        //self.citylable.text=cityname;
    }];
    
    [self presentViewController:nav animated:YES completion:nil];

}

-(void)setSegmentedControl{
    [self setLine];
    [self setNavLeftItemTitle:@"上海市" andImage:Img(@"zhankai") ];
    CGFloat const kSegmentedControlHeight = 44;
    
   NSArray *dataArray = @[@"青训资讯", @"活动资讯", @"赛事新闻"];
    self.segmentedControl = [self setSegframe:CGRectMake(45, 64, KScreenWidth   -90, kSegmentedControlHeight) titleArr:dataArray  space:90];
    [self.view addSubview:_segmentedControl];
    
    CGFloat const kScrollViewHeight =KScreenHeight-144-50-64;
    
    self.contentSrcView.contentSize = CGSizeMake(KScreenWidth * 3, kScrollViewHeight);
    self.contentSrcView.delegate = self;

    // scrollView.backgroundColor = [UIColor whiteColor];
     self.contentSrcView.pagingEnabled = YES;
   
    for (int i = 0; i < 3; i ++) {
        
        CGFloat left = i * KScreenWidth ;
        UITableView * tab = [[UITableView alloc]initWithFrame:CGRectMake(left, 0, KScreenWidth, kScrollViewHeight) style:UITableViewStyleGrouped];
        tab.separatorStyle = UITableViewCellSeparatorStyleNone;
        tab.delegate = self;
        tab.dataSource = self;
        [self.contentSrcView addSubview:tab];
        if(i==0){
           
            [tab registerClass:[leftCollecCell class] forCellReuseIdentifier:NSStringFromClass( [leftCollecCell class])];
            [tab registerClass:[leftYouthCell class] forCellReuseIdentifier:NSStringFromClass([leftYouthCell class])];
            [tab registerClass:[leftCoachCell class] forCellReuseIdentifier:NSStringFromClass([leftCoachCell class])];
            [tab registerClass:[leftStarCell class] forCellReuseIdentifier:NSStringFromClass([leftStarCell class])];
            self.leftTab = tab;
        }else if(i==1){
             [tab registerClass:[leftYouthCell class] forCellReuseIdentifier:NSStringFromClass([leftYouthCell class])];
            
            self.centerTab = tab;
        }else{
            [tab registerClass:[leftYouthCell class] forCellReuseIdentifier:NSStringFromClass([leftYouthCell class])];
            self.rightTab = tab;
        }
    }
    
    [_segmentedControl segmentedControlSelectedWithBlock:^(ABSSegmentCate *segmentedControl, NSInteger selectedIndex) {
        NSLog(@"selectedIndex : %zd", selectedIndex);
        [ self.contentSrcView setContentOffset:CGPointMake(selectedIndex * KScreenWidth, 0) animated:YES];
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section ==0){
        return 1;
    }
    else if(section==1){
        return 3;
    }else if(section==2){
        return 1;
    }else if(section==3){
        return 1;
    }else{
        return 3;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.00001;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     __block inforVC * weakSelf  = self;
    if([tableView isEqual:self.leftTab]){
        if(indexPath.section ==0){
            Class currentClass = [leftCollecCell class];
            leftCollecCell * cell = nil;
            cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
            //cell = [tableView dequeueReusableCellWithIdentifier:@"left"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.blockBtn = ^{
                [weakSelf  jumpClassVC];
            };
            //cell.model = nil;
            
            return cell;
        }else if(indexPath.section ==1){
            Class currentClass = [leftYouthCell class];
            leftYouthCell * cell = nil;
            cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.model = nil;
            
            return cell;
        }else if(indexPath.section==2){
            Class currentClass = [leftCoachCell class];
            leftCoachCell * cell = nil;
            cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            //cell.model = nil;
            cell.coachBlock = ^{
                [weakSelf jumpCoachVC];
            };
            return cell;
        }else{
            Class currentClass = [leftStarCell class];
            leftStarCell * cell = nil;
            cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.block = ^{
                NSLog(@"wqewqewwqewqe");
                [weakSelf jumpStarVC];
            };
            //cell.model = nil;
            return cell;
        }
       

    }else if([tableView isEqual:self.centerTab]){
        Class currentClass = [leftYouthCell class];
     leftYouthCell * cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
        //cell = [tableView dequeueReusableCellWithIdentifier:@"center"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.modelcenter = nil ;
        
        return cell;
    }else{
        Class currentClass = [leftYouthCell class];
         leftYouthCell * cell = nil;
         cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
       // cell = [tableView dequeueReusableCellWithIdentifier:@"right"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.modelright = nil;
        
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if([tableView isEqual:self.leftTab]){
        if(indexPath.section ==0){
            
            return 140;
            
        }else if(indexPath.section==1){
            return [tableView cellHeightForIndexPath:indexPath model:@"wqewqewq" keyPath:@"model" cellClass:[leftYouthCell class] contentViewWidth:[self cellContentViewWith]];
        }else if(indexPath.section  ==2){
            return 190;
        }else{
            return 190;
        }
     }else if([tableView isEqual:self.centerTab]){
        return [tableView cellHeightForIndexPath:indexPath model:@"wqewqewq" keyPath:@"modelcenter" cellClass:[leftYouthCell class] contentViewWidth:[self cellContentViewWith]];
    }else{
       return [tableView cellHeightForIndexPath:indexPath model:@"wqewqewq" keyPath:@"modelright" cellClass:[leftYouthCell class] contentViewWidth:[self cellContentViewWith]];
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

#pragma mark -
#pragma mark - scrollView protocol methods
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if([scrollView isEqual:self.contentSrcView]){
    NSInteger const kPageIndex = scrollView.contentOffset.x / KScreenWidth;
     [self.segmentedControl segmentedControlSetSelectedIndexWithSelectedBlock:kPageIndex];
    // 重设选中位置
        [self.segmentedControl segmentedControlSetSelectedIndex:kPageIndex];}
}


-(void)setScrollerPhoto{
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];

    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 108, self.view.frame.size.width, 100) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView2.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    //cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    //cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [self.view addSubview:cycleScrollView2];
    
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
    
    /*
     block监听点击方式
     
     cycleScrollView2.clickItemOperationBlock = ^(NSInteger index) {
     NSLog(@">>>>>  %ld", (long)index);
     };
     
     */

    
     }
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
      NSLog(@"---点击了第%ld张图片", (long)index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)jumpClassVC{
    subjectVC    * subVc=  [[subjectVC alloc]init];
    [self absPushViewController:subVc  animated:YES];
}
-(void)jumpCoachVC{
    coachVC    * subVc=  [[coachVC alloc]init];
    [self absPushViewController:subVc  animated:YES];
}
-(void)jumpStarVC{
    starVC    * subVc=  [[starVC alloc]init];
    [self absPushViewController:subVc  animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    if(![store getStringById:@"city" fromTable:@"person"]){
        ViewController *vc=[[ViewController alloc]init];
        NavigationVC * nav = [[NavigationVC alloc]initWithRootViewController:vc];
        [vc returnText:^(NSString *cityname) {
            [store putString:cityname withId:@"city" intoTable:@"person"];
            NSLog(@"%@",cityname);
            [self setNavLeftItemTitle:cityname andImage:Img(@"zhankai") ];
            //self.citylable.text=cityname;
        }];
        
        [self presentViewController:nav animated:NO completion:nil];
    }
    
}
@end
