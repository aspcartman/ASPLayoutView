//
// Created by ASPCartman on 16/04/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASPLayoutView : UIView
@property (nonatomic, assign) BOOL centered;

- (void) addVertically:(UIView *)view offset:(float)offset;
- (void) addVertically:(UIView *)view offset:(float)offset centered:(BOOL)centered;

- (void) addHorizontally:(UIView *)view offset:(float)offset;
- (void) addHorizontally:(UIView *)view offset:(float)offset centered:(BOOL)centered;

- (void) showIfTrue:(BOOL)show view:(UIView *)view;
- (void) hideView:(UIView *)view;
- (void) showView:(UIView *)view;
@end