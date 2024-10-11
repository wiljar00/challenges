
class SpellChecker
  # TODO: try implementing Levenshtein distance to suggest the closest valid words

  def initialize(dictionary:)
    @dictionary = load_dictionary(dictionary)
  end

  def run_script
    puts "Enter a sentence to check:"
    puts "(checked word: about, not-checked word: test)"
    input_text = gets.chomp
    misspelled = find_misspelled_words(input_text, @dictionary)
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

dictionary_file = "dictionary.txt"
SpellChecker.new(dictionary: dictionary_file).run_script