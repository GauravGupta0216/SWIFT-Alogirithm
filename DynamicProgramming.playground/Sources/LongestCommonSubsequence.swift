import Foundation

public struct LongestCommonSubsequence {
    public let s1: String
    public let s2: String
    
    public init(_ s1: String, _ s2: String) {
        self.s1 = s1
        self.s2 = s2
    }
    
    /// Calculate Longest Common Subsequence via Recursion
    public func getLCSViaRecursion() -> Int {
        return self.lcsRecursion(Array(s1), Array(s2), s1.count, s2.count)
    }

    func lcsRecursion(_ s1: [Character], _ s2: [Character], _ m: Int, _ n: Int) -> Int {
        //Base condition
        if m == 0 || n == 0 {
            return 0
        }

        if s1[m-1] == s2[n-1] {
            return 1 + lcsRecursion(s1, s2, m-1, n-1)
        } else {
            return max(lcsRecursion(s1, s2, m-1, n), lcsRecursion(s1, s2, m, n-1))
        }
    }

    /// Calculate Longest Common Subsequence via Memoization
    public func getLCSViaMemoization() -> Int {
        var dp: [[Int]] = Array(repeating: [Int](repeating: -1, count: s2.count+1), count: s1.count+1)
        return lcsMemoization(&dp, Array(s1), Array(s2), s1.count, s2.count)
    }

    func lcsMemoization(_ dp: inout [[Int]], _ s1: [Character], _ s2: [Character], _ m: Int, _ n: Int) -> Int {
        //Base condition
        if m == 0 || n == 0 {
            return 0
        }
        
        if dp[m][n] != -1 {
            return dp[m][n]
        }

        if s1[m-1] == s2[n-1] {
            dp[m][n] =  1 + lcsRecursion(s1, s2, m-1, n-1)
        } else {
            dp[m][n] = max(lcsRecursion(s1, s2, m-1, n), lcsRecursion(s1, s2, m, n-1))
        }

        return dp[m][n]
    }
    
    /// Calculate Longest Common Subsequence via TopDown Approach
    public func getLCSViaTopDown() -> Int {
        let m = s1.count
        let n = s2.count
        let arrS1 = Array(s1)
        let arrS2 = Array(s2)
        var dp = Array(repeating: [Int](repeating: 0, count: n+1), count: m+1)

        for i in 1...m {
            for j in 1...n {
                if arrS1[i-1] == arrS2[j-1] {
                    dp[i][j] = 1 + dp[i-1][j-1]
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        
        return dp[m][n]
    }
}
