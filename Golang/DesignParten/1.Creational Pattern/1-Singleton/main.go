package main

import (
	"fmt"

	"./singleton"
)

func main() {
	// for i := 0; i < 10; i++ {
	// 	go func() {
	// 		fmt.Printf("%p\n", singleton.GetInstance())
	// 	}()
	// }
	// time.Sleep(time.Second * 10)

	instant := singleton.NewFoo()
	fmt.Printf("%p\n", instant)
	instant1 := singleton.NewFoo()
	fmt.Printf("%p", instant1)
}
