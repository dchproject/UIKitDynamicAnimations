//
//  DraggableView.m
//  UIKitDynamicAnimations
//
//  Created by Admin on 29/12/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "DraggableView.h"

@implementation DraggableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)setup {
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action: @selector(didPan:)];
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    [self addGestureRecognizer:recognizer];
    [self addGestureRecognizer:swipeGesture];
}

-(void)didPan:(UIPanGestureRecognizer *)recognizer {
    CGPoint point = [recognizer translationInView:self.superview];
    self.center = CGPointMake(self.center.x, self.center.y + point.y);
    [recognizer setTranslation:CGPointZero inView:self.superview];
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [recognizer velocityInView:self.superview];
        velocity.x = 0;
        [self.delegate draggableView:self draggingEndedWithVelocity:velocity];
    } else if (recognizer.state == UIGestureRecognizerStateBegan) {
        [self.delegate draggableViewBeganDragging:self];
    }
}

-(void)swipeGesture:(UISwipeGestureRecognizer *)swipeGesture {
    
    if (swipeGesture.state == UIGestureRecognizerStateEnded) {
//         [self.delegate draggableView:self draggingEndedWithVelocity:velocity];
    } else if (swipeGesture.state == UIGestureRecognizerStateBegan) {
      [self.delegate draggableViewBeganDragging:self];
    }
}

@end
