//*************************************
//  main.m
//  FirstApp
//
//  Created by junho on 11/12/14.
//  *************************************

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
            int answer=0;
            int guess=0;
            int turn=0;
            //random number gnerator
            answer = arc4random()%100 + 1;
            NSLog(@"The random number(answer) is: %i", answer);
    
        while (turn<10)
        {
            //taking the user input
            NSLog(@"** TURN #%i", (turn+1));
            NSLog(@"Enter a number between 0 and 100");
            scanf("%i", &guess);
            
            //game logic
            if(guess > answer)
            {
                NSLog(@"Your guess was too HIGH !!");
            }
            else if(guess< answer)
            {
                NSLog(@"Your guess was too LOW !!");
            }
            else
            {
                NSLog(@"The guess is CORRECT at %i !!", guess);
                break;
            }
            turn++;
        }
        NSLog(@"It took %i guesses!!", turn);
    }
    return 0;
}
