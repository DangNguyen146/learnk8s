# Interator
Khi nào sử dụng
- Khi chúng ta cần truy cập vào nội dung của các đối tượng nằm trong tập hợp. Tuy nhiên chúng ta không cần biêt nội dung được cài đặt bên trong nó là gì.
- KHi chúng ta muốn được hỗ trợ truy suất nhiều loại tập hợp khác nhau của các đối tượng nằm trong tập hợp đó
- CHúng ta sẽ được cung cấp 1 interface duy nhất để duyệt qua tất cả các phần tử trong tập hợp nào đó
Các lợi ích mang lại
- Tách biệt các phần cài đặt, các phương thức cửa tập hợp với phần cài đặt duyệt qua các phần tử cửa tracking lẽ
- Chúng có thể giúp chúng ta, nếu chúng ta có nhu caaif cài đặt thêm các tập hợp mới và interater(thành phần duyệt qua các tập hợp mới đó) thì chúng ta chỉ việc là thêm vào các file mới ko đụng vao file code cũ
- Chúng ta có thể truy cập song spng trên cùng 1 tập hợp vì mỗi đối tượng interator này chứa 1 trạng thái riêng cửa nó
## Thành phần
- Client --> Các phần tử nằm trong tập hợp mà chúng ta sẽ duyệt
- Collection interface --> Interface định nghĩa các hành vi cửa collection(tập hợp chúng ta chuẩn bị duyệt)
- Concrete collection 1 --> Tập hợp những thực thể được cài đặt từ các collection interface mà ra
- Interator interface --> Chứa các hành vi giúp chúng ta duyệt qua các phần tử ở trong collection interface
    + hasNext
    + getNext
- Concrete interator 1