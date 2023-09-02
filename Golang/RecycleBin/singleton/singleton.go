package singleton

import "fmt"

type singleton struct {
	count int
}

type sft struct {
	count int
}

type Sft struct {
	count int
}

type def struct {
	temp int
}

type Singleton interface {
	AddOne() int
}

var instance *singleton
var temp *def

func init() {
	instance = &singleton{count: 100}
	temp = &def{temp: 100}
}

func GetInstance() Singleton {
	return instance
}

func GetTemp() Singleton {
	return temp
}

func (s *singleton) AddOne() int {
	s.count++
	fmt.Println("singleton")

	return s.count
}

func (s *def) AddOne() int {
	fmt.Println("def")
	return s.temp
}
