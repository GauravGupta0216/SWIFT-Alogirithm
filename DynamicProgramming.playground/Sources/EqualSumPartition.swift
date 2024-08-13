// Varition of 0/1 Knapsack

/*
    The partition problem is to determine whether a given set can be partitioned into two subsets
    such that the sum of elements in both subsets is the same.
*/

/*
    Solution: Get the array sum and divide it by 2. And, then check if subset sum exist for that number. Pretty simple!!
*/

import Foundation

public struct EqualSumPartition {
    public let input: [Int]
    public let size: Int
    public var sum: Int

    public init(input: [Int]) {
        self.input = input
        self.size = input.count
        self.sum = input.reduce(0, +)
    }
    
    public func isEqualSumPartitionPossible() -> Bool {
        //Array contains only 0's
        if sum == 0 {
            if size > 1 {
                return true
            } else {
                return false
            }
        }
        if sum%2 != 0 {
            return false
        }

        //inititalization
        let value = sum/2
        var dp: [[Bool]] = Array(repeating: [Bool](repeating: false, count: value+1), count:size+1)
        dp[0][0] = true
        
        //Calculate top-down matrix
        for i in 1...size {
            for j in 0...value {
                if input[i-1] <= j {
                    dp[i][j] = dp[i-1][j] || dp[i-1][j-input[i-1]]
                } else {
                    dp[i][j] = dp[i-1][j]
                }
            }
        }
        return dp[size][value]
    }
}
