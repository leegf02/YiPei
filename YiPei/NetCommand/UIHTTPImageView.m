
#import "UIHTTPImageView.h"
#import "allConfig.h"
@implementation UIHTTPImageView        

- (void)dealloc {
    [request setDelegate:nil];
    [request cancel];
    [request release];
    [super dealloc];
}

- (void)setImageWithURL:(NSURL *)url{
    if (request) {
        [request setDelegate:nil];
        [request cancel];
        [request release]; 
    }
    request = [[ASIHTTPRequest requestWithURL:url] retain];
    [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    [request setSecondsToCache:60 * 60 * 24 * 30];
		
    [request setDelegate:self];
    [request startSynchronous];
    if (![request error]) {
        if (request.responseStatusCode != 200) {
            return;
        }
        //	[request.responseData writeToFile:dPath atomically:NO];
        self.image = [UIImage imageWithData:request.responseData];
    }
    else
    {
        NSLog(@"err=%@",[request error].description);
    }
}
//- (void)setImageWithURL:(NSURL *)url PID:(NSString *)pid
//{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSString* cachesDirectory = [paths objectAtIndex:0];
//    NSString *path = [NSString stringWithFormat:@"%@/%@",cachesDirectory,ImagePath];
//    
//	NSString *dPath = [NSString stringWithFormat:@"%@/%@", path, pid];
//	NSLog(@"%@",dPath);
//	NSData *data;
//    data = [[NSData alloc ] initWithContentsOfFile:dPath];
//	if(data == nil)
//	{
//        
//        if (request) {
//            [request setDelegate:nil];
//            [request cancel];
//            [request release];
//        }
//        
//		request = [[ASIHTTPRequest requestWithURL:url] retain];
//		[request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
//		[request setSecondsToCache:60 * 60 * 24 * 30];
//		
//		[request startSynchronous];
//        if (![request error]) {
//            [request.responseData writeToFile:dPath atomically:NO];
//        }
//	}
//	else {
//		self.image = [UIImage imageWithData:data];
//#if !TARGET_IPHONE_SIMULATOR
//        [self addSkipBackupAttributeToItemAtURL:[NSURL URLWithString:dPath]];
//#endif
//	}
//    [data release];
//}

//- (void)requestFinished:(ASIHTTPRequest *)req {
//    if (request.responseStatusCode != 200) {
//        return;
//	}
//	[request.responseData writeToFile:dPath atomically:NO];
//    self.image = [UIImage imageWithData:request.responseData];
//}

@end