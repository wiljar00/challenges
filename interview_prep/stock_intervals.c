#include <stdio.h>

int countHighlyProfitableMonths(int stockPrices_count, int* stockPrices, int k) {
    if (stockPrices_count < k) {
        return 0;
    }
    
    int count = 0;
    
    // Check each possible interval of length k
    for (int i = 0; i <= stockPrices_count - k; i++) {
        int is_strictly_increasing = 1;
        
        // Check if the interval is strictly increasing
        for (int j = i; j < i + k - 1; j++) {
            if (stockPrices[j] >= stockPrices[j + 1]) {
                is_strictly_increasing = 0;
                break;
            }
        }
        
        if (is_strictly_increasing) {
            count++;
        }
    }
    
    return count;
}

// Test function
int main() {
    // Test case from the problem
    int stockPrices[] = {5, 3, 5, 7, 8};
    int k = 3;
    int result = countHighlyProfitableMonths(5, stockPrices, k);
    printf("Result: %d\n", result);  // Should output: 2
    
    // Additional test cases
    printf("\nAdditional test cases:\n");
    
    // Test case 1: All increasing
    int test1[] = {1, 2, 3, 4, 5};
    printf("Test 1 - [1,2,3,4,5], k=3: %d\n", countHighlyProfitableMonths(5, test1, 3));
    
    // Test case 2: No increasing intervals
    int test2[] = {5, 4, 3, 2, 1};
    printf("Test 2 - [5,4,3,2,1], k=3: %d\n", countHighlyProfitableMonths(5, test2, 3));
    
    // Test case 3: k=1
    int test3[] = {5, 3, 5, 7, 8};
    printf("Test 3 - [5,3,5,7,8], k=1: %d\n", countHighlyProfitableMonths(5, test3, 1));
    
    return 0;
}
