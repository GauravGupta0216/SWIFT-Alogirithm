/*
    Given a string str, a partitioning of the string is a palindrome partitioning
    if every sub-string of the partition is a palindrome, the task is to
    find the minimum number of cuts needed for palindrome partitioning of the given string.
*/

import Foundation

public struct PalindromePartition {
    let str: [Character]
    
    public init(_ str: String) {
        self.str = Array(str)
    }
    
    ///Recursion
    public func getMinPartition() -> Int {
        return solveViaRecursion(i: 0, j: str.count-1)
    }

    func solveViaRecursion(i: Int, j: Int) -> Int {
        /// Empty string or Single character or Is Palindrome
        /// Return 0, as no need to partition here
        if i >= j || isPalindrome(i, j) {
            return 0
        }
        
        var minPartition = Int.max
        for k in i..<j {
            let tempVal = 1 + solveViaRecursion(i: i, j: k) + solveViaRecursion(i: k+1, j: j)
            minPartition = min(minPartition, tempVal)
        }
        return minPartition
    }

    func isPalindrome(_ i: Int, _ j: Int) -> Bool {
        var x = i
        var y = j
        while x <= y {
            if str[x] != str[y] {
                return false
            }
            x += 1
            y -= 1
        }
        return true
    }
}
