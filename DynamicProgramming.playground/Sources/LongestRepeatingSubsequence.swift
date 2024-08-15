/*
    Given a string, print the longest repeating subsequence such that the two subsequence 
    don’t have same string character at same position, i.e., any i’th character in the two
    subsequences shouldn’t have the same index in the original string.
 
    Example:
    Input: str = "aab"
    Output: "a"
*/

import Foundation

public struct LongestRepeatingSubsequence {
    public let s: String
    
    public init(_ s: String) {
        self.s = s
    }
    
    /// Calculate Longest Common Subsequence via TopDown Approach
    public func getLRS() -> Int {
        let n = s.count
        let arrS1 = Array(s)
        let arrS2 = Array(s)
        var dp = Array(repeating: [Int](repeating: 0, count: n+1), count: n+1)

        for i in 1...n {
            for j in 1...n {
                if arrS1[i-1] == arrS2[j-1] && i != j {
                    dp[i][j] = 1 + dp[i-1][j-1]
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }

        return dp[n][n]
    }
}
