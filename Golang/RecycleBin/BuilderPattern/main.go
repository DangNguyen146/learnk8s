package main

import "fmt"

func main() {
	house1 := new(House).Name("house1").Color("white")
	house2 := new(House).Name("house2").Color("green").Age(10)
	house1.Color("grey")
	fmt.Printf("house1=%v\n", house1)
	fmt.Printf("house1=%v", house2)
}

type House struct {
	name  string
	color string
	age   int
}

func (h *House) Name(name string) *House {
	h.name = name
	return h
}

func (h *House) Color(color string) *House {
	h.color = color
	return h
}

func (h *House) Age(age int) *House {
	h.age = age
	return h
}
