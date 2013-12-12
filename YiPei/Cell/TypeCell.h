//
//  TypeCell.h
//  YiPei
//
//  Created by daichuanning on 13-11-24.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TypeCell : UITableViewCell
@property (nonatomic,strong)IBOutlet UILabel *titleLabel;
@property (nonatomic,strong)IBOutlet UIImageView *arrowImageView;
@property (nonatomic,strong)IBOutlet UILabel * selectNameLab;
- (void)changeArrowWithUp:(BOOL)up;

@end
