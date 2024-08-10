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
