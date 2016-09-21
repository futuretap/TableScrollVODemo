//
//  MasterViewController.m
//  TableScrollVODemo
//
//  Created by Ortwin Gentz on 19.09.16.
//  Copyright © 2016 FutureTap. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.navigationItem.leftBarButtonItem = self.editButtonItem;

	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
	self.navigationItem.rightBarButtonItem = addButton;
	self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

	self.objects = [@[@"Lorem", @"ipsum", @"dolor", @"sit", @"amet,", @"consectetur", @"adipiscing", @"elit.", @"Donec", @"ut", @"adipiscing", @"massa.", @"Aliquam", @"vitae", @"nibh", @"ac", @"dui", @"lobortis"] mutableCopy];
	
	self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
//	self.tableView.contentInset = UIEdgeInsetsMake(-self.tableView.bounds.size.height + 64 + 44, 0, 0, 0); // this breaks stickiness of section header view 
	self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(64, 0, 0, 0);
	self.tableView.contentOffset = CGPointMake(0, self.tableView.bounds.size.height - 44 - 64);

	UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height)];
	header.backgroundColor = [UIColor clearColor];
	header.isAccessibilityElement = NO;
	
	self.tableView.tableHeaderView = header;
}


- (void)viewWillAppear:(BOOL)animated {
	self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
	[super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
	if (!self.objects) {
	    self.objects = [[NSMutableArray alloc] init];
	}
	[self.objects insertObject:[NSDate date] atIndex:0];
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
	[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
	    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	    NSDate *object = self.objects[indexPath.row];
	    DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
	    [controller setDetailItem:object];
	    controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
	    controller.navigationItem.leftItemsSupplementBackButton = YES;
	}
}


#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

	NSDate *object = self.objects[indexPath.row];
	cell.textLabel.text = [object description];
	return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	UITableViewHeaderFooterView *sectionHeader = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"sectionHeader"];
	UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Foo", @"Bar"]];
	segmentedControl.frame = CGRectMake(15, 5, tableView.bounds.size.width - 30, 34);
	[sectionHeader addSubview:segmentedControl];
	return sectionHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 44;
}

@end
