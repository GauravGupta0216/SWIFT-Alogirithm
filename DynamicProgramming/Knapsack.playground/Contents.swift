import Foundation

let weight: [Int] = [1, 3, 4, 5]
let value: [Int] = [1, 4, 5, 7]
let capacity: Int = 7

//Knapsack via Recursion
KnapsackRecursive().calculate(weight: weight, value: value, capacity: capacity, size: weight.count)


//knapsack via Memoization
var dpArray: [[Int]] = Array(repeating: [Int](repeating: -1, count: capacity+1), count: weight.count+1)
var knapsackMemoization = KnapsackMemoization(dp: dpArray)
knapsackMemoization.calculate(weight: weight, value: value, capacity: capacity, size: weight.count)

//knapsack via top-down approach
var dpArray2: [[Int]] = Array(repeating: [Int](repeating: 0, count: capacity+1), count: weight.count+1)
var knapsackTopDown = KnapsackTopDown(dp: dpArray2)
knapsackTopDown.calculate(weight: weight, value: value, capacity: capacity, size: weight.count)
