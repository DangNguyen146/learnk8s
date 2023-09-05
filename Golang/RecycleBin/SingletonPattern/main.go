package main

import (
	"fmt"

	"./singleton"
)

func main() {
	instance := singleton.GetInstant()
	instance2 := singleton.GetInstant()
	fmt.Printf("%v\n", instance.GetCount())
	fmt.Printf("%v", instance2.GetCount())
}
