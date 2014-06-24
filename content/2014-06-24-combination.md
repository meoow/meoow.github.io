Title: Combination
Date: 2014-06-24 09:43
Modified: 
Category: Article
Tags: go
Authors: meoow
```go
package main

import "fmt"

func main() {
	var n = 6
	var k = 3
	ar := make([]int, k)
	comb(n, k, ar)
	fmt.Println(damn)
}

var count = 0

func comb(n, k int, arr []int) {
	count++
	fmt.Println("--", count, "--")
	for i := n; i >= k; i-- {
		arr[k-1] = i
		if k > 1 {
			comb(n-1, k-1, arr)
		} else {
			fmt.Println(arr)
		}
	}
	count--
}
```
