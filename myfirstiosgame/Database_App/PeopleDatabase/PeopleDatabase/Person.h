//
//  Person.h
//  PeopleDatabase
//
//  Created by junho on 11/12/14.
//
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    //instance variables
    NSString *firstname;
    NSString *lastname;
    int age;
}
//instance methods
-(void)enterInfo;
-(void)printInfo;
@end //marks the end of the class
