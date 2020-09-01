import Foundation

let c = 20
var n: [Int] = (0..<c).map { _ in .random(in: 0...c) }

let sortingAlgorithm = SortingAlgorithm()
print("Selection sort: \(sortingAlgorithm.selectionSort(n))")
print("Insertion sort: \(sortingAlgorithm.insertionSort(n))")
