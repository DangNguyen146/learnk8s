package builder

type iglooBuilder struct {
	windowType string
	doorType   string
	floor      int
}

func newIgBuilder() *iglooBuilder {
	return &iglooBuilder{}
}

func (b *iglooBuilder) setWindowType() {
	b.windowType = "snow window"
}

func (b *iglooBuilder) setDoorType() {
	b.doorType = "snow window"
}

func (b *iglooBuilder) setNumFloor() {
	b.floor = 1
}

func (b *iglooBuilder) getHouse() House {
	return House{
		windowType: b.windowType,
		doorType:   b.doorType,
		floor:      b.floor,
	}
}
