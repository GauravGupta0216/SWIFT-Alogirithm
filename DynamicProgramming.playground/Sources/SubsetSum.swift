/*
    Given a set of non-negative integers and a value sum.
    Task is to check if there is a subset of the given set whose sum is equal to the given sum.
*/

import Foundation

public struct SubsetSumRecursive {
    public init() {}

    public func isSubsetSum(arr: [Int], sum: Int, size: Int) -> Bool {
        if sum == 0 {
            return true
        }
        if size == 0 {
            return false
        }
        if arr[size - 1] <= sum {
            return isSubsetSum(arr: arr, sum: sum - arr[size - 1], size: size - 1) || isSubsetSum(arr: arr, sum: sum, size: size - 1)
        } else {
            return isSubsetSum(arr: arr, sum: sum, size: size - 1)
        }
    }
}


public struct SubsetSumTopDown {
    public var input: [Int]
    public var sum: Int
    public var size: Int

    public init(input: [Int], sum: Int) {
        self.input = input
        self.sum = sum
        self.size = input.count
    }

    public func isSubsetSum() -> Bool {
        if sum == 0 { return true }
        
        //inititalization
        var dp: [[Bool]] = Array(repeating: [Bool](repeating: false, count: sum+1), count: input.count+1)
        for i in 0...size {
            dp[i][0] = true
        }
        
        //Calculate via top-down
        for i in 1...size {
            for j in 1...sum {
                if input[i - 1] <= j {
                    dp[i][j] = dp[i-1][j-input[i-1]] || dp[i-1][j]
                } else {
                    dp[i][j] = dp[i-1][j]
                }
            }
        }
        return dp[size][sum]
    }
}
