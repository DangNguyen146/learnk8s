package main

import (
	"fmt"

	"./builder"
)

func main() {
	normalBuilder := builder.GetBuilder("normal")
	iglooBuilder := builder.GetBuilder("igloo")

	director := builder.NewDirector(normalBuilder)
	normalHouse := director.BuildHouse()

	fmt.Printf("Normal Hose Door Type: %s\n", normalHouse.GetDoorType())
	fmt.Printf("Normal Hose Window Type: %s\n", normalHouse.GetWindowType())
	fmt.Printf("Normal Hose Num Floor: %d\n", normalHouse.GetNumFloor())

	director.SetBuilder(iglooBuilder)
	iglooHouse := director.BuildHouse()

	fmt.Printf("\nIgloo Hose Door Type: %s\n", iglooHouse.GetDoorType())
	fmt.Printf("Igloo Hose Window Type: %s\n", iglooHouse.GetWindowType())
	fmt.Printf("Igloo Hose Num Floor: %d\n", iglooHouse.GetNumFloor())

}
