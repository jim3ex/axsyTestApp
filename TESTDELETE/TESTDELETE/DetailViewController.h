//
//  DetailViewController.h
//  TESTDELETE
//
//  Created by James Holland on 08/12/2015.
//  Copyright © 2015 The Digital Forge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

