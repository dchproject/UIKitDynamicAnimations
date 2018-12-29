//
//  MainView.h
//  UIKitDynamicAnimations
//
//  Created by Admin on 29/12/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DraggableView;
@class PaneBehavior;

typedef NS_ENUM(NSInteger, PaneState) {
    PaneStateOpen,
    PaneStateClosed,
};

@interface MainView : UIView
@property (nonatomic, readonly) PaneState paneState;
@end
