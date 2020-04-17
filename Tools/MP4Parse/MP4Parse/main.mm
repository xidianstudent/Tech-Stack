//
//  main.m
//  MP4Parse
//
//  Created by PandaABC on 2020/2/20.
//  Copyright © 2020 lbzhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "MP4.Parser.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        MP4::Parser *parser;
        
        if( argc != 2 )
        {
            std::cout << "Usage: " << argv[ 0 ] << " FILENAME\n";
        }
        
        parser = new MP4::Parser((char* )argv[1]);
        
        delete parser;
    }
    return 0;
}
