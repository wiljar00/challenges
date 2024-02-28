const reverseString = require('./main');

test('Reverse String Test', () => {
  // Test cases
  expect(reverseString('Hello, World!')).toBe('!dlroW ,olleH');
  expect(reverseString('abc123')).toBe('321cba');
  // Add more test cases as needed
});
