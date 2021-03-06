import Foundation

let c = 20
var n: [Int] = (0..<c).map { _ in .random(in: 0...c) }
let x = Int.random(in: 0...c)

let sortingAlgorithm = SortingAlgorithm()
print("Selection sort: \(sortingAlgorithm.selectionSort(n))")
print("Insertion sort: \(sortingAlgorithm.insertionSort(n))")
print("Shell sort: \(sortingAlgorithm.shellSort(n))")
print("Bubble sort: \(sortingAlgorithm.bubbleSort(n))")
print("Merge sort: \(sortingAlgorithm.mergeSort(n))")
print("Quick sort: \(sortingAlgorithm.quickSort(n))")

let searchingAlgorithm = SearchingAlgorithm()
print("Binary search: \(searchingAlgorithm.binarySearch(x, sortingAlgorithm.quickSort(n)))")
