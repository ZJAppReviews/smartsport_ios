//
//  leftCollecCell.m
//  football
//
//  Created by 雨停 on 2017/6/28.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "leftCollecCell.h"
#import "XYUIKit.h"
#import "Masonry.h"
#import "Header.h"
#import "inforleftCollectionCell.h"
@interface leftCollecCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UILabel  *title;
@property (nonatomic,strong)UIButton *btn;
@property (nonatomic,strong)UILabel  *bottom;
@property (nonatomic,strong)UICollectionView  * collecView;
@property (nonatomic,strong)UICollectionViewFlowLayout *flowLayer;
@end
@implementation leftCollecCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setSubView];
    }
    return self;
}
-(void)setSubView{
  
    self.title   = [ XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft numberOfLines:1 text:@"最新青训课程" fontSize:13];
    self.title.frame = CGRectMake(10, 5, (SCREEN_WIDTH-20)/2.0, 20);
    [self.contentView addSubview:self.title];
    
   
    self.btn = [XYUIKit buttonWithBackgroundColor:[UIColor clearColor] titleColor:[UIColor blueColor]  title:@"全部课程" fontSize:13];
    self.btn.frame = CGRectMake(SCREEN_WIDTH-90, 5,80, 20);
    [self.btn addTarget:self action:@selector(getBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview: self.btn];
    self.flowLayer = [[UICollectionViewFlowLayout alloc]init];
    [self.flowLayer setScrollDirection:UICollectionViewScrollDirectionHorizontal  ];
    self.collecView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, 80) collectionViewLayout:self.flowLayer];
    self.collecView.delegate = self;
    self.collecView.dataSource = self;
    [self.collecView registerClass:[inforleftCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    self.collecView.backgroundColor = [UIColor whiteColor];
    self.collecView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:self.collecView];
    
    self.bottom  = [XYUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft numberOfLines:1 text:@"青年资讯" fontSize:12];
    self.bottom.frame = CGRectMake(10, 120, SCREEN_WIDTH-20, 20);
    [self.contentView addSubview:self.bottom];
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 139, SCREEN_WIDTH, 1)];
    line.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:line];
    
    
    
}
-(void)getBtn{
    if(self.blockBtn){
        self.blockBtn(self.btn);
    }
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
    static NSString *identify =@"cell";
    inforleftCollectionCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
  
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
    UIEdgeInsets top = {0,10,0,10};
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
    return CGSizeMake(SCREEN_WIDTH*0.6,80);
}

//点击元素触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",indexPath);
    //    DetailVideoViewController *detailVC = [[DetailVideoViewControlleralloc]init];
    //    [self.navigationControllerpushViewController:detailVCanimated:YES];
    //    [detailVC release];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
