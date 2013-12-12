//
//  UINavigationView.m
//  YiPei
//
//  Created by daichuanning on 13-11-27.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "UINavigationView.h"

@implementation UINavigationView
@synthesize rightButton = _rightButton;
@synthesize leftButton = _leftButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(UIBarButtonItem* )setWithLeftBarItemWithFrame:(CGRect)frame withAction:(SEL)action withButtonImage:(UIImage *)image withHighlighted:(UIImage*)highlightedImage withTarget:(UIViewController *)controller{
    
    _leftButton=[[UIButton alloc]initWithFrame:frame] ;
    _leftButton.backgroundColor=[UIColor clearColor];
    [_leftButton setImage:image forState:UIControlStateNormal];
    [_leftButton setImage:highlightedImage forState:UIControlStateHighlighted];
    [_leftButton addTarget:controller action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:_leftButton];
    
    return buttonItem;
    /*
    UIButton * button = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    if (highlightedImage) {
        [button setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    }
    
 
    [self addSubview:button];
    [button addTarget:controller action:action forControlEvents:UIControlEventTouchDown];
    */
}
-(UIBarButtonItem*)setWithRightBarItemWithFrame:(CGRect)frame withAction:(SEL)action withButtonImage:(UIImage *)image withHighlighted:(UIImage*)highlightedImage withTarget:(UIViewController *)controller{
    
    _rightButton=[[UIButton alloc]initWithFrame:frame] ;
    _rightButton.backgroundColor=[UIColor clearColor];
    [_rightButton setImage:image forState:UIControlStateNormal];
    [_rightButton setImage:highlightedImage forState:UIControlStateHighlighted];
    [_rightButton addTarget:controller action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
    
    return buttonItem;
    /*
    UIButton * button = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    if (highlightedImage) {
        [button setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    }
    [self addSubview:button];
    [button setBackgroundImage:image forState:UIControlStateNormal];

    [button addTarget:controller action:action forControlEvents:UIControlEventTouchDown];
     */
}
-(void)initWithCenterItemWithTitle:(NSString *)title withFrame:(CGRect)frame  {
    UILabel * lab = [[UILabel alloc] initWithFrame:frame];
    lab.text = title;
    [self addSubview:lab];
}


@end
