package singleton

type Singleton interface {
	AddOne() int
}

/* đây là cái struct mà chúng ta sẽ chỉ cho phép khởi tạo duy nhất một đối tượng trong xuyên xuốt chương trình chúng ta chạy, nên chúng ta không mong muốn người ta truy xuất vào cái struct cửa chúng ta ở ngoài [[package]] để người ta khai báo hoặc khởi tạo*/
type singleton struct {
	count int
}

var instance *singleton

func GetInstance() Singleton {
	if instance == nil {
		instance = &singleton{count: 100}
	}
	return instance
}

func (s *singleton) AddOne() int {
	s.count++
	return s.count
}
