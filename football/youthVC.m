//
//  youthVC.m
//  football
//
//  Created by 雨停 on 2017/6/27.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "youthVC.h"
#import "ABSSegmentCate.h"
#import "Header.h"
#import "youthCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "youthCollecCell.h"

@interface youthVC ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIScrollView *contentSrcView;
@property (nonatomic,strong)ABSSegmentCate * segmentedControl;
@property (nonatomic,strong)UITableView    * leftTab;
@property (nonatomic,strong)UICollectionView    * rightColl;
@end

@implementation youthVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSegmentedControl];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setSegmentedControl{
    [self setLine];
    CGFloat const kSegmentedControlHeight = 44;
    
    NSArray *dataArray = @[@"青训课程", @"在线教案"];
   
    
    
    self.segmentedControl = [self setSegframe:CGRectMake(45, 64, KScreenWidth-90, kSegmentedControlHeight) titleArr:dataArray space:90];
    [self.view addSubview:_segmentedControl];;
    [self.view addSubview:_segmentedControl];
    
        CGFloat const kScrollViewHeight =KScreenHeight -44-50-64;
    
       self.contentSrcView.contentSize = CGSizeMake(KScreenWidth * dataArray.count, kScrollViewHeight);
       self.contentSrcView.delegate = self;
    
       self.contentSrcView.pagingEnabled = YES;

  
            CGFloat left =  KScreenWidth;
            UITableView * tab = [[UITableView alloc]initWithFrame:CGRectMake(left, 0, KScreenWidth, kScrollViewHeight) style:UITableViewStylePlain];
            tab.separatorStyle = UITableViewCellSeparatorStyleNone;
            tab.delegate = self;
            tab.dataSource = self;
          [self.contentSrcView addSubview:tab];
           
                [tab  registerClass:[youthCell class] forCellReuseIdentifier:NSStringFromClass([youthCell class])];
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    self.rightColl = [[UICollectionView  alloc]initWithFrame:CGRectMake(left*2, 0, left, kScrollViewHeight) collectionViewLayout:layout];
        [self.contentSrcView addSubview:self.rightColl];
    
    [_segmentedControl segmentedControlSelectedWithBlock:^(ABSSegmentCate *segmentedControl, NSInteger selectedIndex) {
        NSLog(@"selectedIndex : %zd", selectedIndex);
         [self.contentSrcView setContentOffset:CGPointMake(selectedIndex * KScreenWidth, 0) animated:YES];
    }];
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
 
        Class currentClass = [youthCell class];
        youthCell * cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = nil;
        return cell;
        
    }
    ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
    
    //    [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
    
    ///////////////////////////////////////////////////////////////////////
    
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    int index = indexPath.row % 5;
//    NSString *str = _textArray[index];
    
    // >>>>>>>>>>>>>>>>>>>>> * cell自适应步骤2 * >>>>>>>>>>>>>>>>>>>>>>>>
    /* model 为模型实例， keyPath 为 model 的属性名，通过 kvc 统一赋值接口 */
        return [tableView cellHeightForIndexPath:indexPath model:@"wqewqewq" keyPath:@"model" cellClass:[youthCell class] contentViewWidth:[self cellContentViewWith]];
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

@end
