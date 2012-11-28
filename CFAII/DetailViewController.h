//
//  DetailViewController.h
//  CFAII
//
//  Created by Francois Chaubard on 4/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate> {
    
    IBOutlet UIScrollView *scrollView1;	// holds five small images to scroll horizontally
    IBOutlet UIPageControl* pageControl;
    BOOL pageControlIsChangingPage;
    
}


@property (nonatomic, retain) UIPageControl* pageControl;
@property (nonatomic, retain) UIView *scrollView1;
@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) NSString *subject;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

- (IBAction)changePage:(id)sender;

@end
