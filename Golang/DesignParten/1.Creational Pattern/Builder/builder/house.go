package builder

/* House is struct */
type House struct {
	// Không muốn các package ở ngoài có thể sét các giá trị vào property của struct này nên viết in thường
	windowType string
	doorType   string
	floor      int
}

/* GetWindownType is getter */
func (h *House) GetWindowType() string {
	return h.windowType
}

/* GetDoorType is getter */
func (h *House) GetDoorType() string {
	return h.doorType
}

/* GetNumFloor */
func (h *House) GetNumFloor() int {
	return h.floor
}
