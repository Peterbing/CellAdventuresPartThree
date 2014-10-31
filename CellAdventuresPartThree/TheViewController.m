//
//  ViewController.m
//  CellAdventuresPartThree
//
//  Created by Peter on 10/30/14.
//  Copyright (c) 2014 Peter. All rights reserved.
//

#import "TheViewController.h"
#import "FancyTableViewCell.h"
#import "InterestingTableViewCell.h"

@interface TheViewController ()

typedef NS_ENUM(NSInteger, TableSection) {
	TableSectionPlainCells,
	TableSectionFancyCells,
	TableSectionInterestingCells
};

@property (nonatomic, copy) NSArray *array;

@property (nonatomic, copy) NSArray *otherArray;

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation TheViewController

#pragma mark -
#pragma mark view controller

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.array = @[@"foo", @"bar", @"baz", @"qux"];
	self.otherArray = @[@"this is an exceptionally", @"delicious, healthy, spooky, fantastic, surprising", @"hot and delicious and surprising and surprising and hot and delicious and just all-around excellent", @"hot dog", @"sandwich, sandwich… sandwich sandwich. Sandwich sandwich sandwich! Sandwich, sandwich sandwich: sandwich. Sandwich, sandwich, sandwich sandwich sandwich “sandwich” ‘sandwich,’ sandwich!!!"];
	self.title = @"Test";

	[self.tableView registerNib:[UINib nibWithNibName:@"FancyTableViewCell" bundle:nil] forCellReuseIdentifier:@"Fancy"];
	[self.tableView registerNib:[UINib nibWithNibName:@"InterestingTableViewCell" bundle:nil] forCellReuseIdentifier:@"Interesting"];
	self.tableView.rowHeight = UITableViewAutomaticDimension;
	self.tableView.estimatedRowHeight = 44.0;
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contentSizeCategoryChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)contentSizeCategoryChanged:(NSNotification *)notification
{
	[self.tableView reloadData];
}

#pragma mark -
#pragma mark table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch (indexPath.section) {
		case TableSectionPlainCells: {
			UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:nil];
			cell.textLabel.text = self.array[indexPath.row];
			cell.detailTextLabel.text = [NSString stringWithFormat:@"row %@", @(indexPath.row)];
			return cell;
		}
		case TableSectionFancyCells: {
			FancyTableViewCell *fancy = (FancyTableViewCell *) [self.tableView dequeueReusableCellWithIdentifier:@"Fancy"];
			fancy.theLabel.text = self.otherArray[indexPath.row];
			fancy.theLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
			[fancy setNeedsUpdateConstraints];
			[fancy updateConstraintsIfNeeded];
			return fancy;
		}
		case TableSectionInterestingCells: {
			InterestingTableViewCell *interesting = (InterestingTableViewCell *) [self.tableView dequeueReusableCellWithIdentifier:@"Interesting"];
			interesting.topLabel.text = @"top";
			interesting.bigLabel.text = @"big big big big big big big big big big big big big big big big big big big big big big big big big big big big big big big big big.";
			interesting.bottomLabel.text = @"bottom";
			[interesting setNeedsUpdateConstraints];
			[interesting updateConstraintsIfNeeded];
			return interesting;
		}
		default: {
			NSAssert(NO, @(__PRETTY_FUNCTION__));
			return nil;
		}
	}
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	switch (section) {
		case TableSectionPlainCells: {
			return self.array.count;
		}
		case TableSectionFancyCells: {
			return self.otherArray.count;
		}
		case TableSectionInterestingCells: {
			return 1;
		}
		default: {
			return 0;
		}
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [NSString stringWithFormat:@"header for section %@", @(section)];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
	return [NSString stringWithFormat:@"footer for section %@", @(section)];
}

#pragma mark -
#pragma mark table view delegate



#pragma mark -

@end
