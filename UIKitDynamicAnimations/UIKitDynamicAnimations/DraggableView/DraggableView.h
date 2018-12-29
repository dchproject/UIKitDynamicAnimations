//
//  DraggableView.h
//  UIKitDynamicAnimations
//
//  Created by Admin on 29/12/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DraggableView;

@protocol DraggableViewDelegate <NSObject>

- (void)draggableView:(DraggableView *)view draggingEndedWithVelocity:(CGPoint)velocity;
- (void)draggableViewBeganDragging:(DraggableView *)view;

@end

@interface DraggableView : UIView

@property (nonatomic, weak) id <DraggableViewDelegate> delegate;

@end
