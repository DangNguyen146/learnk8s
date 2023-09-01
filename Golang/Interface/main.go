package main

import (
	"bytes"
	"fmt"
)

func main() {
	var wc WriterCloser = NewBufferWriteCloser()
	wc.Write([]byte("😒😒🖤🖤🤣😊💛"))
	wc.Close()
}

type Writer interface {
	Write([]byte) (int, error)
}
type Closer interface {
	Close() error
}
type WriterCloser interface {
	Writer
	Closer
}
type BufferedWriteCloser struct {
	buffer *bytes.Buffer
}

func (bwc *BufferedWriteCloser) Write(data []byte) (int, error) {
	n, err := bwc.buffer.Write(data)
	if err != nil {
		return 0, err
	}
	v := make([]byte, 8)
	for bwc.buffer.Len() > 8 {
		_, err := bwc.buffer.Read(v)
		if err != nil {
			return 0, err
		}
		_, err = fmt.Println(string(v))
		if err != nil {
			return 0, err
		}
	}
	return n, nil
}
func (bwc *BufferedWriteCloser) Close() error {
	for bwc.buffer.Len() > 0 {
		data := bwc.buffer.Next(8)
		_, err := fmt.Println(string(data))
		if err != nil {
			return err
		}
	}
	return nil
}

func NewBufferWriteCloser() *BufferedWriteCloser {
	return &BufferedWriteCloser{
		buffer: bytes.NewBuffer([]byte{}),
	}
}
