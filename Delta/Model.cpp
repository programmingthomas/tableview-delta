//
//  Model.cpp
//  Delta
//
//  Created by Thomas Denney on 12/02/2015.
//  Copyright (c) 2015 Programming Thomas. All rights reserved.
//

#include "Model.h"

bool operator== (Model& left, Model& right) {
    return left.Title == right.Title;
}

bool operator< (Model& left, Model& right) {
    return left.Title < right.Title;
}