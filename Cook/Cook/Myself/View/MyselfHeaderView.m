//
//  MyselfHeaderView.m
//  Cook
//
//  Created by lanou on 16/4/25.
//  Copyright © 2016年 class17. All rights reserved.
//

#import "MyselfHeaderView.h"
#import "CYloginRegisterViewController.h"
#import "HomeNewUserModel.h"
#import "HomeMoreCookBooksModel.h"


@implementation MyselfHeaderView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT * 0.4);
        [self requestData];
        [self createBackgroundViewAndHeaderView];
    }
    return self;
}

#pragma mark ---- 懒加载 -----
- (NSMutableArray *)MyselfIDArray {
    if (!_MyselfIDArray) {
        self.MyselfIDArray = [NSMutableArray array];
    }
    return _MyselfIDArray;
}


#pragma mark ---- 数据请求 ----
- (void)requestData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://www.xdmeishi.com/index.php?m=mobile&c=index&a=getMyDynamics&id=902&pageNum=1&pageSize=20" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                NSLog(@"--------%@", dic);
        NSArray *dataArray = dic[@"data"];
        
        for (NSDictionary *IDDic in dataArray) {
            MyselfIDModel *model = [[MyselfIDModel alloc] init];
            [model setValuesForKeysWithDictionary:IDDic];
            [_MyselfIDArray addObject:model];
            
            //
            NSDictionary *coobookDic = IDDic[@"cookbook"];
            
            HomeMoreCookBooksModel *cookbookModel = [[HomeMoreCookBooksModel alloc] init];
            [cookbookModel setValuesForKeysWithDictionary:coobookDic];
            model.cookbook = cookbookModel;
            //
            NSDictionary *referrerDic = IDDic[@"operator"];
            HomeNewUserModel *usermodel = [[HomeNewUserModel alloc] init];
            [usermodel setValuesForKeysWithDictionary:referrerDic];
            model.userModel = usermodel;
            
            
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error is %@",error);
    }];
}

#pragma mark ----- 我的背景和头像 --------
- (void)createBackgroundViewAndHeaderView {
    
    //########之后改
    UIImageView * backgroundImageView = (UIImageView *)[self viewWithTag:3000];
    backgroundImageView.image = [UIImage imageNamed:@"test"];
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height + 20);
    effectView.alpha = 0.6;
    [backgroundImageView addSubview:effectView];

    UIImageView *headerImageview = (UIImageView *)[self viewWithTag:3001];
    headerImageview.image = [UIImage imageNamed:@"test"];
    UIButton *careButton = (UIButton *)[self viewWithTag:2000];
    careButton.backgroundColor = [UIColor colorWithRed:181 / 255.0 green:164 / 255.0 blue:224 / 255.0 alpha:1.0];
    //button添加事件
    [careButton addTarget:self action:@selector(care:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *fansButton = (UIButton *)[self viewWithTag:2001];
//    fansButton.backgroundColor = [UIColor colorWithRed:239 / 255.0 green:170 / 255.0 blue:17 / 255.0 alpha:1.0];
    fansButton.backgroundColor = careButton.backgroundColor;
    //button添加事件
    [fansButton addTarget:self action:@selector(fans:) forControlEvents:UIControlEventTouchUpInside];
    
    //轻点头像，跳转到设置到个人设置界面
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(personalSet:)];
    [headerImageview addGestureRecognizer:tap];

}
#pragma mark ----- action -------

//跳转到“我的关注”或者@“TA的关注”(没有登录时，跳转到登录)
- (void)care:(UIButton *)button {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"点击" object:nil];
}
//跳转到“我的粉丝”或者@“TA的粉丝”(没有登录时，跳转到登录)
- (void)fans:(UIButton *)button {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"点击" object:nil];
    
}

//轻点头像，跳转到设置到个人设置界面(没有登录时，跳转到登录)
- (void)personalSet:(UITapGestureRecognizer *)tap {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"点击" object:nil];
}



@end
