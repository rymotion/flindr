//
//  database.h
//  flindr
//
//  Created by Ryan Paglinawan on 4/3/16.
//  Copyright © 2016 RyanPaglinawan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface database : NSObject
-(BOOL)createDB;
- (void) setData:(NSString *)movie name:(NSString *)overview name:(NSString*)tagline name:(NSURL *)imgURL;
@end
