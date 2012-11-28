//
//  DetailViewController.m
//  CFAII
//
//  Created by Francois Chaubard on 4/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize scrollView1;
@synthesize pageControl;
@synthesize subject;
@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
const CGFloat kScrollObjHeight	= 400.0;
const CGFloat kScrollObjWidth	= 320.0;

-(void)writePartNumber:(NSString *)input{
    self.subject = input;
}



#pragma mark -
#pragma mark PageControl stuff
- (IBAction)changePage:(id)sender 
{
	
    CGRect frame = scrollView1.frame;
    frame.origin.x = frame.size.width * pageControl.currentPage;
    frame.origin.y = 0;
	
    [scrollView1 scrollRectToVisible:frame animated:YES];
    
	
    //	When the animated scrolling finishings, scrollViewDidEndDecelerating will turn this off
    
    pageControlIsChangingPage = YES;
}




-(id)init
{
    if (self = [super init])
    {
        self.subject = @"Ethics";
    }
    return self;
}

- (void)layoutScrollImages
{
	UIImageView *view = nil;
	NSArray *subviews = [scrollView1 subviews];
    
	// reposition all image subviews in a horizontal serial fashion
	CGFloat curXLoc = 0;
	for (view in subviews)
	{
		if ([view isKindOfClass:[UIImageView class]] && view.tag > 0)
		{
			CGRect frame = view.frame;
			frame.origin = CGPointMake(curXLoc, 0);
			view.frame = frame;
			
			curXLoc += (kScrollObjWidth);
		}
	}
	
	// set the content size so it can be scrollable
	[scrollView1 setContentSize:CGSizeMake((curXLoc), [scrollView1 bounds].size.height)];
}



#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
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
    [self configureView];
    

    NSLog(@"%@", subject);
    
    
    
    
    [scrollView1 setBackgroundColor:[UIColor blackColor]];
	[scrollView1 setCanCancelContentTouches:NO];
	scrollView1.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	scrollView1.clipsToBounds = YES;		// default is NO, we want to restrict drawing within our scrollview
	scrollView1.scrollEnabled = YES;
	
	// pagingEnabled property default is NO, if set the scroller will stop or snap at each photo
	// if you want free-flowing scroll, don't set this property.
	scrollView1.pagingEnabled = YES;

    
    int numImages;
    
    if ([subject isEqualToString:@"Ethics"])
        numImages=1;
    else if([subject isEqualToString:@"Quant"])
        numImages=4;
    else if([subject isEqualToString:@"CF"])
        numImages=7;
    else if([subject isEqualToString:@"Der"])
        numImages=9;
    else if([subject isEqualToString:@"Econ"])
        numImages=5;
    else if([subject isEqualToString:@"Equity"])
        numImages=14;
    else if([subject isEqualToString:@"FI"])
        numImages=6;
    else if([subject isEqualToString:@"PM"])
        numImages=5;
    else if([subject isEqualToString:@"FRA"])
        numImages=9;
    
    
    
    int i=1;
    
    @try {
        
        while (i<=numImages) {
            
            NSString *imageName = [NSString stringWithFormat:@"%@_%d.jpg", subject, i];
            
            NSLog(@"image: %@", imageName);
            
            
            
            
            
            
            /*
            NSStringEncoding encoding;
            NSError *error;
            NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSString *directory = [documentsPath stringByAppendingPathComponent:imageName];
            NSString *fileContents = [NSString stringWithContentsOfFile:directory 
                                                           usedEncoding: &encoding 
                                                                  error:&error];
             */
            /*
             NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSString *directory = [documentsPath stringByAppendingPathComponent:documentsPath];
            BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:directory];
            */
             /*
            
            NSFileManager *fm = [NSFileManager defaultManager];
            BOOL fileExists=[fm fileExistsAtPath:imageName]? 1 : 0;
            */
            //NSLog(@"documentsPath? %@", documentsPath);
            //NSLog(@"directory? %@", directory);
            //NSLog(@"exists? %@", fileContents);
            //NSLog(@"exists? %@", error);
                
            
            
                UIImage *image = [UIImage imageNamed:imageName];
                UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            
                // setup each frame to a default height and width, it will be properly placed when we call "updateScrollList"
                CGRect rect = imageView.frame;
                rect.size.height = kScrollObjHeight;
                rect.size.width = kScrollObjWidth;
                imageView.frame = rect;
                imageView.tag = i;	// tag our images for later use when we place them in serial fashion
                [scrollView1 addSubview:imageView];
            
                i++;
        
        }
        
        [self layoutScrollImages];
        pageControl.numberOfPages = i-1;
    }
    @catch (NSException *exception) {
        NSLog(@"Exception %@", exception);
        
    }
    @finally {
        
    }
    
    
    
}


- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = scrollView1.frame.size.width;
    int page = floor((scrollView1.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
	
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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

@end
