//
//  matchDetailVC.m
//  football
//
//  Created by 雨停 on 2017/7/26.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "matchDetailVC.h"
#import "sampleVideoCell.h"
#import "meCell.h"
#import "SDAutoLayout.h"
#import "sampleMatchCell.h"
#import "signupVC.h"
@interface matchDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *bottomTab;
@property (weak, nonatomic) IBOutlet UITableView *myTab;
@property (weak, nonatomic) IBOutlet UIView *headView;
@property (nonatomic,strong)NSMutableArray * arr;
@property (nonatomic,strong)UILabel        * styleL;
@property (nonatomic,strong)UILabel        * numL;
@property (nonatomic,strong)UILabel        * numS;
@property (nonatomic,strong)UILabel        * price;
@end

@implementation matchDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setsubview];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)updateViewConstraints{
    [super updateViewConstraints];
    self.scrHeight.constant = KScreenHeight-64-44;
}
-(void)setsubview{
    self.automaticallyAdjustsScrollViewInsets   = NO;
    self.styleL = [XYUIKit labelWithTextColor:mainColor numberOfLines:0 text:@" U16 " fontSize:13];
    self.styleL.layer.borderColor =mainColor.CGColor;
    self.styleL.layer.borderWidth =1;
    self.styleL.layer.cornerRadius=2;
    
    self.numL = [XYUIKit labelWithTextColor:mainColor numberOfLines:0 text:@" 11人制 " fontSize:13];
    self.numL.layer.borderColor =mainColor.CGColor;
    self.numL.layer.borderWidth =1;
    self.numL.layer.cornerRadius=2;
    self.numS = [XYUIKit labelWithTextColor:KGrayColor numberOfLines:0 text:@"还剩8个名额" fontSize:13];
    
    self.price = [XYUIKit labelWithTextColor:KmainRed numberOfLines:0 text:@"¥999" fontSize:17];
    
    [self.headView sd_addSubviews:@[self.styleL,self.numL,self.price,self.numS]];
    self.styleL.sd_layout
    .leftSpaceToView(self.headView, 20)
    .bottomSpaceToView(self.headView, 25)
    .heightIs(18);
    [self.styleL setSingleLineAutoResizeWithMaxWidth:80];
    
    self.numL.sd_layout
    .leftSpaceToView(self.styleL, 8)
    .centerYEqualToView(self.styleL)
    .heightIs(18);
    [self.numL setSingleLineAutoResizeWithMaxWidth:80];
    
    self.price.sd_layout
    .rightSpaceToView(self.headView, 20)
    .heightIs(24)
    .centerYEqualToView(self.styleL);
    [self.price setSingleLineAutoResizeWithMaxWidth:80];
    
    self.numS.sd_layout
    .rightSpaceToView(self.price, 6)
    .heightIs(18)
    .centerYEqualToView(self.styleL);
    [self.numS setSingleLineAutoResizeWithMaxWidth:80];
    
    self.arr = [NSMutableArray array];
    NSArray * arrInfo = @[
                      @{@"title":@"参赛球队",@"detaile":@"",@"img":@"Steam"},
                      @{@"title":@"数据分析",@"detaile":@"",@"img":@"Analysis"},
                      @{@"title":@"赛程表",@"detaile":@"",@"img":@"Schedule"}
                     
                      
                      ];
    [self.arr addObjectsFromArray:arrInfo];
    [self.myTab registerClass:[meCell class] forCellReuseIdentifier:NSStringFromClass([meCell class])];
    [self.myTab registerNib:[UINib nibWithNibName:@"sampleMatchCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([ sampleMatchCell class])];
    
    [self.bottomTab  registerClass:[sampleVideoCell class] forCellReuseIdentifier:NSStringFromClass([sampleVideoCell class])];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([tableView isEqual:self.myTab]){
        if(section==1){
              return self.arr.count;
        }else if(section==0){
            //self.myTab.autoresizesSubviews =NO;
            //self.headTabHeight.constant =513+0*80;
            return 0;
            
        }
       
        
    }else if([tableView isEqual:self.bottomTab]){
        return 3;
    }
    return 0;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if([tableView isEqual:self.myTab]){
        return 2;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if([tableView isEqual:self.myTab]){
        if(indexPath.section==1){
            return 44;
        }else{
            return 80;
        }
        
    }else if([tableView isEqual:self.bottomTab]){
        return 110;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if([tableView isEqual:self.myTab]){
        if(indexPath.section==1){
        meCell * cell =nil;
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([meCell class])];
        cell.dic = self.arr[indexPath.row];
        cell.selectionStyle  = UITableViewCellSelectionStyleNone;
            return  cell;
            
        }
        else {
          sampleMatchCell       * cell =nil;
          cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([sampleMatchCell   class])];
          cell.selectionStyle  = UITableViewCellSelectionStyleNone;
            return  cell;
        }
    }else if([tableView isEqual:self.bottomTab]){
        sampleVideoCell *cell = nil;
        cell = [tableView   dequeueReusableCellWithIdentifier:NSStringFromClass([sampleVideoCell class])];
        cell.modelright=nil;
        cell.selectionStyle  = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
    
}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    if ([tableView isEqual:self.myTab]) {
//
//        if(section==0){
//
//            return 10;
//        }
//
//    }
//        return 0.001;
//}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden=NO;
}
- (IBAction)backRootView:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)collect:(UIButton *)sender {
}
- (IBAction)shear:(UIButton *)sender {
}
- (IBAction)pushInfo:(UIButton *)sender {
    signupVC * sign = [[signupVC alloc]init];
    [self.navigationController pushViewController:sign animated:YES];
}
- (IBAction)photoView:(UIButton *)sender {
}
@end
