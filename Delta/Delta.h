//
//  Delta.h
//  Delta
//
//  Created by Thomas Denney on 12/02/2015.
//  Copyright (c) 2015 Programming Thomas. All rights reserved.
//

#ifndef __Delta__diff__
#define __Delta__diff__

#include <vector>

/**
 * Note: I am compiling with C++ flags -stdlib=c++ and -std=c++1y
 *
 * This is to allow me to use the new C++ optional. It missed the 
 * C++14 standard so won't come round properly until 2017 at the 
 * earliest. I will probably implement it myself soon.
 */
#include <experimental/optional>

template<typename T>
using optional = std::experimental::optional<T>;

enum class DeltaType {
    Insert,
    Delete
};

template <typename T>
class Delta {
public:
    const DeltaType Type;
    const optional<T> Value;
    const size_t Index;
    
    Delta(size_t index):
        Type(DeltaType::Delete),
        Value({}),
        Index(index) {}
    
    Delta(size_t index, T value):
        Type(DeltaType::Insert),
        Value(value),
        Index(index) {}
    
    void Execute(std::vector<T>& array) {
        switch (Type) {
            case DeltaType::Insert:
                if (auto v = Value) {
                    array.insert(array.begin() + Index, v);
                }
                break;
            case DeltaType::Delete:
                array.erase(array.begin() + Index);
                break;
            default:
                break;
        }
    }
    
    static std::vector<Delta<T>> ChangesBetweenArrays(const std::vector<T>& left, const std::vector<T>& right) {
        std::vector<Delta<T>> changes;
        auto i = 0, j = 0;
        auto relativeIndex = 0;
        while (i < left.size() || j < right.size()) {
            if (i == left.size()) {
                changes.emplace_back(relativeIndex, right[j]);
                j++;
                relativeIndex++;
            }
            else if (j == right.size()) {
                changes.emplace_back(i);
                i++;
            }
            else {
                if (left[i] == right[j]) {
                    i++;
                    j++;
                    relativeIndex++;
                }
                else if (left[i] < right[j]) {
                    
                    changes.emplace_back(i);
                    i++;
                }
                else {
                    changes.emplace_back(relativeIndex, right[j]);
                    relativeIndex++;
                    j++;
                }
            }
        }
        return changes;
    }
};

#endif /* defined(__Delta__diff__) */
