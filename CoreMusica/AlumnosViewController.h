//
//  AlumnosViewController.h
//  CoreMusica
//
//  Created by cursoios on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlumnosViewController : UITableViewController

@property (nonatomic, strong) NSEntityDescription *entityDescription;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
