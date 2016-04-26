//
//  MyselfUserInfoViewController.m
//  Cook
//
//  Created by lanou on 16/4/26.
//  Copyright © 2016年 class17. All rights reserved.
//

#import "MyselfUserInfoViewController.h"
#import "MySelfTableView.h"

@interface MyselfUserInfoViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) MySelfTableView *myselfTableView;

@end

@implementation MyselfUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myselfTableView = [[[NSBundle mainBundle] loadNibNamed:@"MySelfTableView" owner:nil options:nil] lastObject];
    _myselfTableView.dataSource = self;
    _myselfTableView.delegate = self;
    [self.view addSubview:_myselfTableView];
}

#pragma mark ----- 协议方法 -----
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *array = @[@"我的足迹", @"我的收藏", @"分享应用",@"清除缓存",@"建议、问题反馈",@"关于我们", @"推送通知"];
    static NSString *str = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.textLabel.text = array[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:20];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.imageView.image = [UIImage imageNamed:@"ms_caipu_level_un"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = [UIColor colorWithRed:226 / 255.0 green:233 / 255.0 blue:248/ 255.0 alpha:1.0];
        } else {
            cell.backgroundColor = [UIColor colorWithRed:195 / 255.0 green:204 / 255.0 blue:239 / 255.0 alpha:1.0];
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SCREENHEIGHT * 0.1;
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

@end
