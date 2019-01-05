//
//  Animator.h
//  UIKitDynamicAnimations
//
//  Created by Admin on 29/12/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

@protocol Animation <NSObject>
- (void)animationTick:(CFTimeInterval)dt finished:(BOOL *)finished;
@end

@interface Animator : NSObject

@end
