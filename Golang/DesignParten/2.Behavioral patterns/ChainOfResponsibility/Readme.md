# Chain of responsibility 
Khi nào sử dụng: Khi chúng ta có 1 cái đối tượng, đối tường cần được sử lý bởi một chuổi các hành vi sử lý tuần tự.
Ví dụ như: ta có một đối tượng và đối tượng đó phải sử lý hành vi A --> Sau khi kết thức hành vi A thì chúng ta lại tiếp tục sử lý hành vi B --> Sau khi kết thúc hành vi B thì chúng ta tiếp tục sử lý hành vi C
Và tương tự như vậy nó tạp thành chuổi các hành vi sử lý trên đối tượng đó.
## Gồm có các thành phần
1. Đầu tiên là client <-- là đối tượng chúng ta cần phải sử lý theo một chuổi các hành vi
### Chuổi hành vi [behavier] gồm các thành phần
1. Handler interface
    + Execute <-- mỗi hành vi, chúng ta phải thực hiện một hành động gì đó
    + SetNext <-- Hành vi kế tiếp trong chuổi hành vi cửa chúng ta là hành vi nào (Phương thức)
2. Concrete handler <-- Thiết lặp hành vi
    + Concrete handler 1
    + Concrete handler 2
    + Concrete handler 3
    + Concrete handler 4

## Giả sử
- Client <-- patiner
- Handler interface <-- Department
- Concerete handler 1 -> Reception
- Concerete handler 2 -> Doctor
- Concerete handler 3 -> Medicine
- Concerete handler 4 -> Cashier