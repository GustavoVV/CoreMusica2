//
//  Instrument.h
//  CoreMusica
//
//  Created by cursoios on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Instrument : NSManagedObject

@property (nonatomic, retain) NSString * family;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *students;
@property (nonatomic, retain) NSSet *teacher;
@end

@interface Instrument (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(NSManagedObject *)value;
- (void)removeStudentsObject:(NSManagedObject *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

- (void)addTeacherObject:(NSManagedObject *)value;
- (void)removeTeacherObject:(NSManagedObject *)value;
- (void)addTeacher:(NSSet *)values;
- (void)removeTeacher:(NSSet *)values;

@end
