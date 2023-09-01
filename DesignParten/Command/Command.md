# Command
Khi nào sử dụng: Là chúng ta sẽ gửi 1 hoặc nhiều yêu cầu cho một đối tượng hoặc nhiều đối tượng mà chúng ta không muốn biết bất kỳ các hoạt động.
Hoặc chúng ta muốn che dấu các hoạt động phía sau để thực thi các yêu cầu đó hoặc đối tượng nhận để thực thi yêu cầu đó
## Gồm có các thành phần
1. Invoker <-- Người nhận command của chúng ta
2. Command interface --> Chứa hành vi chung của command
    + execute() 
3. Concrete command 1 --> Có 1 hoặc nhiều command conrec(command thực thể) chúng ta cài đặt những command cụ thể
4. Concrete command 1
5. ...
6. receive interface --> định nghĩ các đối tượng để nhận các yêu cầu này và sử lý
7. concrete receiver
8. main --> trigger invorker

==> Chúng ta chỉ biết là main truyền lệnh vào invoker, chúng ta không biết sao đó có receiver nào và cài đặt như thế nào

## Demo
- invoker   ==> button
- command interface ==> conmmand
    + excute()
- concrete comand 1 - on command
- concrete comand 2 - off command
- receive interface - device
- concrete receiver - tivi
- main

Idead: Bấm nút này trên remote. Khi chúng ta bấm nút ON, nó sẽ truyền lệnh ON vào TV --> Thực thể TiVi mới là thực thể thực hiện hành vi của chúng ta.