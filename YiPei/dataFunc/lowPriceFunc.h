//
//  lowPriceFunc.h
//  YiPei
//
//  Created by lee on 13-12-3.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataProcessProtocol.h"

@interface lowPriceFunc : NSObject
{
    id<dataUploadImagedProcessProtocol>delegateUpImage;
    id<dataLowPriceNotifyProcessProtocol>delegateLow;
}

@property(nonatomic, retain) id delegateUpImage;
@property(nonatomic, retain) id delegateLow;

-(void)getImagePath:(NSData *)image;

-(void)getlowPriceNotify:(NSString *)goodID sysPrice:(NSString *)sPrice bugPrice:(NSString *)bPrice buyNo:(NSString *)num buyRebates:(NSString *)bates imagePath:(NSString *)path userID:(NSString *)uid cityID:(NSString *)city;
@end
