import Foundation

let weight: [Int] = [1, 3, 4, 5]
let value: [Int] = [1, 4, 5, 7]
let capacity: Int = 7

let maxProfit = knapsackRecursive(weight: weight, value: value, capacity: capacity, size: weight.count)
