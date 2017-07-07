//
//  ABSLoginVC.m
//  ABSHome
//
//  Created by ABS on 16/10/18.
//  Copyright © 2016年 ABS. All rights reserved.
//

#import "LoginVC.h"
#import "UIView+Frame.h"
#import "TimerButton.h"
#import "Header.h"
#import "NSString+ABSAdd.h"
#import "LogoTextField.h"
//#import "LogoAgreement.h"
//#import "paymentVC.h"

@interface LoginVC ()<UITextFieldDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UIButton    *loginBtn;
@property (nonatomic, strong) TimerButton *pinBtn;
@property (nonatomic, strong) UIButton    *exitBtn;

//@property (nonatomic, strong) LogoAgreement *agrerment;
@property (nonatomic, assign) BOOL   imgStatue;
@property (nonatomic,strong) UIImageView    * logoImg;
@property (nonatomic,strong) UITextField    * phoneNum;
@property (nonatomic,strong) UITextField    * cheakNum;
@end

@implementation LoginVC




- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubviews];
    
    
}


- (void)setSubviews {
    
    self.imgStatue = YES;
    [self.view addSubview:self.exitBtn];
    [self.view addSubview:self.logoImg];
    [self.view addSubview:self.phoneNum];
    [self.view addSubview:self.cheakNum];
    [self.view addSubview:self.pinBtn];
    [self addServiceAgreementLabel];
    [self.view addSubview:self.loginBtn];
}

 -(void)leftFoundation{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addServiceAgreementLabel {
    
 
       }

- (void)underLineTextClick {
    NSLog(@"协议界面");

}



//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    
//    
//    if (textField == self.tf) {
//        //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
//        if (range.length == 1 && string.length == 0) {
//            return YES;
//        }
//        //so easy
//        else if (self.tf.text.length >= 6) {
//            self.tf.text = [textField.text substringToIndex:6];
//            return NO;
//        }
//        
//    }
//    return [self validateNumber:string];
//}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == self.phoneNum) {
        //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
        if (range.length == 1 && string.length == 0) {
            return YES;
        }
        //so easy
        else if (self.phoneNum.text.length >= 11) {
            self.phoneNum.text = [textField.text substringToIndex:11];
            return NO;
        }
        
    }
    if (textField == self.cheakNum) {
                //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
                if (range.length == 1 && string.length == 0) {
                    return YES;
                }
                //so easy
                else if (self.cheakNum.text.length >= 6) {
                    self.cheakNum.text = [textField.text substringToIndex:6];
                    return NO;
                }
                
            }
    
    
    if(textField.tag==0){
    if (![string isEqualToString:@""])
    {
        _pinBtn.backgroundColor=mainColor;
        _pinBtn.userInteractionEnabled =YES;
        //self.breakVc.placholder .hidden = YES;
    }
    if ([string isEqualToString:@""] && range.location == 0 && range.length == 1)
    {
        _pinBtn.backgroundColor= gary221;
        _pinBtn.userInteractionEnabled =NO;
       //self.breakVc.placholder .hidden = NO;
    }
    }else if (textField.tag==1){
        if (![string isEqualToString:@""])
        {
            _loginBtn.backgroundColor=mainColor;
            _loginBtn.userInteractionEnabled =YES;
            //self.breakVc.placholder .hidden = YES;
        }
        if ([string isEqualToString:@""] && range.location == 0 && range.length == 1)
        {
            _loginBtn.backgroundColor=gary221;
            _loginBtn.userInteractionEnabled =NO;
            
           
        }

    }
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    if(textField.tag==0){
        _pinBtn.backgroundColor= gary221;
            _pinBtn.userInteractionEnabled =NO;
        
    }else if (textField.tag==1){
                    _loginBtn.backgroundColor=gary221;
            _loginBtn.userInteractionEnabled =NO;
        }

    
    return YES;
}
-(UIImageView *)logoImg{
    if(!_logoImg){
        _logoImg = [[UIImageView  alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-80)/2.0, 80, 80, 80)];
        _logoImg.layer.cornerRadius  = 40;
        _logoImg.backgroundColor = [UIColor redColor];
    }
    return _logoImg;
}
- (TimerButton *)pinBtn {
    if (!_pinBtn) {
        CGRect frame = CGRectMake(_cheakNum.right+10, _cheakNum.top, SCREEN_WIDTH-_cheakNum.frame.size.width-38 , kRowHeight);
        _pinBtn = [TimerButton buttonWithType:UIButtonTypeCustom];
        
        _pinBtn = [[TimerButton alloc] initWithFrame:frame title:@"获取验证码" durationTitle:@"重新获取" seconds:60 progressBlock:^(TimerButton *button, TimeState state, NSString *restTime) {
            if (state == TimeStart) {
                _pinBtn .backgroundColor = mainColor;
               // NSLog(@"计时开始");
            }
        }];
        if(self.phoneNum.text.length!=0){
            _pinBtn.backgroundColor=mainColor;
            _pinBtn.userInteractionEnabled =YES;
        }else{
        _pinBtn.userInteractionEnabled =NO;

            [_pinBtn setBackgroundColor:RGBColor(221, 221, 221)];}
        [_pinBtn addTarget:self action:@selector(pinBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _pinBtn.titleLabel.font = FontSize(13);
        [_pinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_pinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    }
    return _pinBtn;
}
-(UIButton * )exitBtn{
    if(!_exitBtn){
        _exitBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-50, 20, 30, 30)];
        [_exitBtn addTarget:self action:@selector(outLogo ) forControlEvents:UIControlEventTouchUpInside];
        _exitBtn.backgroundColor = [UIColor redColor];
    }
    return _exitBtn;
}
-(void)outLogo{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)sendABSPinRequest {
    
   //    [RequestManager  requestWithType:HttpRequestTypeGet urlString:[NSString stringWithFormat:@"https://api.baibaobike.com/v1/sms/send_login_code?mobi=%@",self.phoneNum.field.text] parameters:nil  successBlock:^(id response) {
//        NSLog(@"===============%@",response);
//        NSLog(@"%@",[response objectForKey:@"errmsg"]);
//    } failureBlock:^(NSError *error) {
//        
//    } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
//        
//    }];
    

}

- (void)pinBtnClick {
    
    if ([NSString isMobileNumber:self.phoneNum.text]) {
        [self sendABSPinRequest];
    } else {
        
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"请输入正确的手机号码！"
                                                       message:@""
                                                      delegate:self
                                             cancelButtonTitle:@"确定"
                                             otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        //_loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(14, _agrerment.bottom+30,SCREEN_WIDTH-28,40)];
//        [_loginBtn setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.3]];
        [_loginBtn setBackgroundColor:RGBColor(221, 221, 221)];
        [_loginBtn setTitle:@"开始" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _loginBtn.userInteractionEnabled=NO;
    }
    return _loginBtn;
}

- (void)loginBtnClick {
   
    if(self.imgStatue==NO){
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"请同意用车服务条款！"
                                                       message:@""
                                                      delegate:self
                                             cancelButtonTitle:@"确定"
                                             otherButtonTitles:nil, nil];
        [alert show];
    }else{
        
    if ([NSString isMobileNumber:self.phoneNum.text] && [NSString isIdentityNumber:self.cheakNum.text]) {
        
       // [self sendABSLoginRequest];
    } else {
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"手机号或验证码不正确！"
                                                       message:@""
                                                      delegate:self
                                             cancelButtonTitle:@"确定"
                                             otherButtonTitles:nil, nil];
        [alert show];
    }
}
}





   
@end
