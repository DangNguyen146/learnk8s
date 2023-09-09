package chainofrespons

import "fmt"

type Doctor struct {
	next Department
}

func (d *Doctor) Execute(p *Patient) {
	if p.isDocktorChecked {
		fmt.Println("Patient already checked by docktor")
		d.next.Execute(p)
		return
	}
	fmt.Println("Doctor is checking patient")
	p.isDocktorChecked = true
	d.next.Execute(p)
}

func (d *Doctor) SetNext(next Department) {
	d.next = next
}
