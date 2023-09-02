package main

import (
	"fmt"

	"./singleton"
)

func main() {
	s1 := singleton.GetInstance()
	s2 := singleton.GetInstance()
	fmt.Printf("%p\n", &s1)
	fmt.Printf("%p\n", &s2)
}
