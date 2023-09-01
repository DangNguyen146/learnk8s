package command

import "fmt"

/* Tivi is struct */
type Tivi struct {
	isRunning bool
}

func (t *Tivi) on() {
	t.isRunning = true
	fmt.Println("Turning tivi on")
}

func (t *Tivi) off() {
	t.isRunning = false
	fmt.Println("Turning tivi off")
}
