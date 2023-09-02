package main

import (
	"fmt"

	"./singleton"

	"time"
)

func main() {
	for i := 0; i < 10; i++ {
		go func() {
			fmt.Printf("%p\n", singleton.GetInstance())
		}()
	}

	time.Sleep(time.Second * 10)

	// s1 := singleton.GetInstance()
	// fmt.Println(s1.AddOne())
	// fmt.Printf("%p\n", s1)
	// s2 := singleton.GetInstance()
	// fmt.Printf("%p\n", s2)
}
