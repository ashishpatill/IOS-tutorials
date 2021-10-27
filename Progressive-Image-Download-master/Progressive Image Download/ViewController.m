//
//  ViewController.m
//  Progressive Image Download
//
//  Created by Ashish Pisey on 11/24/14.
//  Copyright (c) 2014 Ashish Pisey. All rights reserved.
//

#import "ViewController.h"

#define LARGE_PHOTO_URL @"https://www.apple.com/v/imac-with-retina/a/images/overview/5k_image.jpg"

// These images are Creative Commons licensed.  Copyright Eugene Kukulka
// http://www.flickr.com/photos/eugene-kukulka/
#define SMALL_PHOTO_URL @"http://farm8.staticflickr.com/7205/6909138889_154a903bcb_z.jpg"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startDownloadAction:(UIButton *)sender
{
    
    NSArray *progressiveURLS = @[[NSURL URLWithString:SMALL_PHOTO_URL]];
    
    UIImage *placeholderImage = [UIImage imageNamed:@"christmas.jpg"];
    
    [self.imageView setImageProgressivelyWithImageURLs:progressiveURLS
                                      placeholderImage:placeholderImage
                                            completion:^(NSURL *imageURL, BOOL success, NSError *error, BOOL completed) {
                                                NSLog(@"Completed %@", imageURL);
                                                
                                                // just to make the effect more obvious
                                                sleep(1);
                                            }];
}
@end
