//
//  VerifySaveUserFunc.h
//  YiPei
//
//  Created by lee on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "NetCommand.h"
#import "dataProcessProtocol.h"

@interface VerifySaveUserFunc : NetCommand
{
    id<dataVerifyUserProcessProtocol>delegate;
    id<dataSaveUserProcessProtocol>delegate_save;
}
@property(nonatomic, strong)id delegate;
@property(nonatomic, strong)id delegate_save;
-(void)getVerifyUser:(NSString *) mobile;
-(void)saveInitUserInfo:(NSString *)companyName Prov:(NSString *)province City:(NSString *)ct District:(NSString *)dis Addr:(NSString *)addr Mobile:(NSString *)mob Contact:(NSString *)con Code:(NSString *)code;
@end
;