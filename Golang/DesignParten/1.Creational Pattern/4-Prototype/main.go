package main

import (
	"fmt"

	p "./prototype"
)

func main() {
	file1 := &p.File{Name: "File 1"}
	file2 := &p.File{Name: "File 2"}
	file3 := &p.File{Name: "File 3"}
	folder1 := &p.Folder{
		Childrens: []p.INode{file1},
		Name:      "Folder 1",
	}

	folder2 := &p.Folder{
		Childrens: []p.INode{folder1, file2, file3},
		Name:      "Folder 2",
	}
	fmt.Println("\n Priting folder 2")
	folder2.Print("   ")
	cloneFolder := folder2.Clone()
	fmt.Println("\n Printing for clone folder 2")
	cloneFolder.Print("   ")
}
