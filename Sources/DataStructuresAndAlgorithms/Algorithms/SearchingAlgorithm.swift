struct SearchingAlgorithm {
    // In computer science, binary search, also known as half-interval search,[1] logarithmic search,[2] or binary
    // chop,[3] is a search algorithm that finds the position of a target value within a sorted array.[4][5] Binary
    // search compares the target value to the middle element of the array. If they are not equal, the half in which
    // the target cannot lie is eliminated and the search continues on the remaining half, again taking the middle
    // element to compare to the target value, and repeating this until the target value is found. If the search
    // ends with the remaining half being empty, the target is not in the array.
    // https://en.wikipedia.org/wiki/Binary_search_algorithm
    //
    // Worst complexity: O(logn)
    // Average complexity: O(logn)
    // Best complexity: O(1)
    // Space complexity: O(1) (a.k.a memory usage)
    func binarySearch<T: Comparable>(_ x: T, _ n: [T]) -> Int? {
        var l = 0
        var h = n.count - 1
        while l <= h {
            let m = l + (h - l) / 2
            if n[m] == x {
                return m
            } else if n[m] < x {
                l = m + 1
            } else {
                h = m - 1
            }
        }
        return nil
    }
}
