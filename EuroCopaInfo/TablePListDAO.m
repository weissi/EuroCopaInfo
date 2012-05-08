//
//  StadiumsDAO.m
//  EuroCopaInfo
//
//  Created by Johannes Weiß on 5/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TablePListDAO.h"

@interface TablePListDAO ()

@property (nonatomic, readwrite, retain) NSString *plistFile;
@property (nonatomic, readwrite, retain) NSArray *children;

@end

@implementation TablePListDAO

- (id)initWithLibraryName:(NSString *)name
{
    if (self = [super init]) {
        self.plistFile = name;
        self.children = [[NSArray alloc] initWithContentsOfFile:
                         [[NSBundle mainBundle] pathForResource:self.plistFile
                                                         ofType:@"plist"]];
        NSLog(@"path: %@", [[NSBundle mainBundle] pathForResource:self.plistFile ofType:@"plist"]);
        NSAssert(self.children != nil, @"children are nil!?!");
    }
    return self;    
}

- (NSDictionary *)sectionItem:(NSInteger)section
{
    return [self.children objectAtIndex:section];
}

- (NSArray *)childrenOfSection:(NSInteger)section
{
    return [[self sectionItem:section] valueForKey:@"children"];
}

- (NSDictionary *)childItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self childrenOfSection:indexPath.section] objectAtIndex:indexPath.row];
}

- (NSInteger)childrenCountAtSection:(NSInteger)section
{
    return [[self childrenOfSection:section] count];
}

- (NSInteger)sectionCount
{
    return [self.children count];
}

- (NSString *)sectionName:(NSInteger)section
{
    return [[self sectionItem:section] valueForKey:@"name"];
}

@synthesize plistFile;
@synthesize children;

@end
