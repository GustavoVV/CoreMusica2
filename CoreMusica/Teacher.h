//
//  Teacher.h
//  CoreMusica
//
//  Created by cursoios on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Instrument;

@interface Teacher : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSNumber * years;
@property (nonatomic, retain) NSString * language;
@property (nonatomic, retain) NSSet *students;
@property (nonatomic, retain) NSSet *instruments;
@end

@interface Teacher (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(NSManagedObject *)value;
- (void)removeStudentsObject:(NSManagedObject *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

- (void)addInstrumentsObject:(Instrument *)value;
- (void)removeInstrumentsObject:(Instrument *)value;
- (void)addInstruments:(NSSet *)values;
- (void)removeInstruments:(NSSet *)values;

@end
