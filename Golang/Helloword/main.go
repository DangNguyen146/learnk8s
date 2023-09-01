package main

import "fmt"

func main() {
	var a string
	a = "a"
	fmt.Printf("%c, %t", a, a)
	fmt.Printf("%v, %T", a, a)
}
