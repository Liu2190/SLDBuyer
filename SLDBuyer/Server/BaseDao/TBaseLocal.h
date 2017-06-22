//
//  TBaseLocal.h
//  SQLiteSample
//
//  Created by wang xuefeng on 10-12-29.
//  Copyright 2010 www.5yi.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DRecord.h"
#import "RequestDelegate.h"

@class TDatabase;

@interface TBaseLocal : NSObject {
	TDatabase *db;
}


@property (nonatomic, retain) TDatabase *db;

-(NSMutableDictionary*)resultSet;
-(BOOL)insertWithObject:(DRecord*)record;
-(BOOL)updateAtIndex:(NSInteger)index record:(DRecord*)record;
-(BOOL)deleteAtIndex:(NSInteger)index;
- (BOOL)deleteAllRecord;
-(DRecord*)selectRecordById:(NSInteger)idx;
- (NSArray*)selectAllRecord;

-(NSString *)SQL:(NSString *)sql inTable:(NSString *)table;

@end