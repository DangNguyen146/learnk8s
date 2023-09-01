package command

/* OnCommand is struct */
type OnCommand struct {
	Device Device
}

func (c *OnCommand) execute() {
	c.Device.on()
}
