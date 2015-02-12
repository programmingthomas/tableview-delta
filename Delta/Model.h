//
//  Model.h
//  Delta
//
//  Created by Thomas Denney on 12/02/2015.
//  Copyright (c) 2015 Programming Thomas. All rights reserved.
//

#ifndef __Delta__Model__
#define __Delta__Model__

#include <string>

class Model {
public:
    const std::string Title;
    
    Model(const std::string& title): Title(title) {}
    
    friend bool operator== (const Model& left, const Model& right) {
        return left.Title == right.Title;
    }
    
    friend bool operator< (const Model& left, const Model& right) {
        return left.Title < right.Title;
    }
};

#endif /* defined(__Delta__Model__) */
