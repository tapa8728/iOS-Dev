//
//  main.m
//  Part 2 : PeopleDatabase
//
//  Created by junho on 11/12/14.
//
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        char response;
        NSMutableArray *people = [[NSMutableArray alloc] init];
        do
        {
            Person *newPerson = [[Person alloc] init];
            [newPerson enterInfo];
            [people addObject:newPerson];
            
            NSLog(@"Do you want to add another entry(y/n)");
            scanf("\n%c", &response);
            
        } while (response == 'y');
        
        NSLog(@"Printing all the information from database");
        for(Person *p in people)
        {
            [p printInfo];
        }
    }
    return 0;
}
