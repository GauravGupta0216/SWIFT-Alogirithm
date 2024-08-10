import Foundation

let weight: [Int] = [1, 3, 4, 5]
let value: [Int] = [1, 4, 5, 7]
let capacity: Int = 7

//Knapsack via Recursion
KnapsackRecursive().calculate(weight: weight, value: value, capacity: capacity, size: weight.count)


//knapsack via Memoization
var dpArray: [[Int]] = Array(repeating: [Int](repeating: -1, count: capacity+1), count: weight.count+1)
var obj = KnapsackMemoization(dp: dpArray)
obj.calculate(weight: weight, value: value, capacity: capacity, size: weight.count)
