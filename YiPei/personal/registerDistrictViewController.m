//
//  registerDistrictViewController.m
//  YiPei
//
//  Created by lee on 13-12-10.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "registerDistrictViewController.h"
#import "reqionInfoFunc.h"
#import "registerViewController.h"
@interface registerDistrictViewController ()

@end

@implementation registerDistrictViewController
@synthesize districArray=_districArray;
@synthesize tableView=_tableView;
@synthesize cityID=_cityID;
@synthesize proviceID=_proviceID;
@synthesize provName=_provName;
@synthesize cityName=_cityName;
@synthesize district=_district;
@synthesize districtName=_districtName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (_cityID) {
        reqionInfoFunc *region = [[reqionInfoFunc alloc] init];
        region.delegate=self;
        [region getRegion:_cityID];
    }
}
- (void) didReqionInfoSuccess : (id)data
{
	_districArray=data;
}

- (void) didReqionInfoFailed : (NSString *)err
{
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;//第零个不显示
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_districArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString *name = [[_districArray objectAtIndex:indexPath.row] objectForKey:@"region_name"];
    cell.textLabel.text = name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    _district =[[_districArray objectAtIndex:indexPath.row] objectForKey:@"region_id"];
    _districtName = [[_districArray objectAtIndex:indexPath.row] objectForKey:@"region_name"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:_proviceID forKey:@"proviceID"];
    [dic setValue:_provName forKey:@"proviceName"];
    [dic setValue:_cityID forKey:@"cityID"];
    [dic setValue:_cityName forKey:@"cityName"];
    [dic setValue:_district forKey:@"disID"];
    [dic setValue:_districtName forKey:@"disName"];

    [registerViewController sharedregisterViewController].location = dic;
    [self.navigationController popToViewController:[registerViewController sharedregisterViewController] animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
