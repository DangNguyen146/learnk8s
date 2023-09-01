package main

import (
	"fmt"
	"sync"
)

func main() {
	var wg = sync.WaitGroup{}
	ch1 := make(chan int)
	ch2 := make(chan int)

	wg.Add(2)
	go func() {
		for {
			select {
			case i := <-ch1:
				fmt.Printf("Channel 1: %v\n", i)

			case j := <-ch2:
				fmt.Printf("Channel 2: %v\n", j)
			default:
				break
			}

			if _, ok1 := <-ch1; !ok1 {
				if _, ok2 := <-ch2; !ok2 {
					break
				}
			}

		}
		wg.Done()
	}()
	go func() {
		ch1 <- 42
		ch1 <- 42
		ch1 <- 42
		ch1 <- 42
		ch1 <- 42
		ch2 <- 12
		close(ch1)
		close(ch2)
		wg.Done()
	}()

	wg.Wait()
}
