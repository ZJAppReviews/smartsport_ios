//
//  myClassVC.m
//  football
//
//  Created by 雨停 on 2017/7/14.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "myClassVC.h"
#import "ABSSegmentCate.h"
@interface myClassVC ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)ABSSegmentCate  * seg;
@property (strong, nonatomic) UIScrollView *contentScrView;
@property (nonatomic,strong)UITableView    * leftTab;
@property (nonatomic,strong)UITableView    * rightTab;
@end

@implementation myClassVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubview];
}
-(void)setSubview{
    self.title =@"我的课程";
    [self setNavLeftItemTitle:@"返回" andImage:nil];
    [self setLine];
    NSArray * dataArray = @[@"青训课程",@"在线教案"];
    self.seg = [self setSegframe:CGRectMake(80, 64, SCREEN_WIDTH, 44) titleArr:dataArray space:160];
    [self.view addSubview:self.seg];
    
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
        tab.tag= i;
       // tab.delegate = self;
       // tab.dataSource = self;
        [self showPlaceholderViewWithImage:nil message:@"没有记录" buttonTitle:@"去看看" centerOffsetY:0 onSuperView:tab];
        [self.contentScrView addSubview:tab];
        if(i==0){
            //[tab registerClass:[mathCell class ] forCellReuseIdentifier:NSStringFromClass([mathCell  class])];
            self.leftTab = tab;
        }else{
           // [tab registerClass:[videoCell class ] forCellReuseIdentifier:NSStringFromClass([videoCell  class])];
            
            self.rightTab = tab;
        }
    }
    
    [_seg  segmentedControlSelectedWithBlock:^(ABSSegmentCate *segmentedControl, NSInteger selectedIndex) {
        NSLog(@"selectedIndex : %zd", selectedIndex);
        
        [self.contentScrView setContentOffset:CGPointMake(selectedIndex * SCREEN_WIDTH, 0) animated:YES];
    }];

}
#pragma mark - scrollView protocol methods
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if([scrollView isEqual:self.contentScrView]){
        NSInteger const kPageIndex = scrollView.contentOffset.x / SCREEN_WIDTH;
        // [self.segmentedControl segmentedControlSetSelectedIndexWithSelectedBlock:kPageIndex];
        // 重设选中位置
        [self.seg segmentedControlSetSelectedIndex:kPageIndex];
    }
}

/*- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([tableView isEqual:self.leftTab]){
        return 4;
    }else{
        return 4;}
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if([tableView isEqual:self.leftTab]){
        Class currentClass = [mathCell class];
        mathCell * cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = nil;
        return cell;
        
    }else {
        NSLog(@"wqewqewqewqew");
        Class currentClass = [videoCell class];
        videoCell * cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = nil;
        return cell;
        
    }
    
    ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
    
    //    [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
    
    ///////////////////////////////////////////////////////////////////////
    
    
}*/
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    if([tableView isEqual:self.leftTab]){
//        //    int index = indexPath.row % 5;
//        //    NSString *str = _textArray[index];
//        
//        // >>>>>>>>>>>>>>>>>>>>> * cell自适应步骤2 * >>>>>>>>>>>>>>>>>>>>>>>>
//        /* model 为模型实例， keyPath 为 model 的属性名，通过 kvc 统一赋值接口 */
//        return [tableView cellHeightForIndexPath:indexPath model:@"wqewqewq" keyPath:@"model" cellClass:[mathCell class] contentViewWidth:[self cellContentViewWith]];
//    }
//    else{
//        
//        return  [tableView cellHeightForIndexPath:indexPath model:@"wqewqewq" keyPath:@"model" cellClass:[videoCell class] contentViewWidth:[self cellContentViewWith]];
//    }
//}


- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)leftItemClick:(id)sender{
    [self.navigationController    popViewControllerAnimated:YES];
}

@end
