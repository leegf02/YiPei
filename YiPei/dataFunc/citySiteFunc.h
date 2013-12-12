//
//  citySiteFunc.h
//  YiPei
//
//  Created by lee on 13-11-29.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataProcessProtocol.h"
#import "NetCommand.h"

@interface citySiteFunc : NSObject
{
    id<dataCitySiteProcessProtocol> delegate;
}

@property(nonatomic, retain)id delegate;

-(void) getCitySite;
@end
