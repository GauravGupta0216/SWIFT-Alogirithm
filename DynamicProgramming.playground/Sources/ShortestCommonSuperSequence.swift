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
}
