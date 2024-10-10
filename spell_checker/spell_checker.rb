
class SpellChecker
  # TODO: try implementing Levenshtein distance to suggest the closest valid words

  DICTIONARY_DIR = "dictionary.txt".freeze

  def run_script
    dictionary = load_dictionary(DICTIONARY_DIR)

    puts "Enter a sentence to check:"
    input_text = gets.chomp
    
    misspelled = find_misspelled_words(input_text, dictionary)
    
    process_input(misspelled)
  end

  private

  def load_dictionary(file_path)
    words = {}
    File.foreach(file_path) do |line|
      word = line.strip.downcase
      words[word] = true
    end
    words
  end

  def spell_check(word, dictionary)
    # note - word must exist in the loaded dictionary or it will default to "misspelled"
    dictionary.key?(word.downcase)
  end

  def find_misspelled_words(text, dictionary)
    words = text.split(/\W+/) # Split text by non-word characters
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

SpellChecker.new.run_script