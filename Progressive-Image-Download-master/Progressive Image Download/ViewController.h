//
//  ViewController.h
//  Progressive Image Download
//
//  Created by Ashish Pisey on 11/24/14.
//  Copyright (c) 2014 Ashish Pisey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "UIImageView+AFProgressiveImageDownload.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)startDownloadAction:(UIButton *)sender;
@end

