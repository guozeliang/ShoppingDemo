//
//  ViewController.m
//  ShopingDemo
//
//  Created by ZhipengLi on 15/11/20.
//  Copyright (c) 2015年 guozeliang. All rights reserved.
//

#import "ViewController.h"
#import "SRFSurfboard.h"


@interface ViewController ()<SRFSurfboardDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
//    [self performSegueWithIdentifier:@"SurfboardSegue" sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return [super shouldPerformSegueWithIdentifier:identifier sender:sender];
}


//

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SRFSurfboardViewController *surfboard = segue.destinationViewController;
   
    NSString *path = [[NSBundle mainBundle] pathForResource:@"panels" ofType:@"json"];
    NSArray *panels = [SRFSurfboardViewController panelsFromConfigurationAtPath:path];
    [surfboard setPanels:panels];
    __weak typeof(ViewController) *weakSelf = self;
    surfboard.delegate = self;
    
    surfboard.backgroundColor = self.view.backgroundColor;
    UIWindow *window = [[[UIApplication sharedApplication]delegate] window];
    [window addSubview:surfboard.view];
}




@end
