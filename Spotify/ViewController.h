//
//  ViewController.h
//  Spotify
//
//  Created by carlos aldazabal on 01/04/15.
//  Copyright (c) 2015 JPA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (nonatomic, strong) IBOutlet UILabel *greetingId;
@property (nonatomic, strong) IBOutlet UILabel *greetingContent;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property NSMutableString *urlImage;


- (IBAction)fetchGreeting;

@end

