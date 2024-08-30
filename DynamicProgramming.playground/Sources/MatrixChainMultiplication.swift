import Foundation

public struct MatrixChainMultiplication {
    public var input: [Int]

    public init(_ input: [Int]) {
        self.input = input
    }
    
    //Recursion
    public func minimumCost() -> Int {
        return solve(input, i: 1, j: input.count-1)
    }
    
    func solve(_ arr: [Int], i: Int, j: Int) -> Int {
        if i >= j {
            return 0
        }

        var minValue = Int.max
        for k in i...j-1 {
            let tempResult = solve(arr, i: i, j: k) + solve(arr, i: k+1, j: j) + arr[i-1]*arr[k]*arr[j]
            minValue = min(minValue, tempResult)
        }
        return minValue
    }
    
    //Memoization - Bottom-up DP
    public func minimumCost2() -> Int {
        let n = input.count
        var dp = Array(repeating: [Int](repeating: -1, count: n+1), count: n+1)
        
        return minMultMemoization(input, &dp, i: 1, j: n-1)
    }
    
    func minMultMemoization(_ arr: [Int], _ dp: inout [[Int]], i: Int, j: Int) -> Int {
        if i >= j {
            return 0
        }
        if dp[i][j] != -1 {
            return dp[i][j]
        }
        
        var minValue = Int.max
        for k in i..<j {
            let tempResult = minMultMemoization(arr, &dp, i: i, j: k) + minMultMemoization(arr, &dp, i: k+1, j: j) + arr[i-1]*arr[k]*arr[j]
            minValue = min(minValue, tempResult)
        }
        dp[i][j] = minValue
        return minValue
    }
    
}
