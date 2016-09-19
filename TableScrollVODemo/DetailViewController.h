//
//  DetailViewController.h
//  TableScrollVODemo
//
//  Created by Ortwin Gentz on 19.09.16.
//  Copyright © 2016 FutureTap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

