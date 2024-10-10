
class SpellChecker

  def run_script
    dictionary = load_dictionary("dictionary.txt")

    puts "Enter a sentence to check:"
    input_text = gets.chomp
    
    misspelled = find_misspelled_words(input_text, dictionary)
    
    process_input(misspelled)
  end

  private

  # Load dictionary
  def load_dictionary(file_path)
    words = {}
    File.foreach(file_path) do |line|
      word = line.strip.downcase
      words[word] = true
    end
    words
  end

  # Check if a word is spelled correctly
  def spell_check(word, dictionary)
    dictionary.key?(word.downcase)
  end

  # Find misspelled words in a given text
  def find_misspelled_words(text, dictionary)
    words = text.split(/\W+/)  # Split text by non-word characters
    misspelled_words = []

    words.each do |word|
      unless spell_check(word, dictionary)
        misspelled_words << word
      end
    end

    misspelled_words
  end

  def process_input(misspelled)
    if misspelled.empty?
      puts "No spelling errors found!"
    else
      puts "Misspelled words: #{misspelled.join(', ')}"
    end
  end

end

runner = SpellChecker.new
runner.run_script