//
//  UserInfoByIdFunc.h
//  YiPei
//
//  Created by lee on 13-12-5.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataProcessProtocol.h"

@interface UserInfoByIdFunc : NSObject
{
    id<dataGetUserInfoByIdProcessProtocol>delegate;
}

@property(nonatomic, strong)id delegate;

-(void)getUserInfoById:(NSString *)uid;
@end
