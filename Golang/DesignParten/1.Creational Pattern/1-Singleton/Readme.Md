# Singleton
Lý do: Khi chúng ta lập trình với những chương trình lớn, đối khi chúng ta có những cái struct mà chúng ta phải khởi tạo các đối tượng cho nó, tốn rất nhiều tài nguyên để chúng ta khởi tạo vận hành.
Khi chúng ta sử dụng, các hành vi hay phương thức của nó đều  giống nhau cho tất cả các lần sử dụng.
Ví dụ như: chúng ta có 1 object giao tiếp với db; object đọc ghi 1 file IOFile; object ghi lại log trong ứng dụng chúng ta chạy ==-> Khi đó, chúng ta lại có nhu cầu là chúng ta chỉ muốn khởi tạo đối tượng duy nhất xuyên xuốt chương trình chúng ta cho 1 cái struct nào đó(như: db,io,log)

==> Signleton chính là 1 design partent giúp hiện thực mong muốn đó của chúng ta

## Cấu trúc project
- Interface