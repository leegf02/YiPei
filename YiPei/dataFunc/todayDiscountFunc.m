//
//  todayDiscountFunc.m
//  YiPei
//
//  Created by lee on 13-11-26.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "todayDiscountFunc.h"
#import "NetCommand.h"
#import "model.h"
#import "NetConfig.h"
#import "JSONKit.h"

#import "userDataManager.h"


@implementation todayDiscountommand
@synthesize data_base;
@synthesize data_extension;
- (void)startDown:(NSMutableString *)url {
    NSString *escapedValue =
	(NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                          nil,
                                                                          (CFStringRef)url,
                                                                          NULL,
                                                                          NULL,
                                                                          kCFStringEncodingUTF8))
    ;
	NSURL *downUrl = [NSURL URLWithString:escapedValue];
    NSLog(@"%@",downUrl);
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    [request setTimeOutSeconds:10];
    
    [request startSynchronous];
    if (![request error]) {
        @try {
            if (request.responseStatusCode != 200) {
                return;
            }
            
            NSString *jsonString = [[NSString alloc] initWithBytes:[request responseData].bytes length:[request responseData].length encoding:NSUTF8StringEncoding];
            jsonString = [jsonString stringByReplacingOccurrencesOfString:@"null" withString:@"\"\""];
            
            NSMutableDictionary *dictionary=[jsonString objectFromJSONString];
            
            self.errorCode = [[dictionary objectForKey:@"errorCode"]intValue];
            self.errorMsg = [dictionary objectForKey:@"errorMsg"];
            self.data_base = [dictionary objectForKey:@"data"];
            self.data_extension =[dictionary objectForKey:@"todayNews"];
        }
        @catch (NSException * e) {
            NSLog(@"execute,error=%@",e);
        }
        @finally {
            
        }
        
    }

}

- (void)execute {
	NSMutableString *reqUrl = [NSMutableString string];
	[reqUrl appendString:[[NetConfig sharedNetConfig] getDomainDesc]];
	if ([paramDict count] > 0) {
		NSArray *allkeys = [paramDict allKeys];
        
        [reqUrl appendString:@"?"];
        
        [reqUrl appendString:@"m"];
        [reqUrl appendString:@"="];
        [reqUrl appendString:[paramDict valueForKey:@"m"]];
        
        [reqUrl appendString:@"&"];
        
        [reqUrl appendString:@"a"];
        [reqUrl appendString:@"="];
        [reqUrl appendString:[paramDict valueForKey:@"a"]];
        
        for (NSString *key in allkeys) {
            if (![key isEqualToString:@"m"] && ![key isEqualToString:@"a"]) {
                [reqUrl appendString:@"&"];
                [reqUrl appendString:key];
                [reqUrl appendString:@"="];
                [reqUrl appendString:[paramDict valueForKey:key]];
            }
            
        }
        
    }
    NSLog(@"reqUrl = %@", reqUrl);
    
    [self startDown:reqUrl];	
}
@end

@implementation todayDiscountFunc
@synthesize delegate;
- (void)getTodayDiscount:(NSString *)index sortPrice:(NSString *)sortP sortSale:(NSString *)sortS
{
    todayDiscountommand *command = [[todayDiscountommand alloc] init];
    [command.paramDict setObject:@"CityGoods" forKey:@"m"];
    [command.paramDict setObject:@"todayDiscountGoods" forKey:@"a"];
    [command.paramDict setObject:[userDataManager sharedUserDataManager].cityID forKey:@"city"];
    [command.paramDict setObject:index forKey:@"index"];
    [command.paramDict setObject:sortP forKey:@"sortPrice"];
    [command.paramDict setObject:sortS forKey:@"sortSale"];
    [command execute];
    if (command.errorCode == 0) {
        NSLog(@"getTodayDiscount success!");
        NSArray *goods = (NSArray *)command.data_base;
        todayNew *new = (todayNew *)command.data_extension;
        NSLog(@"goods=%@",goods);
        NSLog(@"new=%@",new);
        NSArray *tmp = [[NSArray alloc]initWithObjects:goods,new, nil];
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didTodayDiscountDataSuccess:)]) {
            [self.delegate performSelector:@selector(didTodayDiscountDataSuccess:) withObject:tmp];
        }
    }
    else if (command.errorCode==1) {
        NSLog(@"getTodayDiscount err!");
        if (self.delegate &&[self.delegate respondsToSelector:@selector(didTodayDiscountDataFailed:)]) {
            [self.delegate performSelector:@selector(didTodayDiscountDataFailed:) withObject:command.errorMsg];
        }
    }

}
@end
