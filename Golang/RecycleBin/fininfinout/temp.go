package main

import "fmt"

func main() {
	numbers := []int{}

	for i := 1; i <= 1000000; i++ {
		numbers = append(numbers, i)
	}
	sum := 0
	for i := 0; i < 1000000; i++ {
		sum += (numbers[i] * numbers[i])
	}
	fmt.Println(sum)
}
