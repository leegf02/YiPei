//
//  goodInfoDetailFunc.h
//  YiPei
//
//  Created by lee on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataProcessProtocol.h"

@interface goodInfoDetailFunc : NSObject
{
    id<dataGoodsInfoProcessProtocol> delegate;
}

@property(nonatomic, retain)id delegate;

- (void) getGoodInfoDetail:(NSString *)goodsID;

@end
