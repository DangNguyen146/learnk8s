package abstractfactory

/* NIke is struct */
type Nike struct{}

/* Makeshoe is function of Nike */
func (a *Nike) MakeShoe() IShoe {
	return &nikeShoe{
		shoe: shoe{
			logo: "nike",
			size: 12,
		},
	}
}

/* Makeshort is function of Nike */
func (a *Nike) MakeShort() IShort {
	return &nikeShort{
		short: short{
			logo: "nike",
			size: 12,
		},
	}
}
