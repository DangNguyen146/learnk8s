# Singleton
Lý do: Khi chúng ta lập trình với những chương trình lớn, đối khi chúng ta có những cái struct mà chúng ta phải khởi tạo các đối tượng cho nó, tốn rất nhiều tài nguyên để chúng ta khởi tạo vận hành.
Khi chúng ta sử dụng, các hành vi hay phương thức của nó đều  giống nhau cho tất cả các lần sử dụng.


Ví dụ, một lớp Singleton có thể được sử dụng để quản lý kết nối đến cơ sở dữ liệu, cài đặt ứng dụng, hoặc bất kỳ trạng thái toàn cục nào mà bạn muốn duy trì trong suốt vòng đời của ứng dụng.

==> Signleton chính là 1 design partent giúp hiện thực mong muốn đó của chúng ta

Singleton thường được sử dụng khi có một tài nguyên chung hoặc trạng thái mà bạn muốn chia sẻ giữa nhiều phần của ứng dụng mà không muốn tạo ra nhiều bản sao của tài nguyên đó.

## Cấu trúc project
- Interface