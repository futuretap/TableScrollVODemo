//
//  TableView.m
//  TableScrollVODemo
//
//  Created by Ortwin Gentz on 19.09.16.
//  Copyright © 2016 FutureTap. All rights reserved.
//

#import "TableView.h"

@implementation TableView

- (NSInteger)accessibilityElementCount {
	return  super.accessibilityElementCount;
}

- (nullable id)accessibilityElementAtIndex:(NSInteger)index {
	return [super accessibilityElementAtIndex:index];
}
/*
 Returns the ordered index for an accessibility element
 default == NSNotFound
 */

- (NSInteger)indexOfAccessibilityElement:(id)element {
	return [super indexOfAccessibilityElement:element];
}

- (void)accessibilityElementDidBecomeFocused {
	[super accessibilityElementDidBecomeFocused];
}
@end
