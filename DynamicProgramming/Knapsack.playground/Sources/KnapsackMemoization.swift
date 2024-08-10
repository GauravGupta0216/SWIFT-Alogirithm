import Foundation

public struct KnapsackMemoization {
    public var dp: [[Int]]

    public init(dp: [[Int]]) {
        self.dp = dp
    }

    public mutating func calculate(weight: [Int], value: [Int], capacity: Int, size: Int) -> Int {
        if capacity == 0 || size == 0 {
            return 0
        }
        if dp[size][capacity] != -1 {
            return dp[size][capacity]
        }
        if weight[size - 1] <= capacity {
            dp[size][capacity] = max(
                value[size - 1] + calculate(weight: weight, value: value, capacity: capacity - weight[size - 1], size: size - 1),
                calculate(weight: weight, value: value, capacity: capacity, size: size - 1)
            )
        } else {
            dp[size][capacity] = calculate(weight: weight, value: value, capacity: capacity, size: size - 1)
        }
        return dp[size][capacity]
    }
}
