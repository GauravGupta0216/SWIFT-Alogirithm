import Foundation

//Return the index if the value found
//Else, return nil

public func binarySearch(_ array: [Int], value: Int) -> Int? {
    var startIdx = 0
    var endIdx = array.count - 1
    
    while startIdx <= endIdx {
        let midIdx = (startIdx + endIdx)/2
        if array[midIdx] == value {
            return midIdx
        } else if array[midIdx] < value {
            startIdx = midIdx + 1
        } else {
            endIdx = midIdx - 1
        }
    }
    return nil
}
