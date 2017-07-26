//
//  orderVC.m
//  football
//
//  Created by 雨停 on 2017/7/25.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "orderVC.h"

@interface orderVC ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrHeight;
@property (weak, nonatomic) IBOutlet UIImageView *alpayImg;
@property (weak, nonatomic) IBOutlet UIImageView *wxImg;
@property (weak, nonatomic) IBOutlet UIImageView *otherImg;

@end

@implementation orderVC
- (IBAction)orderPayStyle:(UIButton *)sender {
    if(sender.tag==0){
        self.alpayImg.image = Img(@"cheak");
        self.wxImg.image    = Img(@"nocheak");
        self.otherImg.image = Img(@"nocheak");
    }else if(sender.tag==1){
        self.alpayImg.image = Img(@"nocheak");
        self.wxImg.image    = Img(@"cheak");
        self.otherImg.image = Img(@"nocheak");

        
    }else if(sender.tag==2){
        self.alpayImg.image = Img(@"nocheak");
        self.wxImg.image    =  Img(@"nocheak");
        self.otherImg.image = Img(@"cheak");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubview];
    // Do any additional setup after loading the view from its nib.
}
-(void)setSubview{
    [self setNavLeftItemTitle:@"返回" andImage:nil];
    self.title =@"订单确认";
}
-(void)leftItemClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
-(void)updateViewConstraints{
    [super updateViewConstraints];
    self.scrHeight.constant =KScreenHeight-64-44;
}
@end
