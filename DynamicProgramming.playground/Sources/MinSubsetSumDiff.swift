/*
    Given a set of integers, the task is to divide it into two sets S1 and S2 such that the absolute difference between their sums is minimum.
*/

import Foundation

public struct MinSubsetSumDiff {
    public var input: [Int]

    public init(input: [Int]) {
        self.input = input
    }
    
    public func findMinimumSubsetSumDifference() -> Int {
        let size = input.count
        let total = input.reduce(0, +)
        let rangeOfS1 = total/2
        var minimumValue = Int.max
        
        //Initialization of DP matrix
        var dp = Array(repeating: [Bool](repeating: false, count: rangeOfS1 + 1), count: size+1)
        dp[0][0] = true
        
        //Calculate dp matrix value
        for i in 1...size {
            for j in 0...rangeOfS1 {
                if input[i-1] <= j {
                    dp[i][j] = dp[i-1][j] || dp[i-1][j-input[i-1]]
                } else {
                    dp[i][j] = dp[i-1][j]
                }
            }
        }
        
        //Calculate the minimum value
        for i in (0...rangeOfS1).reversed() {
            if dp[size][i] {
                minimumValue = total - 2 * i
                break
            }
        }
        
        return minimumValue
    }
}
