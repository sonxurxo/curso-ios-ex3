//
//  PlistLoadOperation.m
//  Ex3
//
//  Created by Xurxo Méndez Pérez on 25/12/13.
//  Copyright (c) 2013 SmartGalApps. All rights reserved.
//

#import "PlistLoadOperation.h"

@implementation PlistLoadOperation

- (void)main {
    
    NSURL *dataURL = [NSURL URLWithString:@"http://icodeblog.com/samples/nsoperation/data.plist"];
    
    NSArray *tmp_array = [NSArray arrayWithContentsOfURL:dataURL];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PlistLoadOperationFinished" object:nil userInfo:@{@"array" : tmp_array}];
}

@end
