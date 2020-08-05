package main

import (
	"fmt"
	"net/http"
)

func main() {

	http.HandleFunc("/", hello)
	http.ListenAndServe(":9090", nil)

}

func hello(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, %s!", r.URL.Path[1:])
}
