//
//  TypeCell.m
//  YiPei
//
//  Created by daichuanning on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "TypeCell.h"

@implementation TypeCell
@synthesize titleLabel = _titleLabel;
@synthesize arrowImageView=_arrowImageView;
@synthesize selectNameLab =_selectNameLab;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)changeArrowWithUp:(BOOL)up
{
    if (up) {
        self.arrowImageView.image = [UIImage imageNamed:@"icon_arrow1_up.png"];
    }else
    {
        self.arrowImageView.image = [UIImage imageNamed:@"icon_arrow1_down.png"];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
