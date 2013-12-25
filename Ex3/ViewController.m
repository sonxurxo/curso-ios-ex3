//
//  ViewController.m
//  Ex3
//
//  Created by Xurxo Méndez Pérez on 25/12/13.
//  Copyright (c) 2013 SmartGalApps. All rights reserved.
//

#import "ViewController.h"

#import "PlistLoadOperation.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray* _array;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /* Adding the button */
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Load"
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(loadData)];
    _array = [@[] mutableCopy];
}

- (void)viewDidAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(operationFinished:) name:@"PlistLoadOperationFinished" object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"PlistLoadOperationFinished" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData
{
    PlistLoadOperation* plistLoadOperation = [[PlistLoadOperation alloc] init];
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    [queue addOperation:plistLoadOperation];
}

- (void)operationFinished:(NSNotification *) notification
{
    NSArray* result = [notification.userInfo objectForKey:@"array"];
    for(NSString *str in result) {
        [_array addObject:str];
    }
    
    [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier];
    }
    
    /* Display the text of the array */
    [cell.textLabel setText:[_array objectAtIndex:indexPath.row]];
    
    return cell;
}

@end
