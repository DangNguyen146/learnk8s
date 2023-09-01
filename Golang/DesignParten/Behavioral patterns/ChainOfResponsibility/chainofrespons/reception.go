package chainofrespons

import "fmt"

/* Reception is struct */
type Reception struct {
	next Department
}

/* Execute is fuction */
func (r *Reception) Execute(p *Patient) {
	if p.isRegistered {
		fmt.Println("Patient register has already done")
		r.next.Execute(p)
		return
	}
	fmt.Println("Reception registing patient")
	p.isRegistered = true
	r.next.Execute(p)
}

/* SetNext is fucntion */
func (r *Reception) SetNext(next Department) {
	r.next = next
}
