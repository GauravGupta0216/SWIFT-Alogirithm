import Foundation

public struct MatrixChainMultiplication {
    public var input: [Int]

    public init(_ input: [Int]) {
        self.input = input
    }
    
    public func minimumCost() -> Int{
        return solve(input, i: 1, j: input.count-1)
    }
    
    func solve(_ arr: [Int], i: Int, j: Int) -> Int {
        var minValue = Int.max
        if i >= j {
            return 0
        }

        for k in i...j-1 {
            let tempResult = solve(arr, i: i, j: k) + solve(arr, i: k+1, j: j) + arr[i-1]*arr[k]*arr[j]
            minValue = min(minValue, tempResult)
        }
        return minValue
    }
}
