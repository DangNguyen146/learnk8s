package chainofrespons

import "fmt"

type Medical struct {
	next Department
}

func (d *Medical) Execute(p *Patient) {
	if p.isMedicineProvider {
		fmt.Println("Patient already provide medicine")
		d.next.Execute(p)
		return
	}
	fmt.Println("We are providing medical for paitients")
	p.isMedicineProvider = true
	d.next.Execute(p)
}
func (d *Medical) SetNext(next Department) {
	d.next = next
}
