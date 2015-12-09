//
//  DetailViewController.h
//  axsyTest
//
//  Created by James Holland on 08/12/2015.
//  Copyright © 2015 The Digital Forge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UIImageView *ivPhoto;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblAlbumName;

@end

