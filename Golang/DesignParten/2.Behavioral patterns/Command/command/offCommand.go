package command

/* OffCommand is struct */
type OffCommand struct {
	Device Device
}

func (c *OffCommand) execute() {
	c.Device.off()
}
