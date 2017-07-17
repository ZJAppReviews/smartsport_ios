//
//  myCollectVC.m
//  football
//
//  Created by 雨停 on 2017/7/14.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "myCollectVC.h"
#import "ABSSegmentCate.h"
@interface myCollectVC ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property  (nonatomic,strong)ABSSegmentCate  * segmentedControl;
@property  (strong, nonatomic) UIScrollView  * contentScrView;
@property  (strong ,nonatomic) UIView        * videBottom;

@end

@implementation myCollectVC

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
    self.title =@"我的收藏";
    [self setNavLeftItemTitle:@"返回" andImage:nil];
    [self setLine];
    NSArray * dataArray = @[@"青训课程",@"在线教案",@"比赛",@"咨询",@"教练"];
    self.segmentedControl = [self setSegframe:CGRectMake(0, 64,KScreenWidth, 44) titleArr:dataArray space:0];
    [self.view addSubview: self.segmentedControl];
    
    CGFloat const kScrollViewHeight =KScreenHeight -44-64;
    self.contentScrView  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 108, KScreenWidth, kScrollViewHeight)];
    [self.view addSubview: self.contentScrView];
    self.contentScrView.contentSize = CGSizeMake(KScreenWidth * dataArray.count, kScrollViewHeight);
    self.contentScrView.delegate = self;
    self.contentScrView.pagingEnabled = YES;
    
    
    for (int i = 0; i < dataArray.count; i ++) {
        CGFloat left = i * KScreenWidth;
        UITableView * tab = [[UITableView alloc]initWithFrame:CGRectMake(left, 0, KScreenWidth, kScrollViewHeight) style:UITableViewStylePlain];
        tab.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self showPlaceholderViewWithImage:nil message:@"没有记录" buttonTitle:@"去看看" centerOffsetY:0 onSuperView:tab];
        // tab.delegate   = self;
        // tab.dataSource = self;
        tab.tag = i;
        [self.contentScrView addSubview:tab];
        if(i==0){
            //[tab registerClass:[mathCell class ] forCellReuseIdentifier:NSStringFromClass([mathCell  class])];
            
        }else{
            // [tab registerClass:[videoCell class ] forCellReuseIdentifier:NSStringFromClass([videoCell  class])];
            
            
        }
    }
    
    [_segmentedControl  segmentedControlSelectedWithBlock:^(ABSSegmentCate *segmentedControl, NSInteger selectedIndex) {
        NSLog(@"selectedIndex : %zd", selectedIndex);
        
        [self.contentScrView setContentOffset:CGPointMake(selectedIndex * KScreenWidth, 0) animated:YES];
    }];
    
}
#pragma mark - scrollView protocol methods
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if([scrollView isEqual:self.contentScrView]){
        NSInteger const kPageIndex = scrollView.contentOffset.x / KScreenWidth;
        [self.segmentedControl segmentedControlSetSelectedIndexWithSelectedBlock:kPageIndex];
        // 重设选中位置
        [self.segmentedControl segmentedControlSetSelectedIndex:kPageIndex];}
}

-(void)leftItemClick:(id)sender{
    [self.navigationController   popViewControllerAnimated:YES];
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
