//
//  ViewController.m
//  Delta
//
//  Created by Thomas Denney on 12/02/2015.
//  Copyright (c) 2015 Programming Thomas. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#include <vector>
#include <iostream>
#include "diff.h"

@interface ViewController () {
    std::vector<Model> FirstSet_;
    std::vector<Model> SecondSet_;
}

@property BOOL useSecondSet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FirstSet_.emplace_back("Apple");
    FirstSet_.emplace_back("Google");
    FirstSet_.emplace_back("Microsoft");
    FirstSet_.emplace_back("Yahoo");
    
    SecondSet_.emplace_back("Apple");
    SecondSet_.emplace_back("Microsoft");
    SecondSet_.emplace_back("Sony");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.useSecondSet) {
        return SecondSet_.size();
    }
    return FirstSet_.size();
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Model model = self.useSecondSet ? SecondSet_[indexPath.row] : FirstSet_[indexPath.row];
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithUTF8String:model.Title.c_str()];
    
    return cell;
}

- (IBAction)update:(id)sender {
    auto changes = self.useSecondSet ? Delta<Model>::ChangesBetweenArrays(SecondSet_, FirstSet_) : Delta<Model>::ChangesBetweenArrays(FirstSet_, SecondSet_);
    
    [self.tableView beginUpdates];
    
    for (auto& change : changes) {
        switch (change.Type) {
            case DeltaType::Insert:
                [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:change.Index inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            case DeltaType::Delete:
                [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:change.Index inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            default:
                break;
        }
    }
    
    self.useSecondSet = !self.useSecondSet;
    
    [self.tableView endUpdates];
}

@end
