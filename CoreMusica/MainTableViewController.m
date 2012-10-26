//
//  MainTableViewController.m
//  MusicSchool

#import "MainTableViewController.h"
#import "Instrument.h"
#import "Student.h"
#import "Teacher.h"

@implementation MainTableViewController
@synthesize tableViewMain, entityDescription, fetchedResultsController, managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)fetchResults
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:self.entityDescription.name];
    NSString *cacheName = [self.entityDescription.name stringByAppendingString:@"Cache"];
    
    NSLog(@"Mother Fuc**r");
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:cacheName];
    
    BOOL success;
    NSError *error;
    success = [self.fetchedResultsController performFetch:&error];
    if (!success)
    {
        NSLog(@"%@", [error localizedDescription]);
    }
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSManagedObject *deleted = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.managedObjectContext deleteObject:deleted];
        self.managedObjectContext 
        NSError *error;
        BOOL success = [self.managedObjectContext save:&error];
        if (!success)
        {
            NSLog(@"%@", [error localizedDescription]);
        }
        [self fetchResults];
        [self.tableViewMain deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
}
-(void)add
{
    NSManagedObject *add = [[NSManagedObject alloc] initWithEntity:self.entityDescription insertIntoManagedObjectContext:self.managedObjectContext];
    if ([self.entityDescription.name isEqualToString:@"Teacher"])
    {
        Teacher *teacher = (Teacher *)add;
        teacher.name = @"Peter";
        teacher.age = [NSNumber numberWithInt:36];
    }
    else if ([self.entityDescription.name isEqualToString:@"Instrument"])
    {
        Instrument *instrument = (Instrument *)add;
        instrument.name = @"Guitar";
        instrument.family = @"Strings";
    }
    else
    {
        Student *student = (Student *)add;
        student.name = @"Andrew";
        student.age = [NSNumber numberWithInt:18];
    }
    
    NSError *error;
    BOOL success = [self.managedObjectContext save:&error];
    if (!success)
    {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    [self fetchResults];
    
    [self.tableViewMain reloadData];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.textLabel.font = [UIFont systemFontOfSize:19.0];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    }
    
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    if ([object.entity.name isEqualToString:@"Instrument"])
    {
        Instrument *instrument = (Instrument *)object;
        cell.textLabel.text = instrument.name;
        cell.detailTextLabel.text = instrument.family;
    }
    else if ([object.entity.name isEqualToString:@"Student"])
    {
        Student *student = (Student *)object;
        cell.textLabel.text = student.name;
        cell.detailTextLabel.text = [student.age stringValue];
    }
    else
    {
        Teacher *teacher = (Teacher *)object;
        cell.textLabel.text = teacher.name;
        cell.detailTextLabel.text = [teacher.age stringValue];
    }
    
	return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.fetchedResultsController fetchedObjects] count]; 
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableViewMain.delegate = self;
    self.tableViewMain.dataSource = self;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    UIBarButtonItem *editButton = self.editButtonItem;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:addButton, editButton, nil];
    
    [self fetchResults];
}
-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.tableViewMain setEditing:editing animated:animated];
}
- (void)viewDidUnload
{
    [self setManagedObjectContext:nil];
    [self setFetchedResultsController:nil];
    [self setEntityDescription:nil];
    [self setTableViewMain:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
