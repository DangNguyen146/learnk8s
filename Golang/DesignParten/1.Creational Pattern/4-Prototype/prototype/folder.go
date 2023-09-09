package prototype

import "fmt"

/* Folder is struct */
type Folder struct {
	Childrens []INode
	Name      string
}

/* Printf is function */
func (f *Folder) Print(s string) {
	fmt.Println(s + f.Name)
	for _, i := range f.Childrens {
		i.Print(s + s)
	}
}

/* Clone function */
func (f *Folder) Clone() INode {
	closeFolder := &Folder{Name: f.Name + "_Clone"}
	var tempChildren []INode
	for _, i := range f.Childrens {
		copy := i.Clone()
		tempChildren = append(tempChildren, copy)
	}
	closeFolder.Childrens = tempChildren
	return closeFolder
}
