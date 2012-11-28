//
//  MasterViewController.m
//  CFAII
//
//  Created by Francois Chaubard on 4/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"


@implementation MasterViewController
@synthesize subjectList;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    
    subjectList = [[NSMutableArray alloc] initWithObjects:
                   @"Ethics", 
                   @"Quant", 
                   @"Econ", 
                   @"FRA", 
                   @"CF", 
                   @"PM", 
                   @"FI",
                   @"Der",
                   @"Equity",
                   nil];
    
    
    //NSLog(@"count: %@", [subjectList count]);
    
    return [subjectList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    /*UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if (cell == nil) {
     cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
     }
     
     // Configure the cell...
     NSLog(@"Attribute Added: %@ \n", [[[issuesList objectAtIndex:indexPath.row] issueInfoArray] objectAtIndex:1] );
     */
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
        
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        UIFont *titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:18.0];
        [[cell textLabel] setFont:titleFont];
        
        UIFont *detailFont = [UIFont fontWithName:@"Georgia" size:16.0];
        [[cell detailTextLabel] setFont:detailFont];
    }
    //NSMutableArray *rowIssueArray = [[self.issuesList objectAtIndex:indexPath.row] issueInfoArray];
    
    //NSString *detailText = [subjectList objectAtIndex:indexPath.row]; // Just cuz...
    /*NSString *title = [NSString stringWithFormat:
     @"%@      %@      %@      %@      ",
     [rowIssueArray objectAtIndex:0],
     [rowIssueArray objectAtIndex:2],
     [rowIssueArray objectAtIndex:10],
     [rowIssueArray objectAtIndex:11]];
     
     [[cell textLabel] setText:(title == nil || [title length] < 1 ? @"?" : title)];
     
     
     
     [[cell detailTextLabel] setText:detailText];
     */
    
    
    /*NSString *path = [book imageFilePath];
     if (path != nil)
     {
     UIImage *image = [UIImage imageNamed:path];
     image = [image imageScaledToSize:CGSizeMake(36.0, 42.0)];
     [[cell imageView] setImage:image];
     }
     */
    
    
    cell.textLabel.text = [self.subjectList objectAtIndex:indexPath.row];
    //cell.detailTextLabel.text = [[[self.issuesList objectAtIndex:indexPath.row]issueInfoArray] objectAtIndex:2];
    
    
    NSLog(@"cell: %@", [subjectList objectAtIndex:indexPath.row]); 
    
    return cell;
}

#pragma mark - segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
     if ([[segue identifier] isEqualToString:@"showSubject"]) 
     {
     
         // Assume self.view is the table view
         NSIndexPath *path = [self.tableView indexPathForSelectedRow];
         
         [segue.destinationViewController setSubject:[self.subjectList objectAtIndex:path.row]];
     
         NSLog(@"Entered Segue: %@", [segue identifier]);
     
     }
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
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
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
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

@end
