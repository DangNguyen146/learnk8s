package main

import "fmt"

func main() {
	numbers := []int{}
	for i := 1; i <= 1000000000; i++ {
		numbers = append(numbers, i)
	}

	x := generaterPineLine(numbers)

	c1 := fanout(x)
	c2 := fanout(x)
	c3 := fanout(x)

	c := fanin(c1, c2, c3)
	sum := 0

	for i := 0; i < len(numbers); i++ {
		sum += <-c
	}
	fmt.Println(sum)

}

func fanin(inputChan ...<-chan int) <-chan int {
	in := make(chan int)
	go func() {
		for _, c := range inputChan {
			for n := range c {
				in <- n
			}
		}
	}()
	return in
}

func fanout(x <-chan int) <-chan int {
	out := make(chan int)
	go func() {
		for n := range x {
			out <- n * n
		}
		close(out)
	}()
	return out
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
