package main

import "fmt"

func main() {
	generate := make(chan int)
	go func() {
		for i := 1; i <= 1000000; i++ {
			generate <- i
		}
		close(generate)
	}()

	c1 := fanout(generate)
	c2 := fanout(generate)
	c3 := fanout(generate)
	c4 := fanout(generate)
	c5 := fanout(generate)
	c6 := fanout(generate)
	c7 := fanout(generate)
	c8 := fanout(generate)

	c := fanin(c1, c2, c3, c4, c5, c6, c7, c8)
	sum := 0

	for i := 1; i <= 1000000; i++ {
		sum += <-c
	}

	fmt.Println(sum)
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

func fanin(inputChan ...<-chan int) <-chan int {
	out := make(chan int)
	for _, input := range inputChan {
		go func(ch <-chan int) {
			for x := range ch {
				out <- x
			}
		}(input)
	}
	return out
}
