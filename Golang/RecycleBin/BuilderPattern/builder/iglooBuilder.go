package builder

type iglooBuilder struct {
	windowType string
	doorType   string
	floor      int
}

func (i *iglooBuilder) setWindowType(temp string) {
	i.windowType = temp
}
func (i *iglooBuilder) setDoorType(temp string) {
	i.doorType = temp
}

func (i *iglooBuilder) setNumFloor(temp int) {
	i.floor = temp
}
