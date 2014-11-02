//
// Created by ASPCartman on 16/04/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASPLayoutView : UIView
- (void) addVertically:(UIView *)view offset:(float)offset;
- (void) addVertically:(UIView *)view offset:(float)offset centered:(BOOL)centered;
- (void) addHorizontally:(UIView *)view offset:(float)offset;
- (void) showIfTrue:(BOOL)show view:(UIView *)view;
- (void) hideView:(UIView *)view;
- (void) showView:(UIView *)view;
@end