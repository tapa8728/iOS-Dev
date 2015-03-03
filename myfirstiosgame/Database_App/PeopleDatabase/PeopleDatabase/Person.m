//
//  Person.m
//  PeopleDatabase
//
//  Created by junho on 11/12/14.
//
//

#import "Person.h"

@implementation Person

-(void)enterInfo
{
    char cstring[40];
    NSLog(@"Enter the first name: ");
    scanf("%s", cstring);
    firstname = [NSString stringWithCString:cstring encoding:1];
    NSLog(@"What is %@'s lastname ?", firstname);
    scanf("%s", cstring);
    lastname = [NSString stringWithCString:cstring encoding:1];
    NSLog(@"How old is '%@ %@' ?", firstname, lastname);
    scanf("%i", &age);
}


-(void)printInfo
{
    
    NSLog(@"FIRST NAME: %@ LAST NAME: %@ AGE: %i", firstname, lastname, age);    
}
@end
