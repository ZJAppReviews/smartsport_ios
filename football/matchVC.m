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

@interface matchVC ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrView;
@property  (nonatomic,strong)ABSSegmentCate  *segmentedControl;
@property (nonatomic,strong)UITableView    * leftTab;
@property (nonatomic,strong)UITableView    * rightTab;
@end

@implementation matchVC

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
        CGFloat const kSegmentedControlHeight = 44;
    
    NSArray *dataArray = @[@"赛事", @"直播"];
    self.segmentedControl = [[ABSSegmentCate alloc] initWithFrame:CGRectMake(45, 64, SCREEN_WIDTH-90, kSegmentedControlHeight) titleArray:dataArray];
    //_segmentedControl.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.1];
    // _segmentedControl.segmentedControlLineStyle = LLSegmentedControlLineStyle;
    if(dataArray.count<=4){
        _segmentedControl.segmentedControlTitleSpacingStyle = LLSegmentedControlTitleSpacingStyleWidthFixed;
        _segmentedControl.titleWidth = (SCREEN_WIDTH-90) /dataArray.count;
        
    }else{
        _segmentedControl.segmentedControlTitleSpacingStyle = LLSegmentedControlTitleSpacingStyleWidthAutoFit;
        
        
    }
    // lineWidthEqualToTextWidth 设置为YES, lineWidth 属性则不需设置
    _segmentedControl.lineWidthEqualToTextWidth = YES;
    _segmentedControl.textColor = [UIColor darkTextColor];
    _segmentedControl.selectedTextColor = [UIColor blueColor];
    _segmentedControl.font = [UIFont systemFontOfSize:14];
    _segmentedControl.selectedFont = [UIFont boldSystemFontOfSize:16];
    _segmentedControl.lineColor = [UIColor blueColor];
    _segmentedControl.lineHeight = 2.f;
    // segmentedControlTitleSpacingStyle 设置为 LLSegmentedControlTitleSpacingStyleSpacingFixed
    // 则不需要设置 titleWidth 属性
    _segmentedControl.titleSpacing = 30;
    _segmentedControl.defaultSelectedIndex = 0;
    // 分割线设置
    // _segmentedControl.showSplitLine = YES;
    _segmentedControl.splitLineSize = CGSizeMake(1, 25);
    [self.view addSubview:_segmentedControl];
    
        CGFloat const kScrollViewHeight =SCREENH_HEIGHT -44-50-64;
        self.contentScrView.contentSize = CGSizeMake(SCREEN_WIDTH * dataArray.count, kScrollViewHeight);
        self.contentScrView.delegate = self;
        self.contentScrView.pagingEnabled = YES;
     for (int i = 0; i < dataArray.count; i ++) {
            CGFloat left = i * SCREEN_WIDTH;
       
         UITableView * tab = [[UITableView alloc]initWithFrame:CGRectMake(left, 0, SCREEN_WIDTH, kScrollViewHeight) style:UITableViewStylePlain];
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
        
        [self.contentScrView setContentOffset:CGPointMake(selectedIndex * SCREEN_WIDTH, 0) animated:YES];
    }];
}

#pragma mark -
#pragma mark - scrollView protocol methods
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if([scrollView isEqual:self.contentScrView]){
    NSInteger const kPageIndex = scrollView.contentOffset.x / SCREEN_WIDTH;
    // [self.segmentedControl segmentedControlSetSelectedIndexWithSelectedBlock:kPageIndex];
    // 重设选中位置
    [self.segmentedControl segmentedControlSetSelectedIndex:kPageIndex];
    }
}
 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
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
    
    
}
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
@end
