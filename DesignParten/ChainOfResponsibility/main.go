package main

import c "./chainofrespons"

func main() {
	cashier := &c.Cashier{}

	medical := &c.Medical{}
	medical.SetNext(cashier)

	doctor := &c.Doctor{}
	doctor.SetNext(medical)

	reception := &c.Reception{}
	reception.SetNext(doctor)

	paitent := &c.Patient{Name: "Yuh"}
	reception.Execute(paitent)
}
