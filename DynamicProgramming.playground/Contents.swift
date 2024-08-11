import Foundation

/*
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
*/

/*
let input: [Int] = [2, 3, 7, 8, 10]
var sum = 11
let size = input.count

//Check subset sum via Recursion
print(SubsetSumRecursive().isSubsetSum(arr: input, sum: sum, size: size)) //Should print true

sum = 14
print(SubsetSumRecursive().isSubsetSum(arr: input, sum: sum, size: size)) //Should print false

//Check subset sum via top down approach
print(SubsetSumTopDown(input: input, sum: 5).isSubsetSum()) //Should print true
print(SubsetSumTopDown(input: input, sum: 11).isSubsetSum()) //Should print true
print(SubsetSumTopDown(input: input, sum: 14).isSubsetSum()) //Should print false
print(SubsetSumTopDown(input: input, sum: 0).isSubsetSum()) //Should print true
*/
