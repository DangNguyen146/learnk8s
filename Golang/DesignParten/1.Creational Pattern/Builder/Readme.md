# Builder
Khi nào sử dụng: Có 3 lý do
- Lý do 1: Khi chúng ta muốn khởi tạo 1 đối tượng cửa 1 struct, nhưng struct đó có rất nhiều thuộc tính và khi chúng ta khởi tạo 1 cách bình thường thì chúng ta phải nắm được kiểu dữ liệu của thuộc tính đó, thứ tự cửa kiểu dữ liệu đó và cách chúng ta truyền vào cho chính xác
    * Ví dụ: Chúng ta có một struct là account của ngân hàng, thì trong tài khoản ngân hàng có rất nhiều thuộc tính như: tên tài khoản, id tài khoản, địa chỉ, giới tính, số tiền, etc. Như vậy khi chúng ta sử dụng phải gọi một hàm khởi tạo với rất nhiều thuộc tính và thứ tự phải đảm bảo đúng theo sắp xếp chúng ta truyền vào. Trong trường hợp xấu nhất, chúng ta có những thuộc tính có cùng kiểu dữ liệu với nhau ví dụ như số tuổi và số tiền trong tài khoản, đều là kiểu số nguyên. Tuy nhiên khi chúng ta truyền vào khởi tạo thì sai vị trí đó thì nó làm cho logic chương trình sai hoàn toàn và có thể gây thiệt hại rất lớn.
- Lý do 2: Khi chúng ta có 1 cái struct tuy nhiên chúng ta muốn tạo ra đối tượng nó cụ thể hơn trong struc. Ví dụ như: Chúng ta có struct là ngôi nhà, tuy nhiên các đôi tượng chúng ta có thể là
    * đó là 1 ngôi nhà bình thường sẽ có các thuộc tính, thông số, nội thất --> là những tiêu chuẩn bình thường
    * tuy nhiên chúng ta cũng có một đối tượng là một ngôi nhà sử dụng khi mùa đông đến (gọi là ngôi nhà tuyết) --> nó sẽ có thuộc tính khác với ngôi nhà bình thường và nó cũng tuân theo 1 chuẩn nội thất cửa ngôi nhà mùa đông
- Lý do thứ 3: Khi chúng ta có 1 struct và chúng ta muốn khởi tạo một đối tượng với đầy đủ thuộc tính hoặc là chúng ta không khởi tạo đối tượng đó chứ chúng ta không có nhu cầu muốn khởi tạo đối tượng
    * Giả sử struct chúng ta có 4 thuộc tính thì chúng ta phải khởi tạo đối tượng đầy dử 4 thuộc tính chứ ko thể nào chúng ta khởi tạo đối tượng có 3 thuộc tính

## Thành phần
- Client --> Đối tượng
- Builder interface --> Chứa các phương thức gán giá trị cho cái thuộc tính product này
- Concrete builder --> Tạo ra đối tượng cụ thể cho client
    + concrete builder 1
    + concrete builder 2
- Directer --> Liên kết giữa Builder interface và concrete builder

### Ví dụ:
- CLient --> Ngôi nhà
- Builder interface 
- 2 Concerete builder
    + normal house
    + Igloo house
- Director