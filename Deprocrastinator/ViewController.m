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
                      @"Watch TV",
                      @"Drink Beer",
                      @"Drink More Beer",
                      nil];

    self.editing = false;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    cell.textLabel.text = [self.listArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSString *listItem = [self.listArray objectAtIndex:sourceIndexPath.row];
    [self.listArray removeObject:listItem];
    [self.listArray insertObject:listItem atIndex:destinationIndexPath.row];

    [self.tableView reloadData];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController *alertContoller = [UIAlertController alertControllerWithTitle:@"Are you sure you want to delete?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *delete = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.listArray removeObjectAtIndex:indexPath.row];
        
        [self.tableView reloadData];
    }];
    
    [alertContoller addAction:cancel];
    [alertContoller addAction:delete];
    
    [self presentViewController:alertContoller animated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.textLabel.backgroundColor = [UIColor greenColor];
    
 //   [self.tableView reloadData];
}

- (IBAction)onEditTapped:(UIBarButtonItem *)sender {

    if (self.editing) {
        self.editing = false;
        [self.tableView setEditing:false animated:true];
        sender.style = UIBarButtonItemStyleDone;
        sender.title = @"Edit";
    }
    else
    {
        self.editing = true;
        [self.tableView setEditing:true animated:true];
        sender.style = UIBarButtonItemStyleDone;
        sender.title = @"Done";
    }
}

- (IBAction)onAddTapped:(UIButton *)sender {
    
    NSString *addToList = self.textField.text;
    [self.listArray addObject:addToList];
    [self.tableView reloadData];
    
}
- (IBAction)onSwipeRight:(UISwipeGestureRecognizer *)sender {
}

- (IBAction)dismissKeyboard:(UITextField *)sender {
}

@end
