/*
    Given an array input[] of length N and an integer x.
    Task is to find the number of subsets with a sum equal to x.
*/

import Foundation

public struct SubsetCount {
    public let input: [Int]
    public let size: Int
    
    public init(_ input: [Int]) {
        self.input = input
        self.size = input.count
    }
    
    public func countEqualSumSubset(_ x: Int) -> Int {
        //Edge case
        if x == 0 { return 1 }

        //Initialization
        var dp = Array(repeating: [Int](repeating: 0, count: x+1), count: size+1)
        for i in 0...size {
            dp[i][0] = 1
        }
        
        //Calculate count via top-down approach
        for i in 1...size {
            for j in 1...x {
                if input[i-1] <= j {
                    dp[i][j] = dp[i-1][j] + dp[i-1][j-input[i-1]]
                } else {
                    dp[i][j] = dp[i-1][j]
                }
            }
        }
        return dp[size][x]
    }
}
