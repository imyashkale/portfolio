---
title: Understanding Linear Search, Largest, and Smallest Elements in an Array in Go
icon: material/newspaper-variant-outline
date: 2023-12-07 13:34:01
categories:
  - DSA
tags:
  - DSA
---

Arrays are fundamental structures in programming, offering efficient ways to store and access sequences of data. In Go, like in many other programming languages, arrays and slices are used extensively. This article explores the implementation of linear search and methods to find the largest and smallest elements in an array in Go.

#### What is Linear Search?

Linear search is a straightforward method of searching for a value within a list. It sequentially checks each element of the list until a match is found or the whole list has been searched. This method is simple but not particularly efficient, especially for large lists, as it requires, on average, checking through half of the elements in the list.

In Go, a linear search through an array can be implemented as follows:

```go
func (a Array) LinearSearch(target int) int {
    for i := 0; i < a.Len(); i++ {
        if target == a.elements[i] {
            return i // Return the index of the found element
        }
    }
    return -1 // Return -1 if the element is not found
}
```

This function iterates through all elements of the `Array` until it finds the target value, returning its index. If the value isn't found, it returns -1.

#### Finding the Largest Element

To find the largest element in an array, we can iterate through the array, keeping track of the largest value found so far. This method also involves linearly scanning the array, similar to a linear search.

Here's how you might implement it in Go:

```go
func (a Array) Largest() int {
    largest := math.MinInt // Start with the smallest possible integer
    for i := 0; i < a.Len(); i++ {
        if a.elements[i] > largest {
            largest = a.elements[i] // Update largest if a bigger element is found
        }
    }
    return largest
}
```

This function sets the initial `largest` value to the smallest possible integer. It then compares each element of the array to find the largest one.

#### Finding the Smallest Element

Similarly, to find the smallest element in an array, the process is much like finding the largest but in reverse. We keep track of the smallest value encountered as we iterate through the array.

The implementation in Go would look like this:

```go
func (a Array) Lowest() int {
    lowest := math.MaxInt // Start with the largest possible integer
    for i := 0; i < a.Len(); i++ {
        if a.elements[i] < lowest {
            lowest = a.elements[i] // Update lowest if a smaller element is found
        }
    }
    return lowest
}
```

In this case, the initial value of `lowest` is set to the largest possible integer. The function then iterates through the array, updating `lowest` whenever it finds a smaller element.

#### Conclusion

These methods are essential for many basic operations on arrays in Go. While linear search, finding the largest, and finding the smallest elements are simple, they form the backbone of more complex algorithms and operations. Being well-versed in these basics is crucial for any programmer working with arrays in Go.
