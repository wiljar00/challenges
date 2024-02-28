using System;

class Program {
    static string ReverseString(string inputStr) {
        char[] charArray = inputStr.ToCharArray();
        Array.Reverse(charArray);
        return new string(charArray);
    }

    static void Main() {
        string inputStr = "Hello, World!";
        string outputStr = ReverseString(inputStr);

        Console.WriteLine($"Input: {inputStr}");
        Console.WriteLine($"Output: {outputStr}");
    }
}
