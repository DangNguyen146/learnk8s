package main

import (
	"fmt"
)

func main() {
	var ts, ms int
	_, err := fmt.Scanf("%d", &ts)
	if err != nil {

	}

	_, err1 := fmt.Scanf("%d", &ms)
	if err1 != nil {

	}
	if ms == 0 {
		fmt.Printf("INVALID")
		return
	}
	if ts%ms == 0 {
		temp := ts / ms
		fmt.Print(temp)
		return
	}

	ps := PhanSo{
		ts: ts,
		ms: ms,
	}
	ps.rutgon()
	fmt.Printf("%v %v", ps.ts, ps.ms)

	// if SNT(i) == true {
	// 	fmt.Printf("YES")
	// } else {
	// 	fmt.Printf("NO")
	// }
}

type PhanSo struct {
	ts int
	ms int
}

func UCLN(a int, b int) int {
	if a%b == 0 {
		return b
	}
	return UCLN(b, a%b)

}

func (ps *PhanSo) rutgon() {
	temp := UCLN(ps.ts, ps.ms)
	ps.ts /= temp
	ps.ms /= temp

	if ps.ms < 0 {
		ps.ts *= -1
		ps.ms *= -1
	}
}

// func SNT(a int) bool {
// 	if a < 2 {
// 		return false
// 	}
// 	temp := int(math.Sqrt(float64(a)))
// 	for i := 2; i <= temp; i++ {
// 		if a%i == 0 {
// 			return false
// 		}
// 	}
// 	return true
// }
