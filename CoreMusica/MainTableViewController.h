//
//  MainTableViewController.h
//  MusicSchool

#import <UIKit/UIKit.h>

@interface MainTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    UITableView *tableViewMain;
}

@property (strong, nonatomic) IBOutlet UITableView *tableViewMain;

@property (nonatomic, strong) NSEntityDescription *entityDescription;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
