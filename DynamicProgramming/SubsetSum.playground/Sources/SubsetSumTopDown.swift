import Foundation

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
        var dp: [[Bool]] = Array(repeating: [Bool](repeating: false, count: sum+1), count: input.count+1)
        for i in 0...size {
            dp[i][0] = true
        }
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
