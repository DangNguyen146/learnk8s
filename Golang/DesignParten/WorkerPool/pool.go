package main

import "fmt"

func main() {
	number := 100
	numberOfWorker := 5
	jobs := make(chan int, number)
	results := make(chan int, number)

	for i := 0; i <= numberOfWorker; i++ {
		go worker(jobs, results)
	}

	for i := 1; i <= number; i++ {
		jobs <- i
	}
	close(jobs)

	for i := 1; i < number; i++ {
		fmt.Println(<-results)
	}
}
func worker(jobs <-chan int, results chan<- int) {
	for n := range jobs {
		results <- fibonaci(n)
	}
}

func fibonaci(n int) int {
	if n <= 1 {
		return n
	}
	return fibonaci(n-1) + fibonaci(n-2)
}
