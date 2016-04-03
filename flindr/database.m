//
//  database.m
//  flindr
//
//  Created by Ryan Paglinawan on 4/3/16.
//  Copyright © 2016 RyanPaglinawan. All rights reserved.
//

#import "database.h"

@implementation database
NSString *databasePath;
static sqlite3 *db; // database
static sqlite3_stmt *statement = nil;
//static sqlite3_stmt *enableForeignKey;
-(BOOL)createDB
{
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString:
                    [docsDir stringByAppendingPathComponent: @"movie.db"]];
    BOOL isSuccess = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &db) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt =
            "create table if not exists movieDetail (movie text, director text, language text, overview text, tagline text, genre text, imgURL text)";
            if (sqlite3_exec(db, sql_stmt, NULL, NULL, &errMsg)
                != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table");
            }
            sqlite3_close(db);
            return  isSuccess;
        }
        else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
        }
    }
    return isSuccess;
}
- (BOOL) setData:(NSString *)movie name:(NSString *)director name:(NSString *)language name:(NSString *)overview name:(NSString*)tagline name:(NSString *)genre name:(NSURL *)imgURL
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &db) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into movieDetail (movie,director,language,overview,tagline,genre,imgURL,text) values (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")", movie, director, language, overview, tagline, genre, imgURL];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(db, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            return YES;
        }
        else
        {
            return NO;
        }
        //sqlite3_reset(statement); (This lihne will never be called)
    }
    return NO;
}



@end
