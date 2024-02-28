fn reverse_string(input_str: &str) -> String {
    input_str.chars().rev().collect()
}

fn main() {
    let input_str = "Hello, World!";
    let output_str = reverse_string(input_str);

    println!("Input: {}", input_str);
    println!("Output: {}", output_str);
}
