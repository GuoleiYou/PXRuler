//
//  ViewController.m
//  PXRuler
//
//  Created by YOUGUOLEI on 2018/9/26.
//  Copyright © 2018 YOUGUOLEI. All rights reserved.
//

#import "ViewController.h"
#import "PXRuler/PXRulerManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 60, 100, 60)];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitle:@"Ruler" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showRuler) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    for (NSInteger i = 0; i < 10; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i%2 * 100 + 60, i/2 * 60 + 160, 80, 40)];
        label.text = [NSString stringWithFormat:@"Label %ld", i];
        label.backgroundColor = [UIColor lightGrayColor];
        label.textColor = [UIColor redColor];
        [self.view addSubview:label];
    }
}

- (void)showRuler
{
    [[PXRulerManager sharedManager] showRuler];
}


@end
