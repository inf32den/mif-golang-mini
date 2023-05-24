package main

import (
 "fmt"
 "net/http"
)

func main() {
 http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
  fmt.Fprintf(w, "Привет МИФ!")
 })

 http.ListenAndServe(":3535", nil)
}
