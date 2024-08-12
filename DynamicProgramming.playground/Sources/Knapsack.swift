/*
    Given N items where each item has some weight and profit associated with it and also given a bag with capacity W.
    The task is to put the items into the bag such that the sum of profits associated with them is the maximum possible.
*/

import Foundation

public struct KnapsackRecursive {
    public init() {}
    public func calculate(weight: [Int], value: [Int], capacity: Int, size: Int) -> Int {
        if capacity == 0 || size == 0 {
            return 0
        }
        if weight[size - 1] <= capacity {
            return max(
                value[size - 1] + calculate(weight: weight, value: value, capacity: capacity - weight[size - 1], size: size - 1),
                calculate(weight: weight, value: value, capacity: capacity, size: size - 1)
            )
        } else {
            return calculate(weight: weight, value: value, capacity: capacity, size: size - 1)
        }
    }
}


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
