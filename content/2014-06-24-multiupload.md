Title: Multi Upload
Date: 2014-06-24 09:36
Modified: 
Category: Article
Tags: go
Authors: meoow
```go
package main

import (
	"io"
	"log"
	"mime/multipart"
	"net/http"
	"os"
	"path/filepath"
	"runtime"

	"github.com/cheggaaa/pb"
)

func main() {
	if len(os.Args) != 2 {
		log.Println("Usage: pipeUp <filename>\n")
		os.Exit(1)
	}

	input, err := os.Open(os.Args[1])
	check(err)
	defer input.Close()

	stat, err := input.Stat()
	check(err)

	pipeOut, pipeIn := io.Pipe()
	bar := pb.New(int(stat.Size())).SetUnits(pb.U_BYTES)
	bar.ShowSpeed = true

	writer := multipart.NewWriter(pipeIn)

	// do the request concurrently
	var resp *http.Response
	done := make(chan error)
	go func() {

		// prepare request
		req, err := http.NewRequest("POST", "http://localhost:9000/upload", pipeOut)
		if err != nil {
			done <- err
			return
		}

		req.Header.Set("Content-Type", writer.FormDataContentType())
		log.Println("Created Request")
		bar.Start()

		resp, err = http.DefaultClient.Do(req)
		if err != nil {
			done <- err
			return
		}


		done <- nil
	}()

	part, err := writer.CreateFormFile("file", filepath.Base(os.Args[1]))
	check(err)

	out := io.MultiWriter(part, bar)
	_, err = io.Copy(out, input)
	check(err)

	check(writer.Close())
	check(pipeIn.Close()) // need to close the pipe to

	check(<-done)

	bar.FinishPrint("Upload done!")

}

func check(err error) {
	_, file, line, _ := runtime.Caller(1)
	if err != nil {
		log.Fatalf("Fatal from <%s:%d>\nError:%s", file, line, err)
	}
}
```

