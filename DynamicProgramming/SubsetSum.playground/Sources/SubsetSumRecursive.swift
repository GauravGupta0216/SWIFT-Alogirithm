import Foundation

public struct SubsetSumRecursive {
    public init() {}

    public func isSubsetSum(arr: [Int], sum: Int, size: Int) -> Bool {
        if sum == 0 {
            return true
        }
        if size == 0 {
            return false
        }
        if arr[size - 1] <= sum {
            return isSubsetSum(arr: arr, sum: sum - arr[size - 1], size: size - 1) || isSubsetSum(arr: arr, sum: sum, size: size - 1)
        } else {
            return isSubsetSum(arr: arr, sum: sum, size: size - 1)
        }
    }
}
