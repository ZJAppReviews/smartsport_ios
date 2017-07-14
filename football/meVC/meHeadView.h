//
//  meHeadView.h
//  football
//
//  Created by 雨停 on 2017/6/29.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef   void (^setInfo) ();
@interface meHeadView : UIView
@property (weak, nonatomic) IBOutlet UIButton *nameBtn;
@property (weak, nonatomic) IBOutlet UIButton *vipBtn;
@property (weak, nonatomic) IBOutlet UIButton *height;
@property (weak, nonatomic) IBOutlet UIButton *weight;
@property (weak, nonatomic) IBOutlet UIButton *foot;
@property (nonatomic, copy) setInfo   setInfoBlock;
@end
