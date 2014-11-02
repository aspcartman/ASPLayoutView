//
// Created by ASPCartman on 16/04/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import <KeepLayout/KeepAttribute.h>
#import "ASPLayoutView.h"
#import "UIView+KeepLayout.h"
#import "UIView+ContraintsAffectingView.h"
#import "NSMutableArray+BlocksKit.h"

@implementation ASPLayoutView
{
	NSMutableArray *_savedConstraintsForHiddenViews;
	NSMutableArray *_retainedHiddenViews;
}
- (id) init
{
	self = [super init];
	if (self)
	{
		_savedConstraintsForHiddenViews = [NSMutableArray arrayWithCapacity:10];
		_retainedHiddenViews            = [NSMutableArray arrayWithCapacity:10];
	}

	return self;
}
- (void) addVertically:(UIView *)view offset:(float)offset
{
	[self addVertically:view offset:offset centered:YES];
}

- (void) addVertically:(UIView *)view offset:(float)offset centered:(BOOL)centered
{
	NSArray *currentViews       = self.subviews;
	[self addSubview:view];
	for (UIView *subview in currentViews)
	{
		view.keepTopOffsetTo(subview).min = KeepRequired(offset);
	}
	view.keepTopInset.equal     = currentViews.count ? KeepFitting(0) : KeepRequired(offset);
	view.keepInsets.min         = KeepRequired(0);
	view.keepSize.equal         = KeepFitting(1);
	if (centered)
	{
		[view keepHorizontallyCentered];
	}
}



- (void) addHorizontally:(UIView *)view offset:(float)offset
{
	NSArray *currentViews    = self.subviews;
	[self addSubview:view];
	for (UIView *subview in currentViews)
	{
		view.keepLeftOffsetTo(subview).min = KeepRequired(offset);
	}
	view.keepLeftInset.equal = currentViews.count ? KeepFitting(0) : KeepRequired(offset);
	view.keepInsets.min      = KeepRequired(0);
	view.keepSize.equal      = KeepFitting(1);
	[view keepVerticallyCentered];
}

- (void) showIfTrue:(BOOL)show view:(UIView *)view
{
	if (show)
	{
		[self showView:view];
	}
	else
	{
		[self hideView:view];
	}
}

- (void) hideView:(UIView *)view
{
	if ([_retainedHiddenViews containsObject:view])
	{
		return; // Already hidden
	}

	[_retainedHiddenViews addObject:view];
	NSArray *constraints = [self constraintsAffectingView:view];
	[_savedConstraintsForHiddenViews addObjectsFromArray:constraints];
	[self removeConstraints:constraints];

	view.alpha                  = 0;
	view.userInteractionEnabled = NO;
}

- (void) showView:(UIView *)view
{
	if (![_retainedHiddenViews containsObject:view])
	{
		return; // Already shown
	}

	view.alpha                  = 1;
	view.userInteractionEnabled = YES;

	[_retainedHiddenViews removeObject:view];

	[_savedConstraintsForHiddenViews bk_performSelect:^BOOL(NSLayoutConstraint *constraint)
	{
		UIView *first = constraint.firstItem;
		UIView *second = constraint.secondItem;
		if (([first isEqual:view] || [second isEqual:view])&&!([_retainedHiddenViews containsObject:first] || [_retainedHiddenViews containsObject:second]))
		{
			[self addConstraint:constraint];
			return NO;
		}
		return YES;
	}];

}
@end