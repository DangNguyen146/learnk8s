package chainofrespons

import "fmt"

type Cashier struct {
	next Department
}

func (d *Cashier) Execute(p *Patient) {
	if p.isPaid {
		fmt.Println("Paitent already paid their bill")
		return
	}
	fmt.Println("Paitient is paying the bill")
	p.isPaid = true
}
func (d *Cashier) SetNext(next Department) {
	d.next = next
}
