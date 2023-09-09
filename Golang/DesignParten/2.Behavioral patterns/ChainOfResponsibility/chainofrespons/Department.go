package chainofrespons

/* Department is an interface */
type Department interface {
	Execute(*Patient)
	SetNext(Department)
}
