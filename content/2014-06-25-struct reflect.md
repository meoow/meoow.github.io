Title: struct reflect
Date: 2014-06-25 19:58
Modified: 
Category: Article
Tags: go
Authors: meoow
Summary: 
```go
package main

import (
	"fmt"
	"reflect"
)

func main() {
	x := struct {
		Foo string
		Bar int
	}{"foo", 2}

	t := reflect.TypeOf(x)
	v := reflect.ValueOf(x)
	for i := range make([]struct{}, t.NumField()) {
		fmt.Println(t.Field(i).Name, v.FieldByName(t.Field(i).Name).Interface())
	}
}
```
