/*
    Given a knapsack weight "capacity" and a set of n items with certain value  and weight.
    We need to calculate the maximum amount that could make up this quantity exactly.
    This is different from classical Knapsack problem, here we are allowed to use unlimited number of instances of an item.
*/

import Foundation

public struct UnboundedKnapsack {
    public let value: [Int]
    public let weight: [Int]
    public let capacity: Int
    public let size: Int
    
    public init(_ value: [Int], _ weight: [Int], _ capacity: Int) {
        self.value = value
        self.weight = weight
        self.capacity = capacity
        self.size = weight.count
    }

    public func calculate() -> Int {
        //Initialization
        var dp = Array(repeating: [Int](repeating: 0, count: capacity+1), count: size+1)

        //Calculate the DP Matrix
        for i in 1...size {
            for j in 1...capacity {
                if weight[i-1] <= j {
                    dp[i][j] = max(dp[i-1][j], value[i-1] + dp[i][j-weight[i-1]])
                } else {
                    dp[i][j] = dp[i-1][j]
                }
            }
        }
        
        return dp[size][capacity]
    }
}
