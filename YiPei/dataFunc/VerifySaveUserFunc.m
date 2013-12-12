//
//  VerifySaveUserFunc.m
//  YiPei
//
//  Created by lee on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "VerifySaveUserFunc.h"
#import "userDataManager.h"
#import "model.h"
@implementation VerifySaveUserFunc
@synthesize delegate;
@synthesize delegate_save;

-(void)getVerifyUser:(NSString *) mobile;
{
    NetCommand *command = [[NetCommand alloc] init];
    [command.paramDict setObject:@"Login" forKey:@"m"];
    [command.paramDict setObject:@"sendVerifyCode" forKey:@"a"];
    [command.paramDict setObject:mobile forKey:@"mobile"];
    if (![userDataManager sharedUserDataManager].uID) {
        [command.paramDict setObject:@"0" forKey:@"uid"];

    }else
    {
        [command.paramDict setObject:[userDataManager sharedUserDataManager].uID forKey:@"uid"];
    }
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getVerifyUser success!");
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didVerifyUserSuccess:)]) {
            [self.delegate performSelector:@selector(didVerifyUserSuccess:) withObject:command.data];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getVerifyUser err!");
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didVerifyUserFailed:)]) {
            [self.delegate performSelector:@selector(didVerifyUserFailed:) withObject:command.errorMsg];
        }
    }

}

-(void)saveInitUserInfo:(NSString *)companyName Prov:(NSString *)province City:(NSString *)ct District:(NSString *)dis Addr:(NSString *)addr Mobile:(NSString *)mob Contact:(NSString *)con Code:(NSString *)code
{
    NetCommand *command = [[NetCommand alloc] init];
    
    [command.paramDict setObject:@"Login" forKey:@"m"];
    [command.paramDict setObject:@"saveClientInfo" forKey:@"a"];
    [command.paramDict setObject:companyName forKey:@"companyName"];
    [command.paramDict setObject:province forKey:@"province"];
    [command.paramDict setObject:ct forKey:@"city"];
    [command.paramDict setObject:dis forKey:@"district"];
    [command.paramDict setObject:addr forKey:@"companyAddress"];
    [command.paramDict setObject:mob forKey:@"mobile"];
    [command.paramDict setObject:con forKey:@"contact"];
    [command.paramDict setObject:code forKey:@"code"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"saveInitUserInfo success!");
        MyVerify *ver = [[MyVerify alloc] init];
        ver.companyName=companyName;
        ver.province=province;
        ver.city=ct;
        ver.district=dis;
        ver.companyAddress=addr;
        ver.mobile=mob;
        ver.contact=con;
        ver.code=code;
        [userDataManager sharedUserDataManager].ver= ver;
        NSDictionary *info = (NSDictionary *)command.data;
        [userDataManager sharedUserDataManager].uID= [info valueForKey:@"user_id"];
        [userDataManager sharedUserDataManager].myName= [info valueForKey:@"user_name"];
        [userDataManager sharedUserDataManager].clientID= [info valueForKey:@"client_id"];
        [userDataManager sharedUserDataManager].regcityID= [info valueForKey:@"city"];

        if (self.delegate_save &&[self.delegate_save respondsToSelector:@selector(didSaveUserSuccess:)]) {
            [self.delegate_save performSelector:@selector(didSaveUserSuccess:) withObject:command.data];
            
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"saveInitUserInfo err!");
        if (self.delegate_save &&[self.delegate_save respondsToSelector:@selector(didSaveUserFailed:)]) {
            [self.delegate_save performSelector:@selector(didSaveUserFailed:) withObject:command.errorMsg];
        }
    }

}


@end
