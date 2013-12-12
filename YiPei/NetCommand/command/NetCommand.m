


#import <Foundation/Foundation.h>
#import "JSONKit.h"

#import "NetCommand.h"
#import "allConfig.h"
#import "NetConfig.h"

@implementation NetCommand

@synthesize data;
@synthesize errorCode;
@synthesize errorMsg;

@synthesize paramDict;
@synthesize isComplete;

//@synthesize request=_request;
//@synthesize reqform=_reqform;
//@synthesize delegate;

- (id)init {
	self = [super init];

    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    self.paramDict = dict;
	return self;
}

//- (void)dealloc {	
////	[currentProperty release];
//	[paramDict release];
//    [cmdUrl release];
////    [reqUrl release];
//	[data release];
//    [parser release];
//    [super dealloc];
//}


// 超时处理
- (void)parsingDidTimeout {
    if (self.isComplete == NO) {
//        [self.parser abortParsing];
        // Create your error and display it here
		
        // Try the fetch and parse again...
    }
}

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
    ASIHTTPRequest *request = [[ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]] retain];
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
            self.data = [dictionary objectForKey:@"data"];
//            if (self.delegate &&[self.delegate respondsToSelector:@selector(NetCommandDelDidSucc:)]) {
//                [self.delegate performSelector:@selector(NetCommandDelDidSucc:) withObject:self.data];
//            }
        }
        @catch (NSException * e) {
            NSLog(@"execute,error=%@",e);
        }
        @finally {
            
        }

    }
//    [request setDelegate:self];
//    [request startAsynchronous];
}

- (void)execute_post:(NSString *)key img:(NSData *)image {
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
    [self startDownPost:key httpUrl:reqUrl img:image];
    
}

- (void)startDownPost:(NSString*)key httpUrl:(NSMutableString *)url img:(NSData *)image{
    
    NSURL *requrl = [[NSURL alloc]initWithString:url];
    
    //以表格形式的请求对象
    
    ASIFormDataRequest *reqform = [[ASIFormDataRequest alloc]initWithURL:requrl];
    
    reqform.delegate =self;
    
    reqform.requestMethod = @"POST";//设置请求方式
    
    //添加请求内容
    [reqform addData:data withFileName:[NSString stringWithFormat:@"%d.png",arc4random()] andContentType:@"image/png" forKey:key];
    //开始异步请求
    [reqform startSynchronous];
    if (![reqform error]) {
        @try {
            if (reqform.responseStatusCode != 200) {
                return;
            }
            
            NSString *jsonString = [[NSString alloc] initWithBytes:[reqform responseData].bytes length:[reqform responseData].length encoding:NSUTF8StringEncoding];
            jsonString = [jsonString stringByReplacingOccurrencesOfString:@"null" withString:@"\"\""];
            
            NSMutableDictionary *dictionary=[jsonString objectFromJSONString];
            
            self.errorCode = [[dictionary objectForKey:@"errorCode"]intValue];
            self.errorMsg = [dictionary objectForKey:@"errorMsg"];
            self.data = [dictionary objectForKey:@"data"];\
//            if (self.delegate &&[self.delegate respondsToSelector:@selector(NetCommandDelDidSucc:)]) {
//                [self.delegate performSelector:@selector(NetCommandDelDidSucc:) withObject:self.data];
//            }
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

//- (void)requestFinished:(ASIHTTPRequest *)requestFin
//{
//    @try {
//        if (requestFin.responseStatusCode != 200) {
//            return;
//        }
//
//        NSString *jsonString = [[NSString alloc] initWithBytes:[requestFin responseData].bytes length:[requestFin responseData].length encoding:NSUTF8StringEncoding];
//        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"null" withString:@"\"\""];
//        
//        NSMutableDictionary *dictionary=[jsonString objectFromJSONString];
//        
//        self.errorCode = [[dictionary objectForKey:@"errorCode"]intValue];
//        self.errorMsg = [dictionary objectForKey:@"errorMsg"];
//        self.data = [dictionary objectForKey:@"data"];\
//        if (self.delegate &&[self.delegate respondsToSelector:@selector(NetCommandDelDidSucc:)]) {
//            [self.delegate performSelector:@selector(NetCommandDelDidSucc:) withObject:self.data];
//        }
//	}
//	@catch (NSException * e) {
//		NSLog(@"execute,error=%@",e);
//	}
//	@finally {
//
//    }
//}
//
//- (void)requestFailed:(ASIHTTPRequest *)requestF
//{
//    self.errorCode = 1;
//    self.errorMsg = @"网络错误,请稍后重试";
//    if (self.delegate &&[self.delegate respondsToSelector:@selector(NetCommandDelDidFailed:)]) {
//        [self.delegate performSelector:@selector(NetCommandDelDidFailed:) withObject:self.errorMsg];
//    }
//}
@end