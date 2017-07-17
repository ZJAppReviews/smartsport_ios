//
//  starVC.m
//  football
//
//  Created by 雨停 on 2017/6/30.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "starVC.h"
#import "Header.h"
#import "starCollectionCell.h"
@interface starVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property  (nonatomic, strong)UICollectionView    * collecView;
@property  (nonatomic, strong)UICollectionViewFlowLayout *flowLayout;
@end

@implementation starVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubView];
    // Do any additional setup after loading the view.
}
-(void)setSubView{
    self.title = @"全部球星";
    self.flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.collecView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:self.flowLayout];
    self.collecView.delegate = self;
    self.collecView.dataSource = self;
    self.collecView.backgroundColor = [UIColor whiteColor];
    [self.collecView registerClass:[starCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collecView];
    
}

//设置分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView{
    
    return 1;
}

//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

//设置元素内容
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString  * identify =@"cell";
   starCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    return cell;
}
//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
//设置元素的的大小框
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{  //top, left, bottom, right;
    UIEdgeInsets top = {10,10,10,10};
    return top;
}
/** 头部的尺寸*/
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    
    return CGSizeMake(0, 0);
}

/** 顶部的尺寸*/
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    
    return CGSizeMake(0, 0);
}

//设置元素大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //NSLog(@"%f",(kDeviceHeight-88-49)/4.0);
    return CGSizeMake(KScreenWidth-20,160);
}

//点击元素触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",indexPath);
    //    DetailVideoViewController *detailVC = [[DetailVideoViewControlleralloc]init];
    //    [self.navigationControllerpushViewController:detailVCanimated:YES];
    //    [detailVC release];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
