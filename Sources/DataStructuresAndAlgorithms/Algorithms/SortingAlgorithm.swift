struct SortingAlgorithm {
    // In computer science, selection sort is an in-place comparison sorting algorithm. It has an O(n²) time
    // complexity, which makes it inefficient on large lists, and generally performs worse than the similar
    // insertion sort.
    // https://en.wikipedia.org/wiki/Selection_sort
    //
    // Worst complexity: O(n^2)
    // Average complexity: O(n^2)
    // Best complexity: O(n^2)
    // Space complexity: O(1) (a.k.a memory usage)
    func selectionSort<T: Comparable>(_ n: [T]) -> [T] {
        if n.count <= 1 { return n }
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
    // Worst complexity: O(n^2)
    // Average complexity: O(n^2)
    // Best complexity: O(n)
    // Space complexity: O(1) (a.k.a memory usage)
    func insertionSort<T: Comparable>(_ n: [T]) -> [T] {
        let c = n.count
        if c <= 1 { return n }
        var n = n
        let l = c - 1
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

    // Shellsort, also known as Shell sort or Shell's method, is an in-place comparison sort. It can be seen as
    // either a generalization of sorting by exchange (bubble sort) or sorting by insertion (insertion sort).[3]
    // The method starts by sorting pairs of elements far apart from each other, then progressively reducing the gap
    // between elements to be compared.
    // https://en.wikipedia.org/wiki/Shellsort
    //
    // Worst complexity: Depends on gap sequence
    // Average complexity: O(n*log(n)^2) or O(n^(3/2))
    // Best complexity: O(n)
    // Space complexity: O(n) (a.k.a memory usage)
    func shellSort<T: Comparable>(_ n: [T]) -> [T] {
        let c = n.count
        if c <= 1 { return n }
        var n = n
        var g = c / 2
        while g > 0 {
            for (var i, e) in n.enumerated() {
                while i >= g && n[i - g] > e {
                    n[i] = n[i - g]
                    i -= g
                }
                n[i] = e
            }
            if g == 2 {
                g = 1
            } else {
                g = g * 5 / 11
            }
        }
        return n
    }

    // Bubble sort, sometimes referred to as sinking sort, is a simple sorting algorithm that repeatedly steps
    // through the list, compares adjacent elements and swaps them if they are in the wrong order. The pass through
    // the list is repeated until the list is sorted.
    // https://en.wikipedia.org/wiki/Bubble_sort
    //
    // Worst complexity: O(n^2)
    // Average complexity: O(n^2)
    // Best complexity: O(n)
    // Space complexity: O(1) (a.k.a memory usage)
    func bubbleSort<T: Comparable>(_ n: [T]) -> [T] {
        let c = n.count
        if c <= 1 { return n }
        var n = n
        var i = c - 1
        while i > 0 {
            for j in 0..<i {
                if n[j] > n[j + 1] {
                    let v = n[j]
                    n[j] = n[j + 1]
                    n[j + 1] = v
                }
            }
            i -= 1
        }
        return n
    }

    // In computer science, merge sort is an efficient, general-purpose, comparison-based sorting algorithm.
    // Most implementations produce a stable sort, which means that the order of equal elements is the same in the
    // input and output. Merge sort is a divide and conquer algorithm that was invented by John von Neumann in 1945.
    // https://en.wikipedia.org/wiki/Merge_sort
    //
    // Worst complexity: O(nlogn)
    // Average complexity: O(nlogn)
    // Best complexity: O(nlogn)
    // Space complexity: O(n) (a.k.a memory usage)
    func mergeSort<T: Comparable>(_ n: [T]) -> [T] {
        let c = n.count
        if c <= 1 { return n }
        let m = c / 2
        var n1 = Array(n[0..<m])
        var n2 = Array(n[m..<c])
        n1 = mergeSort(n1)
        n2 = mergeSort(n2)
        return merge(n1: n1, n2: n2)
    }

    private func merge<T: Comparable>(n1: [T], n2: [T]) -> [T] {
        var n1 = n1
        var n2 = n2
        var n: [T] = []
        while !n1.isEmpty && !n2.isEmpty {
            if n1[0] > n2[0] {
                n.append(n2[0])
                n2.remove(at: 0)
            } else {
                n.append(n1[0])
                n1.remove(at: 0)
            }
        }
        while !n1.isEmpty {
            n.append(n1[0])
            n1.remove(at: 0)
        }
        while !n2.isEmpty {
            n.append(n2[0])
            n2.remove(at: 0)
        }
        return n
    }

    // Quicksort is an efficient sorting algorithm. Developed by British computer scientist Tony Hoare in 1959 and
    // published in 1961, it is still a commonly used algorithm for sorting. When implemented well, it can be about
    // two or three times faster than its main competitors, merge sort and heapsort.
    // https://en.wikipedia.org/wiki/Quicksort
    //
    // Worst complexity: O(n^2)
    // Average complexity: O(nlogn)
    // Best complexity: O(nlogn)
    // Space complexity: O(logn) (a.k.a memory usage)
    func quickSort<T: Comparable>(_ n: [T]) -> [T] {
        let c = n.count
        if c <= 1 { return n }
        var n = n
        _quickSort(&n, l: 0, h: c - 1)
        return n
    }

    private func _quickSort<T: Comparable>(_ n: inout [T], l: Int, h: Int) {
        if l < h {
            let p = partition(&n, l: l, h: h)
            _quickSort(&n, l: l, h: p - 1)
            _quickSort(&n, l: p + 1, h: h)
        }
    }

    private func partition<T: Comparable>(_ n: inout [T], l: Int, h: Int) -> Int {
        let p = n[h]
        var i = l - 1
        for j in l..<h {
            if n[j] <= p {
                i += 1
                let v = n[i]
                n[i] = n[j]
                n[j] = v
            }
        }
        let v = n[i + 1]
        n[i + 1] = n[h]
        n[h] = v
        return i + 1
    }
}
