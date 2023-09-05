package builder

type normalBuilder struct {
	windowType string
	doorType   string
	floor      int
}


func (i *normalBuilder) setWindowType(temp string) {
	i.windowType = temp
}
func (i *normalBuilder) setDoorType(temp string) {
	i.doorType = temp
}

func (i *normalBuilder) setNumFloor(temp int) {
	i.floor = temp
}
