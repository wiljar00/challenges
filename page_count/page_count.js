// A teacher asks the class to open their books to a page number. 
// A student can either start turning pages from the front of the book or from the back of the book. 
// They always turn pages one at a time. When they open the book, page 1 is always on the right side:
// When they flip page 1, they see pages 2 and 3. Each page except the last page will always be printed on both sides. 
// The last page may only be printed on the front, given the length of the book. 
// If the book is n pages long, and a student wants to turn to page p, what is the minimum number of pages to turn? 
// They can start at the beginning or the end of the book.
// Given n and p, find and print the minimum number of pages that must be turned in order to arrive at page


/*
 * Complete the 'pageCount' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER n
 *  2. INTEGER p
 */

function pageCount(n, p) {
    // Front pages turn calculation
    let front_pages = Math.floor(p / 2);

    // Back pages turn calculation
    let back_pages;
    
    if (n % 2 === 0) {
        // If the book has an even number of pages, adjust the calculation to account for the last page being potentially on the front.
        back_pages = Math.floor((n - p + 1) / 2);
    } else {
        // If the book has an odd number of pages.
        back_pages = Math.floor((n - p) / 2);
    }

    // Return the smaller of the two (front or back page turns)
    return Math.min(front_pages, back_pages);
}

n = 5
p = 4
console.log( pageCount(n, p)) // should return 0


n = 6
p = 2
console.log( pageCount(n, p)) // should return 1