//
//  DatePicker.h
//  DatePicker
//
//  Created by Jason Hsu on 13-9-17.
//  Copyright (c) 2013年 Jason Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HSUDatePickerDelegate;
@interface HSUDatePicker : UINavigationController

@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, assign) NSInteger startYear;
@property (nonatomic, assign) NSInteger endYear;
@property (nonatomic, assign, getter = isSupportMultiSelection) BOOL supportMultiSelection;
@property (nonatomic, strong) NSDate *selectedDate;
@property (nonatomic, strong) NSDateComponents *selectedDateComponents;
@property (nonatomic, weak) id<HSUDatePickerDelegate, UINavigationControllerDelegate> delegate;

- (id)initWithStartYear:(NSInteger)startYear endYear:(NSInteger)endYear;

@end

@protocol HSUDatePickerDelegate <NSObject>

- (void)datePicker:(HSUDatePicker *)datePicker didSelectDate:(NSDate *)date;
- (void)datePickerDidCancelSelect:(HSUDatePicker *)datePicker;

@end

