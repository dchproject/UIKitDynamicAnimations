//
//  ViewController.m
//  UIKitDynamicAnimations
//
//  Created by Admin on 29/12/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)loadView {
    [super loadView];
    MainView *mainView = [[MainView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:mainView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
}


@end
