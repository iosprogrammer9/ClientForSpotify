//
//  ViewController.m
//  Spotify
//
//  Created by carlos aldazabal on 01/04/15.
//  Copyright (c) 2015 JPA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)fetchGreeting;
{
    
    NSOperationQueue *queue = [NSOperationQueue new];
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImage) object:nil];
    
    [queue addOperation:operation];
    
}

- (void) downloadImage{
    
    NSURL *url = [NSURL URLWithString:@"https://api.spotify.com/v1/search?q=santana&type=album"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
     completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
             
             NSDictionary *dictionary = [greeting objectForKey:@"albums"];
             NSArray *items = dictionary[@"items"];
             NSArray *images = items[0][@"images"];
             // = images[0][@"url"];
             
             
             
        
             
             [self setUrlImage: @"https://i.scdn.co/image/bbd1f19477ee2cb30c1ae9cece461b156d2bb48d"];
             NSLog(@"logue luego de setear");
             NSLog([self urlImage]);
             
             self.greetingContent.text = items[0][@"name"];
             
             NSLog(@"inicio en seteo imagen");
             NSLog([self urlImage]);
             
             NSLog(@"final en seteo imagen");
             NSString *imageURL2 = self.urlImage;
             NSURL *url2 = [NSURL URLWithString:imageURL2];
             NSData *data = [NSData dataWithContentsOfURL:url2];
             UIImage *image = [UIImage imageWithData:data];
             [self.backgroundImage performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:YES];
         }
    }];
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
