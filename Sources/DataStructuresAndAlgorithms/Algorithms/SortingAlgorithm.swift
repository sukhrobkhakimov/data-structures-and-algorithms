struct SortingAlgorithm {
    // In computer science, selection sort is an in-place comparison sorting algorithm. It has an O(n²) time
    // complexity, which makes it inefficient on large lists, and generally performs worse than the similar
    // insertion sort.
    // https://en.wikipedia.org/wiki/Selection_sort
    //
    // Worst complexity: n^2
    // Average complexity: n^2
    // Best complexity: n^2
    // Space complexity: 1 (a.k.a memory usage)
    func selectionSort<T: Comparable>(_ n: [T]) -> [T] {
        var n = n
        for i in n.indices {
            var m = i
            for j in n.indices where j > i {
                if n[j] < n[m] { m = j }
            }
            if m != i {
                let v = n[i]
                n[i] = n[m]
                n[m] = v
            }
        }
        return n
    }

    // Insertion sort is a simple sorting algorithm that builds the final sorted array one item at a time.
    // It is much less efficient on large lists than more advanced algorithms such as quicksort, heapsort, or
    // merge sort.
    // https://en.wikipedia.org/wiki/Insertion_sort
    //
    // Worst complexity: n^2
    // Average complexity: n^2
    // Best complexity: n
    // Space complexity: 1 (a.k.a memory usage)
    func insertionSort(_ n: [Int]) -> [Int] {
        var n = n
        let l = n.count - 1
        for i in n.indices where i < l {
            var p = i
            while n[p] > n[p + 1] {
                let v = n[p]
                n[p] = n[p + 1]
                n[p + 1] = v
                if p > 0 { p -= 1 }
            }
        }
        return n
    }
}
