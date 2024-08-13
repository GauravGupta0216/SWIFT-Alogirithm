// Varition of 0/1 Knapsack

/*
    Given an array input[] of size N and a given difference diff.
    Task is to count the number of partitions that we can perform such that the difference between
    the sum of the two subsets is equal to the given difference.
*/

/*
    Solution: let subsets are S1 & S2 and sum is total sum of array
    S1 + S2 = sum   ----- 1
    S1 - S2 = diff  ----- 2

    Add equation 1 & 2, We have 2*S1 = (sum + diff)
    S1 = (sum + diff)/2
*/

import Foundation

public struct SubsetCountWithGivenDiff {
    public let input: [Int]
    
    public init(_ input: [Int]) {
        self.input = input
    }
    
    public func count(_ diff: Int) -> Int {
        let sum = input.reduce(0, +)
        
        if (diff + sum)%2 != 0 {
            return 0
        }
        
        //result will be the subset count with sum equal to below x
        let x = (diff + sum)/2
        return SubsetCount(input).countEqualSumSubset(x)
    }
}
