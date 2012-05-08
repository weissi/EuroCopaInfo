//
//  StadiumsDAO.h
//  EuroCopaInfo
//
//  Created by Johannes Weiß on 5/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TablePListDAO : NSObject {
    NSString *plistFile;
    NSArray *children;
}

@property (nonatomic, readonly, retain) NSString *plistFile;
@property (nonatomic, readonly, retain) NSArray *children;

- (id)initWithLibraryName:(NSString *)name;
- (NSDictionary *)childItemAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)childrenCountAtSection:(NSInteger)section;
- (NSInteger)sectionCount;
- (NSString *)sectionName:(NSInteger)section;

@end
