#include <iostream>
#include <string>

std::string reverseString(const std::string& inputStr) {
    std::string reversedStr = inputStr;
    int left = 0;
    int right = reversedStr.length() - 1;

    while (left < right) {
        // Swap characters at left and right indices
        std::swap(reversedStr[left], reversedStr[right]);

        // Move indices towards the center
        left++;
        right--;
    }

    return reversedStr;
}

int main() {
    // Example Usage
    std::string inputStr = "Hello, World!";
    std::string outputStr = reverseString(inputStr);

    std::cout << "Input: " << inputStr << std::endl;
    std::cout << "Output: " << outputStr << std::endl;

    return 0;
}
