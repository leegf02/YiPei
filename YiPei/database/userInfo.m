//
//  userInfo.m
//  YiPei
//
//  Created by lee on 13-11-29.
//  Copyright (c) 2013年 lee. All rights reserved.
//
#import "sqlite3.h"
#import "model.h"
#import "userInfo.h"

@implementation userInfo
@synthesize groups;

//视图初始化时创建表
-(void)creatDatabase{
	if ([self connDatabase]) {
		char *errorMsg;
		
        NSString *myself=@"CREATE TABLE IF NOT EXISTS Myself (ID INTEGER PRIMARY KEY,USERID TEXT,CLIENTID TEXT,USERNAME TEXT,ISSPECIAL TEXT,NAME TEXT,LOGO TEXT,ADDR TEXT,CONTACT TEXT,TEL TEXT,MOBILE TEXT);";

		if (sqlite3_exec(smsDatabase, [myself UTF8String], NULL, NULL, &errorMsg)!=SQLITE_OK) {
			NSLog(@"个人数据没有创建成功");
			sqlite3_close(smsDatabase);
			NSAssert1(0,@"Error creating table:%s",errorMsg);
		}
		
        NSString *mycity=@"CREATE TABLE IF NOT EXISTS MyCity (ID INTEGER PRIMARY KEY,CITYID TEXT,CITYNAME TEXT);";
        
		if (sqlite3_exec(smsDatabase, [mycity UTF8String], NULL, NULL, &errorMsg)!=SQLITE_OK) {
			NSLog(@"个人城市没有创建成功");
			sqlite3_close(smsDatabase);
			NSAssert1(0,@"Error creating table:%s",errorMsg);
		}
        NSString *mycart=@"CREATE TABLE IF NOT EXISTS MyCart (PID INTEGER PRIMARY KEY,CITYID TEXT ,PNAME TEXT,PRICE TEXT,BUYNUM TEXT);";
        
		if (sqlite3_exec(smsDatabase, [mycart UTF8String], NULL, NULL, &errorMsg)!=SQLITE_OK) {
			NSLog(@"购物车没有创建成功");
			sqlite3_close(smsDatabase);
			NSAssert1(0,@"Error creating table:%s",errorMsg);
		}
        
        NSString *myvol=@"CREATE TABLE IF NOT EXISTS MyVol (ID INTEGER PRIMARY KEY,PID TEXT,SUPPLYID TEXT,PRICE TEXT,NUMBER TEXT,NUMBER_MIN TEXT);";
        
		if (sqlite3_exec(smsDatabase, [myvol UTF8String], NULL, NULL, &errorMsg)!=SQLITE_OK) {
			NSLog(@"价格区间没有创建成功");
			sqlite3_close(smsDatabase);
			NSAssert1(0,@"Error creating table:%s",errorMsg);
		}
        
        NSString *mypay=@"CREATE TABLE IF NOT EXISTS MyPay (ID INTEGER PRIMARY KEY,PID TEXT,SUPPLYID TEXT,PRICE TEXT,NUMBER TEXT,NUMBER_MIN TEXT);";
        
		if (sqlite3_exec(smsDatabase, [mypay UTF8String], NULL, NULL, &errorMsg)!=SQLITE_OK) {
			NSLog(@"结算支付表没有创建成功");
			sqlite3_close(smsDatabase);
			NSAssert1(0,@"Error creating table:%s",errorMsg);
		}
        
        NSString *myUserByID=@"CREATE TABLE IF NOT EXISTS MyUserByID (ID INTEGER PRIMARY KEY,USER_ID TEXT,USER_NAME TEXT,CLIENT_ID TEXT,CITY TEXT,COMMANY_NAME TEXT,COMMANY_LOGO TEXT,PROVINCE TEXT,DISTRICT TEXT,COMMPANY_ADDR TEXT, MOBILE TEXT,CONTACT TEXT);";
        
		if (sqlite3_exec(smsDatabase, [myUserByID UTF8String], NULL, NULL, &errorMsg)!=SQLITE_OK) {
			NSLog(@"结算支付表没有创建成功");
			sqlite3_close(smsDatabase);
			NSAssert1(0,@"Error creating table:%s",errorMsg);
		}
        
        NSString *myProfile=@"CREATE TABLE IF NOT EXISTS myProfile (ID INTEGER PRIMARY KEY,NAME TEXT,LOGO TEXT,ADDR TEXT,CONTACT TEXT,TEL TEXT,MOBILE TEXT,USERID TEXT,USERNAME TEXT,ILEVEL TEXT, POINTS TEXT,CLEVEL TEXT,AMOUNT TEXT);";
        
		if (sqlite3_exec(smsDatabase, [myProfile UTF8String], NULL, NULL, &errorMsg)!=SQLITE_OK) {
			NSLog(@"个人主页信息表没有创建成功");
			sqlite3_close(smsDatabase);
			NSAssert1(0,@"Error creating table:%s",errorMsg);
		}
	}

	sqlite3_close(smsDatabase);
}


-(void)addCityInfo:(NSString *)cID cityName:(NSString *)cName
{
	char *errorMsg;
	if([self connDatabase]){
            NSString *InsertData=[[NSString alloc]initWithFormat:@"INSERT OR REPLACE INTO MyCity (CITYID,CITYNAME) VALUES('%@','%@');",cID,cName];
		    int ok=sqlite3_exec(smsDatabase, [InsertData UTF8String], NULL, NULL, &errorMsg);
			if (ok==SQLITE_OK) {
				NSLog(@"插入组成员成功。。。。。。");
			}
	}
	sqlite3_close(smsDatabase);
	
}

- (citySite *)getCityInfo
{
    citySite *cityinfo = [[citySite alloc] init];
	if ([self connDatabase]) {
		NSString *query=@"SELECT CITYID, CITYNAME FROM MyCity;";
		sqlite3_stmt *statement;
		if (sqlite3_prepare_v2(smsDatabase, [query UTF8String], -1, &statement, nil)==SQLITE_OK) {
			NSLog(@"准备查询数据");
			
			while (sqlite3_step(statement)==SQLITE_ROW) {
				
				char *cityid=(char *)sqlite3_column_text(statement, 0);
                char *cityname=(char *)sqlite3_column_text(statement, 1);
				
				if (cityid!=nil) {
					cityinfo.cID=[NSString stringWithUTF8String:(const char*)cityid];
				}
				if (cityname!=nil) {
                    cityinfo.cName=[NSString stringWithUTF8String:(const char*)cityname];
                }
			}
			sqlite3_finalize(statement);
		}
		sqlite3_close(smsDatabase);
	}
	return cityinfo;
}
-(NSMutableArray *)getMyCartArr
{
    NSMutableArray *mubArr = [[NSMutableArray alloc] init];
    if ([self connDatabase]) {
        if ([self connDatabase]) {
            NSString *query=@"SELECT PID,CITYID,PNAME,PRICE ,BUYNUM FROM MyCart;";
            sqlite3_stmt *statement;
            if (sqlite3_prepare_v2(smsDatabase, [query UTF8String], -1, &statement, nil)==SQLITE_OK) {
                NSLog(@"准备查询数据");
                
                while (sqlite3_step(statement)==SQLITE_ROW) {
                    
                    Goods2Cart *goods = [[Goods2Cart alloc] init];
                    
                    char *cityid=(char *)sqlite3_column_text(statement, 1);
                    char* pid=(char*)sqlite3_column_text(statement, 0);
                    char *name=(char *)sqlite3_column_text(statement, 2);
                    char *price=(char *)sqlite3_column_text(statement, 3);
                    char *num=(char *)sqlite3_column_text(statement, 4);

                    if (cityid!=nil) {
                        goods.goodCity=[NSString stringWithUTF8String:(const char*)cityid];
                    }
                    if (pid!=nil) {
                        goods.goodsId=[NSString stringWithUTF8String:(const char*)pid];
                    }
                    
                    if (price!=nil) {
                        goods.goodPrice =[NSString stringWithUTF8String:(const char*)price];
                    }
                    if (num!=nil) {
                        goods.goodsNumber=[NSString stringWithUTF8String:(const char*)num];
                    }
                    if (name!=nil) {
                        goods.goodName=[NSString stringWithUTF8String:(const char*)name];
                    }
                    [mubArr addObject:goods];
                }
                sqlite3_finalize(statement);
            }
        }
        sqlite3_close(smsDatabase);
    }
        return mubArr;
}

-(void)updateToCartDB:(Goods2Cart *)good
{
    
    char *errorMsg;
	if([self connDatabase]){
        NSString *InsertData=[[NSString alloc]initWithFormat:@"INSERT OR REPLACE INTO MyCart VALUES('%d','%@','%@','%@','%@');",[good.goodsId intValue],good.goodCity,good.goodName,good.goodPrice,good.goodsNumber];

        int ok=sqlite3_exec(smsDatabase, [InsertData UTF8String], NULL, NULL, &errorMsg);
        if (ok==SQLITE_OK) {
            NSLog(@"插入组成员成功。。。。。。");
        }
	}
	sqlite3_close(smsDatabase);

}

-(void)addToCartDB:(Goods2Cart *)good
{
    char *errorMsg;
	if([self connDatabase]){
        {
            
            NSString *query=[[NSString alloc] initWithFormat:@"SELECT PID,CITYID,PNAME,PRICE ,BUYNUM FROM MyCart WHERE PID='%@';",good.goodsId];
            sqlite3_stmt *statement;
            if (sqlite3_prepare_v2(smsDatabase, [query UTF8String], -1, &statement, nil)==SQLITE_OK) {
                NSLog(@"准备查询数据");
                
                while (sqlite3_step(statement)==SQLITE_ROW) {
                    char *num=(char *)sqlite3_column_text(statement, 4);
                    if (num!=nil) {
                        int rec=[[NSString stringWithUTF8String:(const char*)num] intValue];
                        good.goodsNumber = [[NSString alloc] initWithFormat:@"%d",rec+[good.goodsNumber intValue]];
                    }
                }
                sqlite3_finalize(statement);
            }
        }

        NSString *InsertData=[[NSString alloc]initWithFormat:@"INSERT OR REPLACE INTO MyCart VALUES('%d','%@','%@','%@','%@');",[good.goodsId intValue],good.goodCity,good.goodName,good.goodPrice,good.goodsNumber];
        int ok=sqlite3_exec(smsDatabase, [InsertData UTF8String], NULL, NULL, &errorMsg);
        if (ok==SQLITE_OK) {
            NSLog(@"插入组成员成功。。。。。。");
        }
	}
	sqlite3_close(smsDatabase);
}


-(void)deleteFromMyCart:(NSString *)pid
{
    char *errorMsg;
	if([self connDatabase]){
        NSString *deleteData=[[NSString alloc]initWithFormat:@"DELETE FROM MyCart WHERE PID='%d';",[pid intValue]];
        int ok=sqlite3_exec(smsDatabase, [deleteData UTF8String], NULL, NULL, &errorMsg);
        if (ok==SQLITE_OK) {
            NSLog(@"删除组成员成功。。。。。。");
        }
	}
	sqlite3_close(smsDatabase);
}

-(void)addVol2DB:(volumePrice *)vol PID:(NSString *)pid
{
    char *errorMsg;
	if([self connDatabase]){
        NSString *InsertData=[[NSString alloc]initWithFormat:@"INSERT OR REPLACE INTO MyVol (PID,SUPPLYID ,PRICE TEXT,NUMBER TEXT,NUMBER_MIN TEXT) VALUES('%@','%@','%@','%@','%@');",pid,vol.supplier_id,vol.volume_price,vol.volume_number,vol.volume_number_min];
        int ok=sqlite3_exec(smsDatabase, [InsertData UTF8String], NULL, NULL, &errorMsg);
        if (ok==SQLITE_OK) {
            NSLog(@"插入组成员成功。。。。。。");
        }
	}
	sqlite3_close(smsDatabase);
}

-(NSMutableArray *)getVolByPID:(NSString *)pid
{
    NSMutableArray *mubArr = [[NSMutableArray alloc] init];
    if ([self connDatabase]) {
        if ([self connDatabase]) {
            NSString *query = [[NSString alloc]initWithFormat:@"SELECT SUPPLYID ,PRICE,NUMBER,NUMBER_MIN FROM MyVol where PID='%@';",pid];
            NSLog(@"getVolByPID:query=%@",query);
            sqlite3_stmt *statement;
            if (sqlite3_prepare_v2(smsDatabase, [query UTF8String], -1, &statement, nil)==SQLITE_OK) {
                NSLog(@"准备查询数据");
                
                while (sqlite3_step(statement)==SQLITE_ROW) {
                    
                    volumePrice *vol = [[volumePrice alloc] init];
                    
                    
                    char *supply=(char *)sqlite3_column_text(statement, 0);
                    char *price=(char *)sqlite3_column_text(statement, 1);
                    char *number=(char *)sqlite3_column_text(statement, 2);
                    char *nummin=(char *)sqlite3_column_text(statement, 3);
                    
                    if (supply!=nil) {
                        vol.supplier_id=[NSString stringWithUTF8String:(const char*)supply];
                    }
                    if (price!=nil) {
                        vol.volume_price=[NSString stringWithUTF8String:(const char*)price];
                    }
                    if (number!=nil) {
                        vol.volume_number =[NSString stringWithUTF8String:(const char*)number];
                    }
                    if (nummin!=nil) {
                        vol.volume_number_min=[NSString stringWithUTF8String:(const char*)nummin];
                    }

                    [mubArr addObject:vol];
                }
                sqlite3_finalize(statement);
            }
        }
        sqlite3_close(smsDatabase);
    }
    return mubArr;
}

-(void)deleteFromVol:(NSString *)pid
{
    char *errorMsg;
	if([self connDatabase]){
        NSString *delData=[[NSString alloc]initWithFormat:@"DELETE FROM MyVol WHERE PID='%@');",pid];
        int ok=sqlite3_exec(smsDatabase, [delData UTF8String], NULL, NULL, &errorMsg);
        if (ok==SQLITE_OK) {
            NSLog(@"插入组成员成功。。。。。。");
        }
	}
	sqlite3_close(smsDatabase);
}


-(void)addToPayDB:(Goods2Cart *)good
{
    char *errorMsg;
	if([self connDatabase]){
        NSString *InsertData=[[NSString alloc]initWithFormat:@"INSERT INTO MyPay ( CITYID,PID ,PIDNAME ,PRICE ,BUYNUM,PNAME ) VALUES('%@','%@','%@','%@','%@');",good.goodCity,good.goodsId,good.goodPrice,good.goodsNumber,good.goodName];
        int ok=sqlite3_exec(smsDatabase, [InsertData UTF8String], NULL, NULL, &errorMsg);
        if (ok==SQLITE_OK) {
            NSLog(@"插入组成员成功。。。。。。");
        }
	}
	sqlite3_close(smsDatabase);
}

-(NSMutableArray *)getMyPayArr
{
    NSMutableArray *mubArr = [[NSMutableArray alloc] init];
    if ([self connDatabase]) {
        if ([self connDatabase]) {
            NSString *query=@"SELECT CITYID,PID ,PIDNAME ,PRICE ,BUYNUM,PNAME FROM MyPay;";
            sqlite3_stmt *statement;
            if (sqlite3_prepare_v2(smsDatabase, [query UTF8String], -1, &statement, nil)==SQLITE_OK) {
                NSLog(@"准备查询数据");
                
                while (sqlite3_step(statement)==SQLITE_ROW) {
                    
                    Goods2Cart *goods = [[Goods2Cart alloc] init];
                    
                    
                    char *cityid=(char *)sqlite3_column_text(statement, 0);
                    char *pid=(char *)sqlite3_column_text(statement, 1);
                    char *price=(char *)sqlite3_column_text(statement, 2);
                    char *num=(char *)sqlite3_column_text(statement, 3);
                    char *name=(char *)sqlite3_column_text(statement, 4);
                    
                    if (cityid!=nil) {
                        goods.goodCity=[NSString stringWithUTF8String:(const char*)cityid];
                    }
                    if (pid!=nil) {
                        goods.goodsId=[NSString stringWithUTF8String:(const char*)pid];
                    }
                    if (price!=nil) {
                        goods.goodPrice =[NSString stringWithUTF8String:(const char*)price];
                    }
                    if (num!=nil) {
                        goods.goodsNumber=[NSString stringWithUTF8String:(const char*)num];
                    }
                    if (num!=nil) {
                        goods.goodName=[NSString stringWithUTF8String:(const char*)name];
                    }
                    [mubArr addObject:goods];
                }
                sqlite3_finalize(statement);
            }
        }
        sqlite3_close(smsDatabase);
    }
    return mubArr;
}

-(void)deleteFromPayDB:(NSString *)pid
{
    char *errorMsg;
	if([self connDatabase]){
        NSString *deleteData=[[NSString alloc]initWithFormat:@"DELETE FROM MyPay WHERE PID='%@';",pid];
        int ok=sqlite3_exec(smsDatabase, [deleteData UTF8String], NULL, NULL, &errorMsg);
        if (ok==SQLITE_OK) {
            NSLog(@"插入组成员成功。。。。。。");
        }
	}
	sqlite3_close(smsDatabase);
}

-(myUsrInfoByPid *)getUsrInfoByPidFromDB
{
    myUsrInfoByPid *user =nil;
        if ([self connDatabase]) {
            NSString *query=@"SELECT USER_ID,USER_NAME ,CLIENT_ID ,CITY ,COMMANY_NAME ,COMMANY_LOGO ,PROVINCE ,DISTRICT ,COMMPANY_ADDR , MOBILE ,CONTACT FROM MyUserByID;";
            sqlite3_stmt *statement;
            if (sqlite3_prepare_v2(smsDatabase, [query UTF8String], -1, &statement, nil)==SQLITE_OK) {
                NSLog(@"准备查询数据");
                while (sqlite3_step(statement)==SQLITE_ROW) {
                    user = [[myUsrInfoByPid alloc] init];
                    char *userid=(char *)sqlite3_column_text(statement, 0);
                    char *username=(char *)sqlite3_column_text(statement, 1);
                    char *clientid=(char *)sqlite3_column_text(statement, 2);
                    char *cityId=(char *)sqlite3_column_text(statement, 3);
                    char *commanyname =(char *)sqlite3_column_text(statement, 4);
                    char *commanylogo=(char *)sqlite3_column_text(statement, 5);
                    char *province=(char *)sqlite3_column_text(statement,6);
                    char *distrct=(char *)sqlite3_column_text(statement, 7);
                    char *commpanyaddr=(char *)sqlite3_column_text(statement, 8);
                    char *mobile=(char *)sqlite3_column_text(statement, 9);
                    char *contact=(char *)sqlite3_column_text(statement, 10);

                    if (userid!=nil) {
                        user.user_id=[NSString stringWithUTF8String:(const char*)userid];
                    }
                    if (username!=nil) {
                        user.user_name=[NSString stringWithUTF8String:(const char*)username];
                    }
                    if (clientid!=nil) {
                        user.client_id =[NSString stringWithUTF8String:(const char*)clientid];
                    }
                    if (cityId!=nil) {
                        user.city=[NSString stringWithUTF8String:(const char*)cityId];
                    }
                    if (commanyname!=nil) {
                        user.company_name=[NSString stringWithUTF8String:(const char*)commanyname];
                    }
                    if (commanylogo!=nil) {
                        user.company_logo=[NSString stringWithUTF8String:(const char*)commanylogo];
                    }
                    if (province!=nil) {
                        user.province=[NSString stringWithUTF8String:(const char*)province];
                    }
                    if (distrct!=nil) {
                        user.district=[NSString stringWithUTF8String:(const char*)distrct];
                    }
                    if (commpanyaddr!=nil) {
                        user.company_addres=[NSString stringWithUTF8String:(const char*)commpanyaddr];
                    }
                    if (mobile!=nil) {
                        user.mobile=[NSString stringWithUTF8String:(const char*)mobile];
                    }
                    if (contact!=nil) {
                        user.contact=[NSString stringWithUTF8String:(const char*)contact];
                    }
                }
                sqlite3_finalize(statement);
            }
        sqlite3_close(smsDatabase);
    }
    return user;
}

-(void)updateUserInfoPidByPidToDB:(myUsrInfoByPid *)user
{
    char *errorMsg;
	if([self connDatabase]){
        NSString *InsertData=[[NSString alloc]initWithFormat:@"INSERT OR REPLACE INTO MyUserByID (  USER_ID ,USER_NAME ,CLIENT_ID ,CITY ,COMMANY_NAME ,COMMANY_LOGO ,PROVINCE ,DISTRICT ,COMMPANY_ADDR , MOBILE ,CONTACT) VALUES('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@');",user.user_id,user.user_name,user.client_id,user.city,user.company_name,user.company_logo,user.province,user.district,user.company_addres,user.mobile,user.contact];
        int ok=sqlite3_exec(smsDatabase, [InsertData UTF8String], NULL, NULL, &errorMsg);
        if (ok==SQLITE_OK) {
            NSLog(@"插入组成员成功。。。。。。");
        }
	}
	sqlite3_close(smsDatabase);
}


-(myProfile *)getMyProfile
{
    myProfile *profile =nil;
    if ([self connDatabase]) {
        NSString *query=@"SELECT NAME ,LOGO ,ADDR ,CONTACT ,TEL ,MOBILE ,USERID ,USERNAME ,ILEVEL , POINTS ,CLEVEL,AMOUNT FROM myProfile;";
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(smsDatabase, [query UTF8String], -1, &statement, nil)==SQLITE_OK) {
            NSLog(@"准备查询数据");
            while (sqlite3_step(statement)==SQLITE_ROW) {
                profile = [[myProfile alloc] init];
                char *name=(char *)sqlite3_column_text(statement, 0);
                char *logo=(char *)sqlite3_column_text(statement, 1);
                char *addr=(char *)sqlite3_column_text(statement, 2);
                char *conntact=(char *)sqlite3_column_text(statement, 3);
                char *tel =(char *)sqlite3_column_text(statement, 4);
                char *mobile=(char *)sqlite3_column_text(statement, 5);
                char *userid=(char *)sqlite3_column_text(statement,6);
                char *username=(char *)sqlite3_column_text(statement, 7);
                char *ilevel=(char *)sqlite3_column_text(statement, 8);
                char *points=(char *)sqlite3_column_text(statement, 9);
                char *clevel=(char *)sqlite3_column_text(statement, 10);
                char *amount=(char *)sqlite3_column_text(statement, 11);

                if (name!=nil) {
                    profile.clients_info.name=[NSString stringWithUTF8String:(const char*)name];
                }
                if (logo!=nil) {
                     profile.clients_info.logo=[NSString stringWithUTF8String:(const char*)logo];
                }
                if (addr!=nil) {
                     profile.clients_info.addr =[NSString stringWithUTF8String:(const char*)addr];
                }
                if (conntact!=nil) {
                     profile.clients_info.contact=[NSString stringWithUTF8String:(const char*)conntact];
                }
                if (tel!=nil) {
                     profile.clients_info.tel =[NSString stringWithUTF8String:(const char*)tel];
                }
                if (mobile!=nil) {
                    profile.clients_info.mobile=[NSString stringWithUTF8String:(const char*)mobile];
                }
                if (userid!=nil) {
                    profile.user_pro_info.user_id=[NSString stringWithUTF8String:(const char*)userid];
                }
                if (username!=nil) {
                    profile.user_pro_info.user_name=[NSString stringWithUTF8String:(const char*)username];
                }
                if (ilevel!=nil) {
                    profile.user_pro_info.level=[NSString stringWithUTF8String:(const char*)ilevel];
                }
                if (points!=nil) {
                    profile.user_pro_info.rank_points = [NSString stringWithUTF8String:(const char*)points];
                }
                if (clevel!=nil) {
                    profile.client_credit.level=[NSString stringWithUTF8String:(const char*)clevel];
                }
                if (amount!=nil) {
                    profile.client_credit.amounts=[NSString stringWithUTF8String:(const char*)amount];
                }
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(smsDatabase);
    }
    return profile;
}

-(void)updateMyProfile:(myProfile *)profile
{
    char *errorMsg;
	if([self connDatabase]){
        NSString *InsertData=[[NSString alloc]initWithFormat:@"INSERT OR REPLACE INTO myProfile (  NAME ,LOGO ,ADDR ,CONTACT ,TEL ,MOBILE ,USERID ,USERNAME ,ILEVEL , POINTS ,CLEVEL,AMOUNT) VALUES('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@');",profile.clients_info.name,
                              profile.clients_info.logo,profile.clients_info.addr,profile.clients_info.contact,
                              profile.clients_info.tel,profile.clients_info.mobile,profile.user_pro_info.user_id,
                              profile.user_pro_info.user_name, profile.user_pro_info.level, profile.user_pro_info.rank_points,
                               profile.client_credit.level, profile.client_credit.amounts];
        int ok=sqlite3_exec(smsDatabase, [InsertData UTF8String], NULL, NULL, &errorMsg);
        if (ok==SQLITE_OK) {
            NSLog(@"插入组成员成功。。。。。。");
        }
	}
	sqlite3_close(smsDatabase);
}


@end
