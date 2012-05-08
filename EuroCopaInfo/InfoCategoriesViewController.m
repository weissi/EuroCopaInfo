//
//  InfoCategoriesViewController.m
//  EuroCopaInfo
//
//  Created by Johannes Weiß on 5/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InfoCategoriesViewController.h"
#import "StadiumsViewController.h"
#import "TeamsViewController.h"

#import "FRLayeredNavigationController/FRLayeredNavigation.h"

@interface InfoCategoriesViewController ()

@end

@implementation InfoCategoriesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITableView *tv = (UITableView *)self.view;
    tv.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    tv.separatorColor = [UIColor darkGrayColor];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else {
        return 2;
    }
}

- (NSString *)tableTextAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return @"Stadiums";
    } else {
        return @"Teams";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
    } else {
        return 64;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TitleCellIdentifier = @"TitleCell";
    static NSString *ContentCellIdentifier = @"Cell";
    UITableViewCell *cell;
    
    if (indexPath.section > 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:ContentCellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:ContentCellIdentifier];
        }
        cell.textLabel.text = [self tableTextAtIndexPath:indexPath];
        NSString *path = [[NSBundle mainBundle] pathForResource:[self tableTextAtIndexPath:indexPath].lowercaseString
                                                         ofType:@"png"];
        UIImage *i = [UIImage imageWithContentsOfFile:path];
        cell.imageView.image = i;
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:TitleCellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:ContentCellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.font = [UIFont boldSystemFontOfSize:30];
            cell.textLabel.textColor = [UIColor whiteColor];
            cell.textLabel.textAlignment = UITextAlignmentCenter;
        }
        
        cell.textLabel.text = @"Euro Copa Info";        
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section > 0) {
        UIViewController *vc;
        
        if (indexPath.row == 0) {        
            vc = [[StadiumsViewController alloc] init];
        } else {
            vc = [[TeamsViewController alloc] init];
        }
        
        [self.layeredNavigationController pushViewController:vc inFrontOf:self maximumWidth:NO animated:YES configuration:^(FRLayeredNavigationItem *item) {
            item.nextItemDistance = 44;
        }];
    }
}

@end
