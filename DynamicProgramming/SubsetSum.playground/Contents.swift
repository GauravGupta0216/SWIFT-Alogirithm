import Foundation

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
