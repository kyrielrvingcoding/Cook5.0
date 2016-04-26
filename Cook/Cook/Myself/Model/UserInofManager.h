//
//  UserInoManager.h
//  Cook
//
//  Created by lanou on 16/4/26.
//  Copyright © 2016年 class17. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInofManager : NSObject


+ (UserInofManager *)defaultManager;

//保留授权
+ (void)saveAuthority:(NSString *)authority;
//获取授权
+ (NSString *)getAuthority;
//取消授权
+ (void)cancelAuthority;
//用户id
+ (void)saveUserID:(NSNumber *)userID;
+ (NSNumber *)getUserID;
+ (void)cancelUserID;
@end
