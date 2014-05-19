//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Thomas M. Mroz on 5/19/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *myTasks;
@property (weak, nonatomic) IBOutlet UITextField *aNewTask;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myTasks =[NSMutableArray arrayWithObjects:
                  @"Cut the Grass", @"Make Dinner", @"Do Some Laundry", @"Pick up some Beer", nil];
    //self.aNewTask.text = @"Enter A New Task";


}
- (IBAction)onEditButtonPressed:(UIButton *)sender {

    if([sender.currentTitle isEqualToString: @"Edit"])
    {
        [sender setTitle:@"Done" forState: UIControlStateNormal];
    }
    else if([sender.currentTitle isEqualToString: @"Done"])
    {
        [sender setTitle:@"Edit" forState: UIControlStateNormal];
    }

        //[self.myTableView setEditing: YES animated: YES];


}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    [self.myTasks removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}


- (IBAction)onAddButtonPressed:(id)sender
{

    [self.myTasks addObject: self.aNewTask.text];
    self.aNewTask.text = @"";
    [self.aNewTask resignFirstResponder];
    [self.myTableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor greenColor];

    if([self.editButton.currentTitle isEqualToString: @"Done"])
    {
        [self.myTasks removeObject: cell.textLabel.text];
        [self.myTableView reloadData];
    }


}


#pragma mark -
#pragma mark UITableVIewDataSource

-(NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myTasks.count;
}

- (UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCellId"];
    cell.textLabel.text = self.myTasks[indexPath.row];

    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
