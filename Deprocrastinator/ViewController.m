//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Ceasar Barbosa on 1/18/16.
//  Copyright © 2016 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *listArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listArray = [NSMutableArray arrayWithObjects:
                      @"Wash Car",
                      @"Drink Beer",
                      @"Dring More Beer",
                      nil];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    cell.textLabel.text = [self.listArray objectAtIndex:indexPath.row];
    
    return cell;
}



- (IBAction)onEditTapped:(UIBarButtonItem *)sender {
}


- (IBAction)onAddTapped:(UIButton *)sender {
}

@end
