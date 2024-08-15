/*
    Given two strings "s1" and "s2".
    Task is to find the length of the shortest string that has both str1 and str2 as subsequences.
*/

import Foundation

public struct ShortestCommonSuperSequence {
    public let s1: String
    public let s2: String
    
    public init(_ s1: String, _ s2: String) {
        self.s1 = s1
        self.s2 = s2
    }
    
    public func getLength() -> Int {
        return s1.count + s2.count - LongestCommonSubsequence(s1, s2).getLCSViaTopDown()
    }
    
    public func printSCS() -> String {
        //Initialization
        let m = s1.count
        let n = s2.count
        let arrS1 = Array(s1)
        let arrS2 = Array(s2)
        var dp = Array(repeating: [Int](repeating: 0, count: n+1), count: m+1)
        
        // DP Matrix
        for i in 1...m {
            for j in 1...n {
                if arrS1[i-1] == arrS2[j-1] {
                    dp[i][j] = 1 + dp[i-1][j-1]
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        
        // Print SCS by traversing through dp matrix
        var i = m
        var j = n
        var result: String = ""
        
        while i>0 && j>0 {
            if arrS1[i-1] == arrS2[j-1] {
                result.append(arrS1[i-1])
                i -= 1
                j -= 1
            } else if dp[i-1][j] > dp[i][j-1] {
                result.append(arrS1[i-1])
                i -= 1
            } else {
                result.append(arrS2[j-1])
                j -= 1
            }
        }
        
        while i > 0 {
            result.append(arrS1[i-1])
            i -= 1
        }
        while j > 0 {
            result.append(arrS1[j-1])
            j -= 1
        }

        return String(result.reversed())
    }
}
