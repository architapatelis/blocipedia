# this is a standalone library, with no dependencies or inheritance requirements
# we will use these common functsions in out rspec tests.
# we can't use module to instantiate a new object
# use this module as a mixin to add functions to multiple classes
# we will add this file in application.rb so we can use it everywhere without having to 'include' it in each file.



module RandomData

  def self.random_paragraph
    sentences = []
    # 4 to 6 times add random sentences to the empty sentences array
    rand(4..6).times do
      sentences << random_sentence
    end

    # join all the random sentences in the array with a space in between.
    sentences.join(" ")
  end

  def self.random_sentence
    strings = []
    # 3 to 8 times add a random word to the empty strings array
    rand(3..8).times do
      strings << random_word
    end

    # join the random words to make a sentence
    sentence = strings.join(" ")
    #capitalize the first character of the first word. Add a period at the end
    sentence.capitalize << "."
  end

  def self.random_word
    # create an array of letters from a-z
    letters = ('a'..'z').to_a
    # shuffle the existing array using bang(!)
    letters.shuffle!
    #join 0th to nth letters to form a word
    letters[0,rand(3..8)].join
  end
end
