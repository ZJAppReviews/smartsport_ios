//
//  addTeamVC.m
//  football
//
//  Created by 雨停 on 2017/7/27.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "addTeamVC.h"
#import "addTitleCell.h"
#import "addpersonCell.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import "ZYInputAlertView.h"
#import "addPlayerVC.h"

@interface addTeamVC ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate, UINavigationControllerDelegate,infoDicdelegate>
@property (nonatomic,strong) UITableView * myTab;
@property (nonatomic,strong) NSMutableArray * arr0;
@property (nonatomic,strong) NSMutableArray * arr1;
@property (nonatomic,strong) NSMutableArray * arr2;
@property (nonatomic,strong) NSMutableArray * arrGroup;
@property (nonatomic,strong)  UIImageView   * teamImg;
@property (nonatomic,strong)  NSMutableArray  * member;
@property (nonatomic,strong)  UIImagePickerController *imagePickerController;

@property (nonatomic,copy)NSString * name;
@end

@implementation addTeamVC
-(id)init{
    if(self = [super init]){
        self.from =[NSString string];
        self.style = [NSString string];
    }
    return self;
}
- (void)viewDidLoad {
   // [self set];
    [self setSubPhotos];
    self.member =[NSMutableArray array];
    self.arr0 =[NSMutableArray array];
    self.arr1 =[NSMutableArray array];
    
    self.arr2 =[NSMutableArray array];
    
    self.arrGroup =[NSMutableArray array];
    
    [super viewDidLoad];
    [self setSubview];
    // Do any additional setup after loading the view.
}
-(void)setSubview{
    [self setNavLeftItemTitle:@"返回" andImage:nil];
    self.title = @"添加新球队";    self.myTab = [[UITableView alloc]
initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-44) style:UITableViewStylePlain];
    [self.view addSubview:self.myTab];
    self.myTab.delegate =self;
    self.myTab.dataSource =self;
    self.myTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.myTab registerClass:[addTitleCell class] forCellReuseIdentifier:NSStringFromClass([addTitleCell class])];
    [self.myTab registerNib:[UINib nibWithNibName:@"addpersonCell" bundle:nil] forCellReuseIdentifier:@"addperson"];
    self.myTab.tableFooterView =[self setBottomView];
    self.myTab.tableHeaderView =[self setHeadView];
    UIButton  * btn =[XYUIKit buttonWithBackgroundColor:mainColor titleColor:KWhiteColor title:@"保存" fontSize:20];
    [btn addTarget:self action:@selector(baocunTeam) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, KScreenHeight-44, KScreenWidth, 44);
    [self.view addSubview:btn];
}

- (void)setInfo :(NSDictionary * )info{
    [self requestType:HttpRequestTypePost
                  url:nil
           parameters:info
         successBlock:^(BaseModel *response) {
             
         } failureBlock:^(NSError *error) {
}];

}
-(void)baocunTeam{
    
       }


-(void)leftItemClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * arr = self.arrGroup[section];
    return   arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==2){
        addpersonCell *cell =nil;
        cell = [tableView dequeueReusableCellWithIdentifier:@"addperson"];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSArray * arr = self.arrGroup[indexPath.section];
        cell.dic =arr[indexPath.row];
        return cell;
    }else {
    addTitleCell *cell =nil;
    cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([addTitleCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSArray * arr = self.arrGroup[indexPath.section];
    cell.detaile.text =[arr[indexPath.row] objectForKey:@"detaile"];
    cell.name   .text =[arr[indexPath.row] objectForKey:@"title"];
        return cell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arrGroup.count;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView  alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 40)];
    view.layer.borderWidth=0.1;
    view . backgroundColor = KRgb(0.91, 0.91, 0.91);
    UILabel * lab = [XYUIKit labelWithBackgroundColor:KClearColor textColor:KGrayColor textAlignment:NSTextAlignmentLeft numberOfLines:0 text:nil fontSize:13];
    [view addSubview:lab];
    lab.frame = CGRectMake(20, 8, 200, 32);
    if(section==1){
        lab.text =@"教练";
    }else if(section==2){
        lab.text =@"球员";
    }
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section    {
    return 0.00001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section    {
    if(section==1){
    return 40;
    }else if(section==2){
        return 40;
    }
    return 0.00001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section !=2){
        __block typeof(self) weakSelf = self;
        ZYInputAlertView *alertView = [ZYInputAlertView alertView];
        alertView.inputTextView.keyboardType = UIKeyboardTypeNumberPad;
        __block NSArray * arr =self.arrGroup[indexPath.section];
        NSMutableDictionary *dicInfo = [NSMutableDictionary dictionaryWithDictionary: arr[indexPath.row]];
        alertView.placeholder =[dicInfo objectForKey:@"title"] ;
      
        [alertView confirmBtnClickBlock:^(NSString *inputString) {
       
        if(indexPath.section==0){
        [weakSelf setInfo:@{    @"action"   :@"editMyTeam",
                                @"team_id"  :self.style,
                                @"team_name":inputString}];
        [dicInfo  setValue:[NSString stringWithFormat:@"%@", inputString] forKey:@"detaile"];
        [weakSelf.arr0 setObject:dicInfo  atIndexedSubscript:indexPath.row];
        [weakSelf.arrGroup setObject:weakSelf.arr0 atIndexedSubscript:indexPath.section];
            [weakSelf.myTab reloadData];
        }else if(indexPath.section==1){
            if (indexPath.row==0) {
                
                 if(self.member.count!=0){
                    
                      for (NSDictionary *dic  in self.member) {
                          if([[dic objectForKey:@"type"] isEqualToString:@"2"]){
                              [weakSelf setInfo:@{@"action":@"editMyTeam",
                                                @"type":@"2",
                                                @"team_id":self.style,
                                                @"name":inputString,
                                                @"member_id":[dic objectForKey:@"id"]
                                                }];

                        }
                    }
                                    }else{
                    [weakSelf setInfo:@{@"action":@"editMyTeam",
                                        @"type":@"2",
                                        @"team_id":self.style,
                                        @"name":inputString}];
                }
            }else if(indexPath.row==1){
                if(self.member.count!=0){
                    
                    for (NSDictionary *dic  in self.member) {
                        if([[dic objectForKey:@"name"] isEqualToString:[dicInfo objectForKey:@"detaile"]]){
                            [weakSelf setInfo:@{@"action":@"editMyTeam",
                                                @"type":@"1",
                                                @"team_id":self.style,
                                                @"name":inputString,
                                                @"member_id":[dic objectForKey:@"id"]
                                                }];
                            
                        }
                    }
                }else{
                  
                    [weakSelf setInfo:@{@"action":@"editMyTeam",
                                        @"type":@"1",
                                        @"team_id":self.style,
                                        @"name":inputString}];
                }

                
                
                
                
                
            }else if(indexPath.row==2){
                if(self.member.count!=0){
                    
                    for (NSDictionary *dic  in self.member) {
                        if([[dic objectForKey:@"name"] isEqualToString:[dicInfo objectForKey:@"detaile"]]){
                            [weakSelf setInfo:@{@"action":@"editMyTeam",
                                                @"type":@"1",
                                                @"team_id":self.style,
                                                @"name":inputString,
                                                @"member_id":[dic objectForKey:@"id"]
                                                }];
                            
                        }
                    }
                }else{
                    [weakSelf setInfo:@{@"action":@"editMyTeam",
                                        @"type":@"1",
                                        @"team_id":self.style,
                                        @"name":inputString}];
                }
            }
            [dicInfo  setValue:[NSString stringWithFormat:@"%@", inputString] forKey:@"detaile"];
            [weakSelf.arr1 setObject:dicInfo  atIndexedSubscript:indexPath.row];
            [weakSelf.arrGroup setObject:weakSelf.arr1 atIndexedSubscript:indexPath.section];
            [weakSelf.myTab reloadData];
        }
       }];
            [alertView show];
    }else  if(indexPath.section ==2){
        
        addPlayerVC * play = [[addPlayerVC alloc]init];
        play.dic =self.arr2[indexPath.row];
        play.playerInfodelegate =self;
        play.teamId =self.style;
        [self.navigationController pushViewController:play animated:YES];
    }
 }
-(UIView *)setBottomView{
    UIView * bottom = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 80)];
    bottom. backgroundColor = KRgb(0.91, 0.91, 0.91);
    UIButton  * btn =[XYUIKit buttonWithBackgroundColor:KClearColor titleColor:KGrayColor titleHighlightColor:KClearColor title:@"+添加新成员" fontSize:17];
    btn .frame = CGRectMake(40, 18, KScreenWidth-80, 44);
    btn.layer .borderWidth =1;
    btn.layer.borderColor =KGrayColor.CGColor;
    [bottom   addSubview:btn];
    [btn addTarget: self  action:@selector(writeInfo:) forControlEvents:UIControlEventTouchUpInside];
    return bottom  ;
}
- (void)writeInfo:(UIButton *)sender{
    addPlayerVC * play = [[addPlayerVC alloc]init];
    play.playerInfodelegate =self;
    play.from=@"new";
    play.teamId =self.style;
    [self.navigationController pushViewController:play animated:YES];
}
-(void)setPlayerInfo:(NSString *)str{
    self.from=str;
}
-(UIView * )setHeadView{
    UIView * head = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 102)];
    self. teamImg = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 71, 71)];
    self.teamImg.layer.cornerRadius =35.5;
    self.teamImg.layer.masksToBounds = YES;
    [head addSubview:self.teamImg];
    self.teamImg.image = Img(@"teamTag");
    UILabel * teamTag = [[UILabel alloc]initWithFrame:CGRectMake(105, 38, 80, 24)];
    teamTag.text = @"球队标志";
    [head addSubview:teamTag];
    UIImageView *right =[[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth-40, 45, 8, 13)];
    right.image = Img(@"Arrow");
    [head addSubview: right];
    UIImageView * line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 101, KScreenWidth, 1)];
    line.image =Img(@"line");
    [head addSubview:line];
    UIButton *btn = [[UIButton    alloc]initWithFrame:head.frame];
    [btn addTarget:self action:@selector(selectphoto ) forControlEvents:UIControlEventTouchUpInside];
    [head addSubview:btn];
    return head;
}
-(void)selectphoto{
    [self getPhoto];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  //Dispose of any resources that can be recreated.
}

-(void)setSubPhotos{
    _imagePickerController = [[UIImagePickerController alloc] init];
    _imagePickerController.delegate = self;
    _imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    _imagePickerController.allowsEditing = YES;
}

#pragma 相机
- (void)selectImageFromCamera
{
    _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    //录制视频时长，默认10s
    _imagePickerController.videoMaximumDuration = 15;
    
    _imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage];
    
    _imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    [self presentViewController:_imagePickerController animated:YES completion:nil];
}
#pragma 相册
- (void)selectImageFromAlbum
{
    //NSLog(@"相册");
    _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:_imagePickerController animated:YES completion:nil];
}
-(void)getPhoto {
    UIAlertController *alert =[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self selectImageFromAlbum];
    }];
    UIAlertAction *act2 = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self selectImageFromCamera];
    }];
    UIAlertAction *act3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:act1];
    [alert addAction:act2];
    [alert addAction:act3];
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}

#pragma 代理方法

//适用获取所有媒体资源，只需判断资源类型
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    //判断资源类型
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]){
        //  [  setImage:info[UIImagePickerControllerEditedImage] forState:UIControlStateNormal];
        //如果是图片
        UIImage * image = info[UIImagePickerControllerEditedImage];
        self.teamImg .image =image;         //压缩图片
        //NSData *fileData = UIImageJPEGRepresentation(image, 1.0);
        
        //保存图片至相册
        //  UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        //上传图片
        //  [self uploadImageWithData:fileData];
        
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated{
      appInfoModel * model = [appInfoModel yy_modelWithDictionary:[store getObjectById:@"urlInfo" fromTable:@"person"]];
    if([self.from isEqualToString:@"setup"]){
        [self.arr0 addObject:@{@"title":@"球队名字",@"detaile":@"球队名"}];
        [self.arr1 addObject:@{@"title":@"主教练",@"detaile":@"主教练名"}];
        [self.arr1 addObject:@{@"title":@"助理教练",@"detaile":@"助理教练名"}];
        [self.arr1 addObject:@{@"title":@"助理教练",@"detaile":@"助理教练名"}];
        [self.arrGroup addObject:self.arr0];
        [self.arrGroup addObject:self.arr1];
        [self.arrGroup addObject:self.arr2];
        
        
        
        

                                      
              [self requestType:HttpRequestTypePost
                            url:nil
                     parameters:@{ @"action"    : @"editMyTeam"}
                   successBlock:^(BaseModel *response) {
                       self.style =response.team_id;
                  
              } failureBlock:^(NSError *error) {
                  
              }];
                                         
          

        
        return;
    }else{
      
        NSMutableDictionary  * dic =[NSMutableDictionary  dictionary];
        
        
        [ dic addEntriesFromDictionary:@{
                                         @"client_id" : model.app_key,
                                         @"state" : model.seed_secret,
                                         @"access_token" :model.access_token,
                                         @"action"    : @"getMyTeamDetail",
                                         @"team_id" : self.style

                                         
                                              }
         ];
        [RequestManager requestWithType:HttpRequestTypePost
                              urlString:model.source_url
                             parameters:dic
                           successBlock:^(id response){
                               NSLog(@"%@",response);
                               
                               [self.arr0 removeAllObjects];
                               [self.arr1 removeAllObjects];
                               [self.arr2 removeAllObjects];
                               [self.member removeAllObjects];
                               [self.arrGroup removeAllObjects];
                               
                               [self.arr0 addObject:@{@"title":@"球队名字",@"detaile":[[response objectForKey:@"data"] objectForKey:@"team_name"]}];
                               
                              // [self.arr1 addObject:@{@"title":@"主教练",@"detaile":@"主教练名"}];
                              // [self.arr1 addObject:@{@"title":@"助理教练1",@"detaile":@"助理教练名"}];
                              // [self.arr1 addObject:@{@"title":@"助理教练2",@"detaile":@"助理教练名"}];
                               [self.arrGroup addObject:self.arr0];
                               [self.arrGroup addObject:self.arr1];
                               NSMutableArray * arr =[NSMutableArray array];
                               if([[response objectForKey:@"data"] objectForKey:@"members"]){
                             
                                   [arr addObjectsFromArray:[[response objectForKey:@"data"] objectForKey:@"members"]];
                                   for (NSDictionary *dic in arr) {
                            if([[dic objectForKey:@"type"]isEqualToString:@"2"]){
                               [self.arr1 insertObject:@{@"title":@"主教练",@"detaile":  [dic objectForKey:@"name"]} atIndex:0];
                                [self.member addObject:dic];
                            }
                                       
                               else if([[dic objectForKey:@"type"]isEqualToString:@"1"])
                                {
                                    [self.arr1 addObject:@{@"title":@"助理教练",@"detaile":  [dic objectForKey:@"name"]}];
                                     [self.member addObject:dic];
                                   
                                }
                                       
                                  else    if([[dic objectForKey:@"type"]isEqualToString:@"0"]){
                                        [self.arr2 addObject:dic];}
                                   }
                               }
                              
                               [self.arrGroup addObject:self.arr2];
                               [self.myTab reloadData];
                           }failureBlock:^(NSError *error) {
                               
                           } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
                               
                           }];
        
        
 
    }
   
    
    }

@end
