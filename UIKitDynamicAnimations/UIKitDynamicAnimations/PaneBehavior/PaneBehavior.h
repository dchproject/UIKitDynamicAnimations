//
//  PaneBehavior.h
//  UIKitDynamicAnimations
//
//  Created by Admin on 29/12/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaneBehavior : UIDynamicBehavior

@property (nonatomic) CGPoint targetPoint;
@property (nonatomic) CGPoint velocity;

- (instancetype)initWithItem:(id <UIDynamicItem>)item;

@end
