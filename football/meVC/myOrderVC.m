//
//  myOrderVC.m
//  football
//
//  Created by 雨停 on 2017/7/14.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "myOrderVC.h"
#import "ABSSegmentCate.h"

@interface myOrderVC ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property  (nonatomic,strong)ABSSegmentCate  * segmentedControl;
@property  (strong, nonatomic) UIScrollView  * contentScrView;

@end

@implementation myOrderVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubview];
}

-(void)setSubview{
    self.title =@"我的订单";
    [self setNavLeftItemTitle:@"返回" andImage:nil];
    NSArray * dataArray = @[@"全部",@"待付款",@"已完成"];
    [self setLine];
    self.segmentedControl = [self setSegframe:CGRectMake(0, 64, SCREEN_WIDTH, 44) titleArr:dataArray space:0];
    
    [self.view addSubview: self.segmentedControl];
    CGFloat const kScrollViewHeight =SCREENH_HEIGHT -44-64;
    self.contentScrView  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 108, SCREEN_WIDTH, kScrollViewHeight)];
    [self.view addSubview: self.contentScrView];
    self.contentScrView.contentSize = CGSizeMake(SCREEN_WIDTH * dataArray.count, kScrollViewHeight);
    self.contentScrView.delegate = self;
    self.contentScrView.pagingEnabled = YES;
    
    
    for (int i = 0; i < dataArray.count; i ++) {
        CGFloat left = i * SCREEN_WIDTH;
        UITableView * tab = [[UITableView alloc]initWithFrame:CGRectMake(left, 0, SCREEN_WIDTH, kScrollViewHeight) style:UITableViewStylePlain];
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
        
        [self.contentScrView setContentOffset:CGPointMake(selectedIndex * SCREEN_WIDTH, 0) animated:YES];
    }];
    
}
#pragma mark - scrollView protocol methods
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if([scrollView isEqual:self.contentScrView]){
        NSInteger const kPageIndex = scrollView.contentOffset.x / SCREEN_WIDTH;
        [self.segmentedControl segmentedControlSetSelectedIndexWithSelectedBlock:kPageIndex];
        // 重设选中位置
        [self.segmentedControl segmentedControlSetSelectedIndex:kPageIndex];}
}

-(void)leftItemClick:(id)sender{
    [self.navigationController   popViewControllerAnimated:YES];
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
