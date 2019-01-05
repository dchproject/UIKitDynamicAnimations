//
//  MainView.m
//  UIKitDynamicAnimations
//
//  Created by Admin on 29/12/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "MainView.h"
#import "DraggableView.h"
#import "PaneBehavior.h"
#import "Animator.h"
#import <UIKit/UIKit.h>

@interface MainView() <DraggableViewDelegate>

@property (nonatomic) PaneState paneState;
@property (nonatomic) DraggableView *pane;
@property (nonatomic) UIDynamicAnimator *animator;
@property (nonatomic, strong) PaneBehavior *paneBehavior;

@end

@implementation MainView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.backgroundColor = [UIColor whiteColor];
    
    CGSize size = self.bounds.size;
    self.paneState = PaneStateClosed;
    self.pane = [[DraggableView alloc] initWithFrame:CGRectMake(0, size.height * .75, size.width, size.height)];
    self.pane.backgroundColor = [UIColor grayColor];
    self.pane.layer.cornerRadius = 8;
    self.pane.delegate = self;
    [self addSubview:self.pane];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    [self addGestureRecognizer:tapRecognizer];
    [self addGestureRecognizer:swipeGesture];
}

-(void)animatePaneWithInitialVelocity:(CGPoint)initialVelocity {
    if (!self.paneBehavior) {
        PaneBehavior *behavior = [[PaneBehavior alloc] initWithItem:self.pane];
        self.paneBehavior = behavior;
    }
    self.paneBehavior.targetPoint = self.targetPoint;
    self.paneBehavior.velocity = initialVelocity;
    [self.animator addBehavior:self.paneBehavior];
    
}

- (CGPoint)targetPoint
{
    CGSize size = self.bounds.size;
    return self.paneState == PaneStateClosed > 0 ? CGPointMake(size.width/2, size.height * 1.25) : CGPointMake(size.width/2, size.height/2 + 50);
}

#pragma mark DraggableViewDelegate

- (void)draggableView:(DraggableView *)view draggingEndedWithVelocity:(CGPoint)velocity
{
    PaneState targetState = velocity.y >= 0 ? PaneStateClosed : PaneStateOpen;
    self.paneState = targetState;
    [self animatePaneWithInitialVelocity:velocity];
}

- (void)draggableViewBeganDragging:(DraggableView *)view
{
    [self.animator removeAllBehaviors];
}

#pragma mark Actions

- (void)didTap:(UITapGestureRecognizer *)tapRecognizer
{
    self.paneState = self.paneState == PaneStateOpen ? PaneStateClosed : PaneStateOpen;
    [self animatePaneWithInitialVelocity:self.paneBehavior.velocity];
}

-(void)swipeGesture:(UISwipeGestureRecognizer *)swipeGesture
{
    switch (swipeGesture.direction) {
        case UISwipeGestureRecognizerDirectionUp:            
            break;
        case UISwipeGestureRecognizerDirectionDown:
            break;
        default:
            break;
    }
}

@end
