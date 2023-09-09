package abstractfactory

/* ISportFactory is interface */
type ISportFactory interface {
	MakeShoe() IShoe
	MakeShort() IShort
}

func GetSportFactory(brand string) ISportFactory {
	switch brand {
	case "adidas":
		return &Adidas{}
	case "nike":
		return &Nike{}
	}
	return nil
}
