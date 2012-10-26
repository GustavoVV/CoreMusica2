//
//  Student.h
//  CoreMusica
//
//  Created by cursoios on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Instrument, Teacher;

@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * language;
@property (nonatomic, retain) NSString * skill;
@property (nonatomic, retain) Teacher *teacher;
@property (nonatomic, retain) Instrument *intrument;

@end
