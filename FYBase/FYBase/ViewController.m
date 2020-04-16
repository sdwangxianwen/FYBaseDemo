//
//  ViewController.m
//  FYBase
//
//  Created by wang on 2020/4/16.
//  Copyright © 2020 wang. All rights reserved.
//

#import "ViewController.h"
#import "DemoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    DemoViewController *demoVC = [[DemoViewController alloc] init];
    [self.navigationController pushViewController:demoVC animated:YES];
}


@end
