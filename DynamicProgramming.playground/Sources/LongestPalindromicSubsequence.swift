/*
    Given a string "s", find the length of the Longest Palindromic Subsequence in it.
*/

import Foundation

public struct LongestPalindromicSubsequence {
    public let s: String
    
    public init(_ s: String) {
        self.s = s
    }
    
    public func getLength() -> Int {
        return LongestCommonSubsequence(s, String(s.reversed())).getLCSViaTopDown()
    }
}
