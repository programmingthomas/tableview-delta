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
#import <UIKit/UIKit.h>

enum class DeltaType {
    Insert,
    Delete
};

/**
 Represents a change that can be executed on a UITableView. This class is designed to work exclusively with
 UITableView, rather than the difference between any two particular arrays. This is because of the specific 
 implementation of UITableView.
 */
template <typename T>
class Delta {
public:
    const DeltaType Type;
    const size_t Index;
    
    Delta(size_t index, DeltaType deltaType):
        Type(deltaType),
        Index(index) {}
    
    static std::vector<Delta<T>> ChangesBetweenArrays(const std::vector<T>& left, const std::vector<T>& right) {
        std::vector<Delta<T>> changes;
        auto i = 0, j = 0;
        auto relativeIndex = 0;
        while (i < left.size() || j < right.size()) {
            if (i == left.size()) {
                changes.emplace_back(relativeIndex, DeltaType::Insert);
                j++;
                relativeIndex++;
            }
            else if (j == right.size()) {
                changes.emplace_back(i, DeltaType::Delete);
                i++;
            }
            else {
                if (left[i] == right[j]) {
                    i++;
                    j++;
                    relativeIndex++;
                }
                else if (left[i] < right[j]) {
                    
                    changes.emplace_back(i, DeltaType::Delete);
                    i++;
                }
                else {
                    changes.emplace_back(relativeIndex, DeltaType::Insert);
                    relativeIndex++;
                    j++;
                }
            }
        }
        return changes;
    }
    
    void Execute(UITableView * tableView) {
        auto indexPaths = @[[NSIndexPath indexPathForRow:Index inSection:0]];
        switch (Type) {
            case DeltaType::Insert:
                [tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            case DeltaType::Delete:
                [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            default:
                break;
        }
    }
};

#endif /* defined(__Delta__diff__) */
