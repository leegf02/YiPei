//
//  userInfo.h
//  YiPei
//
//  Created by lee on 13-11-29.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectionDatabase.h"
#import "model.h"
@class citySite;
@class Goods2Cart;
@class myUsrInfoByPid;

@interface userInfo : ConnectionDatabase
 {
	NSMutableArray *groups;
	BOOL isInsert;
}
@property(nonatomic,retain) NSMutableArray *groups;


-(void)creatDatabase;

- (citySite *)getCityInfo;
-(void)addCityInfo:(NSString *)cID cityName:(NSString *)cName;

-(NSMutableArray *)getMyCartArr;
-(void)addToCartDB:(Goods2Cart*)good;
-(void)deleteFromMyCart:(NSString *)pid;
-(void)updateToCartDB:(Goods2Cart *)good;

-(void)addVol2DB:(volumePrice *)vol PID:(NSString *)pid;
-(NSMutableArray *)getVolByPID:(NSString *)pid;
-(void)deleteFromVol:(NSString *)pid;

-(NSMutableArray *)getMyPayArr;
-(void)addToPayDB:(Goods2Cart *)good;
-(void)deleteFromPayDB:(NSString *)pid;

-(myUsrInfoByPid *)getUsrInfoByPidFromDB;
-(void)updateUserInfoPidByPidToDB:(myUsrInfoByPid *)user;

-(myProfile *)getMyProfile;
-(void)updateMyProfile:(myProfile *)profile;


@end
