package main

import (
    "fmt"
    "strings"
)

func reverseString(inputStr string) string {
    charArray := strings.Split(inputStr, "")
    for i, j := 0, len(charArray)-1; i < j; i, j = i+1, j-1 {
        charArray[i], charArray[j] = charArray[j], charArray[i]
    }
    return strings.Join(charArray, "")
}

func main() {
    inputStr := "Hello, World!"
    outputStr := reverseString(inputStr)

    fmt.Printf("Input: %s\n", inputStr)
    fmt.Printf("Output: %s\n", outputStr)
}
