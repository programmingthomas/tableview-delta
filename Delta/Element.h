//
//  Element.h
//  Delta
//
//  Created by Thomas Denney on 12/02/2015.
//  Copyright (c) 2015 Programming Thomas. All rights reserved.
//

#ifndef __Delta__Element__
#define __Delta__Element__

#include <string>

class Element {
public:
    const std::string Name;
    const std::string Symbol;
    const int Number;
    const double Weight;
    
    Element(std::string name, std::string symbol, int number, double weight):
        Name(name),
        Symbol(symbol),
        Number(number),
        Weight(weight) {}
    
    friend bool operator== (const Element& left, const Element& right) {
        return left.Number == right.Number;
    };
    
    friend bool operator< (const Element& left, const Element& right) {
        return left.Number < right.Number;
    }
};

#endif /* defined(__Delta__Element__) */
