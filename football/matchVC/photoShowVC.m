//
//  photoShowVC.m
//  football
//
//  Created by 雨停 on 2017/7/27.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "photoShowVC.h"
#import "photoShowCell.h"

@interface photoShowVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView  * collecView;
@property (nonatomic,strong)UICollectionViewFlowLayout *flowLayer;

@end

@implementation photoShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self subView];
    // Do any additional setup after loading the view.
}
- (instancetype)init{
    if(self = [super init]){
        self.arr = [NSMutableArray array];
    }
    return self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)subView{
    [self setNavLeftItemTitle:@"返回" andImage:nil];
    self.title = @"赛事图片";
    [self setNavRightItemTitle:@"上传图片" andImage:nil];
    
    self.flowLayer = [[UICollectionViewFlowLayout alloc]init];
    [self.flowLayer setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collecView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight ) collectionViewLayout:self.flowLayer];
    self.collecView.delegate = self;
    self.collecView.dataSource = self;
    [self.collecView registerClass:[photoShowCell class] forCellWithReuseIdentifier:@"cell"];
    self.collecView.backgroundColor = [UIColor whiteColor];
    //self.collecView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.collecView];

}
-(void)leftItemClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
//设置分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView{
    
    return 1;
}

//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arr.count;
}

//设置元素内容
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify =@"cell";
    
    photoShowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.model =self.arr[indexPath.row];
    
    return cell;
}
//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 8;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 8;
}
//设置元素的的大小框
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{  //top, left, bottom, right;
    UIEdgeInsets top = {8,8,8,8};
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
    return CGSizeMake((KScreenWidth-32)/3.0,(KScreenWidth-32)/3.0);
}

//点击元素触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",indexPath);
    //    DetailVideoViewController *detailVC = [[DetailVideoViewControlleralloc]init];
    //    [self.navigationControllerpushViewController:detailVCanimated:YES];
    //    [detailVC release];
}


@end
