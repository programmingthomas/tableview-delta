#ifndef __Delta__diff__
#define __Delta__diff__

#include <vector>
#import <UIKit/UIKit.h>

enum class DeltaType {
    Insert,
    Delete
};

/**
 Represents a change that can be executed on a UITableView. This class is
 designed to work exclusively with UITableView, rather than the difference
 between any two particular arrays. This is because of the specific 
 implementation of UITableView.
 
 This class expects that you have an existing array of model objects that you
 are displaying. Some update occurs and you get a new array of model objects:
 
 * Get a list of changes with Delta<ModelClass>::ChangesBetweenArrays(old, new)
 * [self.tableView beginUpdates]
 * Call delta.Execute(self.tableView) on each change
 * Replace your old model array with the new one
 * [self.tableView endUpdates]
 */
template <typename T>
class Delta {
public:
    const DeltaType Type;
    
    /**
     For deletion changes this will be the original index of the item. For
     insertion changes this will be
     the new index of the item.
     */
    const size_t Index;
    
    Delta(size_t index, DeltaType deltaType):
        Type(deltaType),
        Index(index) {}
    
    /**
     Computes an array of changes between two arrays that can be executed on a
     table view.
     
     @param oldArray The original dataset
     @param newArray The new dataset
     
     @return An array of changes to execute
     */
    static std::vector<Delta<T>> ChangesBetweenArrays(const std::vector<T>& oldArray, const std::vector<T>& newArray) {
        std::vector<Delta<T>> changes;
        
        auto oldIterator = oldArray.begin();
        auto newIterator = newArray.begin();
        
        //Need to keep track of these separately as UITableView expects delete indicies to refer
        //to the original indicies and insert indicies to refer to the new ones.
        auto deleteIndex = 0;
        auto insertIndex = 0;
        
        while (oldIterator != oldArray.end() || newIterator != newArray.end()) {
            if (oldIterator == oldArray.end()) {
                changes.emplace_back(insertIndex, DeltaType::Insert);
                ++newIterator;
                insertIndex++;
            }
            else if (newIterator == newArray.end()) {
                changes.emplace_back(deleteIndex, DeltaType::Delete);
                deleteIndex++;
                ++oldIterator;
            }
            else {
                if (*oldIterator == *newIterator) {
                    insertIndex++;
                    deleteIndex++;
                    ++oldIterator;
                    ++newIterator;
                }
                else if (*oldIterator < *newIterator) {
                    changes.emplace_back(deleteIndex, DeltaType::Delete);
                    deleteIndex++;
                    oldIterator++;
                }
                else {
                    changes.emplace_back(insertIndex, DeltaType::Insert);
                    insertIndex++;
                    ++newIterator;
                }
            }
        }
        return changes;
    }
    
    /**
     @param tableView The table view to execute the change on
     @note Executes in section 0. You should implement this method yourself if
     you plan on using another section.
     */
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
