package abstractfactory

/* Adidas is struct */
type Adidas struct{}

/* Makeshoe is function */
func (a *Adidas) MakeShoe() IShoe {
	return &adidasShoe{
		shoe: shoe{
			logo: "adidas",
			size: 14,
		},
	}
}

/* Makeshort is function */
func (a *Adidas) MakeShort() IShort {
	return &adidasShort{
		short: short{
			logo: "adidas",
			size: 14,
		},
	}
}
