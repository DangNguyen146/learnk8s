package main

import (
	"fmt"
)

/* đếm số lượng con vật */
func main() {
	s := 0
	var numbers []int
	for i := 1; i <= 99999999; i++ {
		numbers = append(numbers, i)
	}

	for i := 0; i < 99999999; i++ {
		s += numbers[i] * numbers[i]
	}
	fmt.Println(s)
}
