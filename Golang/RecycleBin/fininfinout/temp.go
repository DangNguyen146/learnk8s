package main

import "fmt"

func main() {
	genNumbers := make(chan int)
	go func() {
		for i := 1; i <= 10000; i++ {
			genNumbers <- i
		}
	}()

	c1 := fanin(genNumbers)
	c2 := fanin(genNumbers)
	c3 := fanin(genNumbers)
	c4 := fanin(genNumbers)

	c := fanout(c1, c2, c3, c4)

	sum := 0
	for i := 1; i <= 10000; i++ {
		sum += <-c
	}
	fmt.Println(sum)
}

func fanin(numbers <-chan int) <-chan int {
	out := make(chan int)
	go func() {
		for n := range numbers {
			out <- n * n
		}
		close(out)
	}()
	return out
}

func fanout(inputChan ...<-chan int) <-chan int {
	out := make(chan int)
	for _, input := range inputChan {
		go func(input <-chan int) {
			for n := range input {
				out <- n
			}
		}()
	}

	return out
}
