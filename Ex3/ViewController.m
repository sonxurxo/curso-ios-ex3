//
//  ViewController.m
//  Ex3
//
//  Created by Xurxo Méndez Pérez on 25/12/13.
//  Copyright (c) 2013 SmartGalApps. All rights reserved.
//

#import "ViewController.h"

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) loadData {
    
    /* Grab web data */
    NSURL *dataURL = [NSURL URLWithString:@"http://icodeblog.com/samples/nsoperation/data.plist"];
    
    NSArray *tmp_array = [NSArray arrayWithContentsOfURL:dataURL];
    
    /* Populate our array with the web data */
    for(NSString *str in tmp_array) {
        [_array addObject:str];
    }
    
    /* reload the table */
    [self.tableView reloadData];
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
