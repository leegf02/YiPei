//
//  reqionInfoFunc.h
//  YiPei
//
//  Created by lee on 13-12-10.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "NetCommand.h"
#import "dataProcessProtocol.h"

@interface reqionInfoFunc : NetCommand
{
    id<dataReqionInfoProtocol> delegate;
}
@property(nonatomic,strong)id delegate;

- (void)getRegion:(NSString *)bypid;
- (NSArray *)getRegionDirect:(NSString *)bypid;
@end
