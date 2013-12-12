

#import "ASIHTTPRequest.h"

@interface UIHTTPImageView : UIImageView {
    ASIHTTPRequest *request;
}

- (void)setImageWithURL:(NSURL *)url;
//- (void)setImageWithURL:(NSURL *)url PID:(NSString *)pid;

@end