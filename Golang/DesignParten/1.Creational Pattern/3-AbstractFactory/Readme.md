# Abstract Factory
Khi nào ta nên sử dụng:
- Khi chúng ta có một nhu cầu chúng ta có thể có một hoặc nhiều cách khởi tạo một hoặc nhiều đối tượng để tạo thành một dòng các sản phẩm mà trong ngôn ngữ lập trình golang có thể gọi đó là một các struct.
## Thành phần
- Abstract Product Interface 1 <-- định nghĩa các hành vi của Product 1
- Abstract Product Interface 2 <-- định nghĩa các hành vi của Product 2

    * Có thể có nhiều <i>Product</i> nên có nhiều <i>interface</i>
==> Abstract nghĩa là trừa tượng. Khi chúng ta có một interface, nghĩa là chúng ta có một đối tượng --> trừa tượng của một sản phẩm trừa tượng thì chúng ta phải có 1 <b>concrete product</b> một cái mà chúng ta hiện thực nó.

- Concrete Product 1
- Concrete Product 2

    * Tiếp theo chúng ta phải có các thành phần tức là những cách chúng ta tạo ra những sản phẩm này.

- Abstract Factory Interface 1 <-- Chúng ta định nghĩa những hành vi của đối tượng Factory mà chúng ta định nghĩa một cách trừu tượng.
- Abstract Factory Interface 2
    * Chúng ta cũng có thể có 1 cách hoặc nhiều cách tạo ra sản phẩm này

    * Khi chúng ta có abstract factory thì chúng ta phải có concrete để hiện thực nó

- Concrete Factory 1
- Concrete Factory 2

==> Đây là các thành phần chính để chúng ta tạo thành một cái design pattern -> Abstract factory. Trong một số trường hợp chúng ta sẽ có một số thành phần sẽ được lượt bỏ hoặc tùy nhu cầu của chúng ta chỉ gói gon trong một sản phẩm hoặc chỉ trong 1 factory.

### Ví dụ:
- Abstract Product Interface 1 ==> Shoe
- Abstract Product Interface 2 ==> Short 
    * Tạo ra 2 đối tượng shoe and short này từ nhà sản suất là adidas và nike
- Concrete factory 1 ==> Adidas
- COncrete factory 2 ==> Nike