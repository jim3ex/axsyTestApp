//
//  DetailViewController.m
//  axsyTest
//
//  Created by James Holland on 08/12/2015.
//  Copyright © 2015 The Digital Forge. All rights reserved.
//

#import "DetailViewController.h"
#import "Picture.h"
#import "Album.h"
#import "AppDelegate.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        
        Picture *picture = (Picture *)_detailItem;
        DLog(@"%@",picture);
        _lblTitle.text = picture.title;
        
        NSArray *albums = [picture.albums allObjects]; //Because a picture can be possibly be in several albums
        DLog(@"%@",albums);
        NSMutableString *albumTitles = [NSMutableString string];
        for (Album *thisAlbum in albums) {
            [albumTitles appendFormat:@"%@\n",thisAlbum.title];
        }
        
        _lblAlbumName.text = albumTitles;
        
        if(!picture.imageFullSize) {
            //Lazy load in background
            dispatch_async(dispatch_get_global_queue(0,0), ^{
                NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: picture.url]];
                if ( data == nil )
                    return;
                dispatch_async(dispatch_get_main_queue(), ^{
                    _ivPhoto.image = [UIImage imageWithData: data];
                    picture.imageFullSize = data;
                    [[AppDelegate sharedAppDelegate] saveContext];
                });
                
            });
        } else {
            _ivPhoto.image = [UIImage imageWithData: picture.imageFullSize];
        }
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
