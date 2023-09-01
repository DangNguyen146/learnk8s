package main

import (
	"fmt"
)

/* đếm số lượng con vật */
func main() {
	go func() {
		count("sheep")
	}()
	go func() {
		count("fish")
	}()
	fmt.Println("goruntine done")
}

func count(name string) {
	for i := 1; i < 5; i++ {
		fmt.Println(name, i)
	}
}
