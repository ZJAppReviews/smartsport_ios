//
//  subjectVC.m
//  football
//
//  Created by 雨停 on 2017/6/30.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "subjectVC.h"
#import "youthCell.h"
#import "SDAutoLayout.h"
@interface subjectVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView      * tab;
@end

@implementation subjectVC

- (void)viewDidLoad {
    self.title = @"全部青训课程";
    [super viewDidLoad];
    [self setSubview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setSubview{
    self.tab = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self.view addSubview:self.tab];
    [self.tab registerClass:[youthCell class] forCellReuseIdentifier:NSStringFromClass([youthCell class])];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Class  currentClass = [youthCell class];
    youthCell  * cell =nil;
    cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model= nil;
    return  cell;
    
}
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
