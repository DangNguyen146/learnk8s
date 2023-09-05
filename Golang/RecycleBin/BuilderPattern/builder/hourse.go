package builder

type House struct {
	windowType string
	doorType   string
	floor      int
}

type IBuilder interface {
	setWindowType(temp string)
	setDoorType(temp string)
	setNumFloor(temp int)
}

func GetBuilder(builderType string) IBuilder {
	switch builderType {
	case "igloo":
		return &iglooBuilder
	case "normal":
		return &normalBuilder
	}
	return nil
}

func (h *House) GetWindowType() string {
	return h.windowType
}

func (h *House) GetDoorType() string {
	return h.doorType
}

func (h *House) GetNumFloor() int {
	return h.floor
}
