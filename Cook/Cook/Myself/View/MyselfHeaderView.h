//
//  MyselfHeaderView.h
//  Cook
//
//  Created by lanou on 16/4/25.
//  Copyright © 2016年 class17. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyselfIDModel.h"

typedef void(^SendInfo)(MyselfIDModel *model);

@interface MyselfHeaderView : UIView

@property (strong, nonatomic) IBOutlet UIImageView *headerImageview;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (strong, nonatomic) IBOutlet UILabel *genderLabel;
@property (strong, nonatomic) IBOutlet UILabel *jionTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *careLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UIButton *careButton;
@property (strong, nonatomic) IBOutlet UIButton *fansButton;

@property (nonatomic, copy) SendInfo sendmodel;

@property (nonatomic, strong) NSMutableArray *MyselfIDArray;
@property (nonatomic, strong) MyselfIDModel *model;

@end
