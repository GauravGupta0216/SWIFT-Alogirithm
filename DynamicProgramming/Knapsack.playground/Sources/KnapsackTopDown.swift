import Foundation

public struct KnapsackTopDown {
    public var dp: [[Int]]

    public init(dp: [[Int]]) {
        self.dp = dp
    }

    public mutating func calculate(weight: [Int], value: [Int], capacity: Int, size: Int) -> Int {
        for i in 1...size {
            for j in 1...capacity {
                if weight[i-1] <= j {
                    dp[i][j] = max(value[i-1] + dp[i-1][j-weight[i-1]], dp[i-1][j])
                } else {
                    dp[i][j] = dp[i-1][j]
                }
            }
        }
        return dp[size][capacity]
    }
}
