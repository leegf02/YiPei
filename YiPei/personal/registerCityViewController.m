//
//  registerCityViewController.m
//  YiPei
//
//  Created by lee on 13-12-10.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "registerCityViewController.h"
#import "registerDistrictViewController.h"
#import "reqionInfoFunc.h"
#import "Cell1.h"
@interface registerCityViewController ()
{
    NSString *provice;
    NSString *proviceName;

}
@end

@implementation registerCityViewController
@synthesize arForDetail=_arForDetail;
@synthesize tableView=_tableView;
@synthesize isOpen,selectIndex;

- (void)viewDidLoad
{
	[super viewDidLoad];
	
    reqionInfoFunc *region = [[reqionInfoFunc alloc] init];
    region.delegate=self;
    [region getRegion:@"1"];
    

	
}
- (void) didReqionInfoSuccess : (id)data
{
	_arForDetail=[[NSMutableArray alloc] init];
    
    NSMutableDictionary * dic ;
    NSMutableArray  * arry;
    NSArray *cbData = (NSArray *)data;

    for (int i=0; i<cbData.count; i++) {
        dic = [[NSMutableDictionary alloc] init];
        arry = [[NSMutableArray alloc] init];
        [dic setValue:arry forKey:[[NSString alloc] initWithFormat:@"%d",i]];
        [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"agency_id"] forKey:@"agency_id"];
        [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"parent_id"] forKey:@"parent_id"];
        [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"region_id"] forKey:@"region_id"];
        [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"region_name"] forKey:@"region_name"];
        [dic setValue:[[cbData objectAtIndex:i] objectForKey:@"region_type"] forKey:@"region_type"];
        [_arForDetail addObject:dic];
    }
    [_tableView reloadData];
}
- (void) didReqionInfoFailed : (NSString *)err
{
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_arForDetail count];//第零个不显示
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isOpen) {
        if (self.selectIndex.section == section) {
            NSString * rowStr = [NSString stringWithFormat:@"%i",section];
            NSMutableDictionary * dic = [_arForDetail objectAtIndex:section];
            NSMutableArray * array = [dic objectForKey:rowStr];
            return [array count]+1;;
        }
    }
    return 1;
}

// Customize the appearance of table view cells.
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell1";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[Cell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//	
////	cell.textLabel.text=[[arForTable objectAtIndex:indexPath.row] valueForKey:@"name"];
////	[cell setIndentationLevel:[[[self.arForTable objectAtIndex:indexPath.row] valueForKey:@"level"] intValue]];
//	
//    return cell;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath.section=%d",indexPath.section);
    if (self.isOpen&&self.selectIndex.section == indexPath.section&&indexPath.row!=0) {
    
        static NSString *CellIdentifier = @"Cell1";
        Cell1 *cell = (Cell1*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
            cell.backgroundColor=[UIColor clearColor];
        }
        NSString * str = [NSString stringWithFormat:@"%i",indexPath.section];
        NSMutableDictionary * dic = [_arForDetail objectAtIndex:indexPath.section];
        
        NSArray *list = [dic objectForKey:str];
        NSLog(@"[list objectAtIndex:indexPath.row-1]=%@",[list objectAtIndex:indexPath.row-1]);
//        cell.textLabel.text = ;
        cell.titleLabel.textColor=[UIColor darkGrayColor];
        cell.titleLabel.text = [[list objectAtIndex:indexPath.row-1] valueForKey:@"region_name"];
        cell.textLabel.font=[UIFont systemFontOfSize:14];
        cell.textLabel.textColor=[UIColor darkGrayColor];
        [cell changeArrowWithUp:([self.selectIndex isEqual:indexPath]?YES:NO)];
//        if (![self.selectIndex isEqual:indexPath]) {
//            [cell setIndentationLevel:[[[list objectAtIndex:indexPath.row-1] valueForKey:@"region_type"] intValue]];
//        }

        return cell;
    }else
    {
        
        static NSString *CellIdentifier = @"CellIdentifier";
        UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
//        NSString * str = [NSString stringWithFormat:@"%i",indexPath.row];
        NSMutableDictionary * dic = [_arForDetail objectAtIndex:indexPath.section];
        
        
        //        NSMutableArray * array = [[_fenLeiDataArray objectAtIndex:indexPath.section] objectForKey:str];
        //        NSLog(@"array=%@",array);
        
        NSString *name = [dic objectForKey:@"region_name"];
        cell.textLabel.text = name;
        return cell;
    }
    
}

- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert nextDo:(BOOL)nextDoInsert
{
    self.isOpen = firstDoInsert;
//    UITableViewCell *cell = (UITableViewCell *)[_tableView cellForRowAtIndexPath:self.selectIndex];
//    [cell changeArrowWithUp:firstDoInsert];
    [_tableView beginUpdates];
    
    int section = self.selectIndex.section;
    NSString * str = [NSString stringWithFormat:@"%i",self.selectIndex.section ];
    NSMutableDictionary * dic =[_arForDetail objectAtIndex:self.selectIndex.section];
    provice =[dic objectForKey:@"region_id"];
    proviceName =[dic objectForKey:@"region_name"];
    NSMutableArray * array =[dic objectForKey:str];
    if (array.count == 0) {
        reqionInfoFunc *region = [[reqionInfoFunc alloc] init];
        array = (NSMutableArray *)[region getRegionDirect:[dic valueForKey:@"region_id"]];
        [dic setValue:array forKey:str];
    }

    int contentCount = [array count];
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (firstDoInsert)
    {   [_tableView insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
	else
    {
        [_tableView deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    
    
	
	[_tableView endUpdates];
    if (nextDoInsert) {
        self.isOpen = YES;
        self.selectIndex = [_tableView indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES   nextDo:NO ];
    }
    if (self.isOpen) [_tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        if ([indexPath isEqual:self.selectIndex]) {
            self.isOpen = NO;
            [self didSelectCellRowFirstDo:NO   nextDo:NO];
            self.selectIndex = nil;
            
        }else
        {
            if (!self.selectIndex) {
                self.selectIndex = indexPath;
                [self didSelectCellRowFirstDo:YES  nextDo:NO];
                
            }else
            {
                
                [self didSelectCellRowFirstDo:NO  nextDo:YES];
            }
        }
        
    }else
    {
        NSString * str = [NSString stringWithFormat:@"%i",indexPath.section];
        NSMutableDictionary * dic = [_arForDetail objectAtIndex:indexPath.section];
        //         [cell cellBackgroundColor ];
        
        NSArray *list = [dic objectForKey:str];
        
        NSLog(@"%d",indexPath.row-1);
        //
        NSDictionary* city = (NSDictionary*)[list objectAtIndex:indexPath.row-1];
        
        registerDistrictViewController * district = [[registerDistrictViewController alloc] initWithNibName:@"registerDistrictViewController" bundle:nil];
        NSLog(@"[city objectForKey:]=%@",[city objectForKey:@"region_name"]);
        district.cityID = [city objectForKey:@"region_id"];
        district.cityName = [city objectForKey:@"region_name"];
        district.proviceID = provice;
        district.provName = proviceName;

        [self.navigationController pushViewController:district animated:YES];
//        self.selectIndex = nil;
    }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
