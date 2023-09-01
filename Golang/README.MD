# Vài lỗi khi gặp với golang
1. Run project ngoài thư mục cài đặt golang ---> có thể bỏ qua hoặc

    go mod init <tenmodule>

2. Run project 

    go run <file>

3. Build project

    go built <file>

4. Errro builf with package

        go env -w GO111MODULE=off

    Project view

        ChainOfResponsibilityProject/
        |-- main.go
        |-- go.mod
        |-- ChainOfResponsibility/
        |   |-- Cashier.go
        |   |-- Medical.go
        |   |-- Doctor.go
        |   |-- Reception.go
