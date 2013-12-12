//
//  profileFunc.h
//  YiPei
//
//  Created by lee on 13-12-5.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataProcessProtocol.h"

@interface profileFunc : NSObject
{
    id<dataProfileProcessProtocol>delegate;
}

@property(nonatomic, retain) id delegate;

-(void) getProfileIndex:(NSString *)uid;

@end
