package singleton

import "sync"

type Singleton struct {
	count int
}
type ISingleton interface {
	GetCount() int
}

var instant *Singleton
var once sync.Once

func GetInstant() *Singleton {
	once.Do(func() {
		instant = &Singleton{count: 100}
	})
	return instant
}

func (sing *Singleton) GetCount() int {
	return sing.count
}
