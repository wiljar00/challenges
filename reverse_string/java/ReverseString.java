public class ReverseString {
    public static String reverseString(String inputStr) {
        char[] charArray = inputStr.toCharArray();
        int left = 0;
        int right = charArray.length - 1;

        while (left < right) {
            // Swap characters at left and right indices
            char temp = charArray[left];
            charArray[left] = charArray[right];
            charArray[right] = temp;

            // Move indices towards the center
            left++;
            right--;
        }

        return new String(charArray);
    }

    public static void main(String[] args) {
        // Example Usage
        String inputStr = "Hello, World!";
        String outputStr = reverseString(inputStr);

        System.out.println("Input: " + inputStr);
        System.out.println("Output: " + outputStr);
    }
}
