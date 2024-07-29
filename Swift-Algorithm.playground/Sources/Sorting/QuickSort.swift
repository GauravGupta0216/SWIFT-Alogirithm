import Foundation

public func quickSort(_ input: [Int]) -> [Int] {
    return quickSortAlg(input, low: 0, high: input.count - 1)
}

func quickSortAlg(_ input: [Int], low: Int, high: Int) -> [Int] {
    var result = input
    if low < high {
        let pivot = input[high]
        
        var i = low
        
        for j in low..<high {
            if result[j] <= pivot {
                (result[i], result[j]) = (result[j], result[i])
                i += 1
            }
        }
        (result[i], result[high]) = (result[high], result[i])
        result = quickSortAlg(result, low: low, high: i - 1)
        result = quickSortAlg(result, low: i + 1, high: high)
    }
    
    return result
}
