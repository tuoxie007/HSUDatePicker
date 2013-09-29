//
//  HSUViewController.m
//  Demo
//
//  Created by Jason Hsu on 13-9-17.
//  Copyright (c) 2013年 Jason Hsu. All rights reserved.
//

#import "HSUViewController.h"
#import "HSUDatePicker.h"

@interface HSUViewController () <HSUDatePickerDelegate, UINavigationControllerDelegate>

@property (nonatomic, weak) UIButton *dateButton;

@end

@implementation HSUViewController

- (void)viewDidLoad
{
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"Select Date" forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:self action:@selector(selectDate) forControlEvents:UIControlEventTouchUpInside];
    button.center = self.view.center;
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    self.dateButton = button;
    
    [super viewDidLoad];
}

- (void)selectDate
{
    HSUDatePicker *datePicker = [[HSUDatePicker alloc] initWithStartYear:2010 endYear:2014];
    datePicker.delegate = self;
    [self presentViewController:datePicker animated:YES completion:nil];
}

- (void)datePickerDidCancelSelect:(HSUDatePicker *)datePicker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)datePicker:(HSUDatePicker *)datePicker didSelectDate:(NSDate *)date
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setDateFormat:@"yyy-MM-dd"];
    NSString *dateText = [fmt stringFromDate:date];
    [self.dateButton setTitle:dateText forState:UIControlStateNormal];
    [self.dateButton sizeToFit];
    self.dateButton.center = self.view.center;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
