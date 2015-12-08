//
//  ImageDataTableViewCell.h
//  axsyTest
//
//  Created by James Holland on 08/12/2015.
//  Copyright © 2015 The Digital Forge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageDataTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *ivThumbnailImage; //The thumbnail image view
@property (strong, nonatomic) IBOutlet UILabel *lblTitle; //The large title label
@property (strong, nonatomic) IBOutlet UILabel *lblTimestamp; //The timestamp label


@end
