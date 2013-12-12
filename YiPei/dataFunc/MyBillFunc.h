//
//  MyBillFunc.h
//  YiPei
//
//  Created by lee on 13-12-8.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataProcessProtocol.h"
#import "NetCommand.h"

@interface MyBillFunc : NetCommand
{
    id<dataMyBillByMonthProcessProtocol>delegate;
}

@property(nonatomic, strong)id delegate;

-(void)getMyBillByMonth:(NSString *)index getUID:(NSString *)uid clientInfo:(NSString *)clid time:(NSString *)month p:(NSString *)items;
@end
