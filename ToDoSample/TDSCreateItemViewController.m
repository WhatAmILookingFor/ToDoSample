//
//  TDSCreateItemViewController.m
//  ToDoSample
//
//  Created by iurano on 6/8/14.
//  Copyright (c) 2014 WhatAmILookingFor. All rights reserved.
//

#import "TDSCreateItemViewController.h"

@interface TDSCreateItemViewController ()

@end

@implementation TDSCreateItemViewController

- (IBAction)saveButtonTapped:(id)sender {
    if ([self.delegate respondsToSelector:@selector(createItemViewControllerDidFinish:item:)]) {
       // 入力文字列を取得する
        NSString *item = self.textField.text;
        [self.delegate createItemViewControllerDidFinish:self item:item];
    }
}
- (IBAction)cancelButtonTapped:(id)sender {
    if ([self.delegate respondsToSelector:@selector(createItemViewControllerDidCancel:)]) {
        [self.delegate createItemViewControllerDidCancel:self];
    }
}
@end
