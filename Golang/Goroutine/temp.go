package main

import (
	"fmt"
)

func main() {
	randonNumbers := []int{}
	for i := 1; i <= 1000; i++ {
		randonNumbers = append(randonNumbers, i)
	}

	// genarate pipeline
	inputChan := generaterPineLine(randonNumbers)

	// fanout
	c1 := fanout(inputChan)
	c2 := fanout(inputChan)
	c3 := fanout(inputChan)
	c4 := fanout(inputChan)

	// fan-in
	c := fanin(c1, c2, c3, c4)

	sum := 0

	for i := 0; i < len(randonNumbers); i++ {
		sum += <-c
	}

	fmt.Printf("Total sum of square: %d", sum)
}
func generaterPineLine(numbers []int) <-chan int {
	out := make(chan int)
	go func() {
		for _, n := range numbers {
			out <- n
		}
		close(out)
	}()
	return out
}
func fanout(in <-chan int) <-chan int {
	out := make(chan int)
	go func() {
		for n := range in {
			out <- n*n
		}
		close(out)
	}()
	return out
}
func fanin(inputChannel ...<-chan int) <-chan int {
	in := make(chan int)
	go func() {
		for _, c := range inputChannel {
			for n := range c {
				in <- n
			}
		}
	}()
	return in
}
