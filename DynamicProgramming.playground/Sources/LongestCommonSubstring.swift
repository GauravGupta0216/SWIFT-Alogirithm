import Foundation

public struct LongestCommonSubstring {
    public let s1: String
    public let s2: String
    
    public init(_ s1: String, _ s2: String) {
        self.s1 = s1
        self.s2 = s2
    }
    
    /// Calculate Longest Common Subsequence via TopDown Approach
    public func calculate() -> Int {
        let m = s1.count
        let n = s2.count
        let arrS1 = Array(s1)
        let arrS2 = Array(s2)
        var dp = Array(repeating: [Int](repeating: 0, count: n+1), count: m+1)
        var result = 0
        
        for i in 1...m {
            for j in 1...n {
                if arrS1[i-1] == arrS2[j-1] {
                    dp[i][j] = 1 + dp[i-1][j-1]
                    result = max(result, dp[i][j])
                } else {
                    dp[i][j] = 0
                }
            }
        }
        
        return result
    }
}
