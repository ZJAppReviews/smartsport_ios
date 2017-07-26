//
//  matchDetailVC.h
//  football
//
//  Created by 雨停 on 2017/7/26.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "XYBaseVC.h"

@interface matchDetailVC : XYBaseVC
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headTabHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomTabHeight;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
