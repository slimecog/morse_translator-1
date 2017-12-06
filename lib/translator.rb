class Translator
  attr_reader :dictionary

  def initialize
    @english_dictionary = {
      "a" => ".-",
      "b" => "-...",
      "c" => "-.-.",
      "d" => "-..",
      "e" => ".",
      "f" => "..-.",
      "g" => "--.",
      "h" => "....",
      "i" => "..",
      "j" => ".---",
      "k" => "-.-",
      "l" => ".-..",
      "m" => "--",
      "n" => "-.",
      "o" => "---",
      "p" => ".--.",
      "q" => "--.-",
      "r" => ".-.",
      "s" => "...",
      "t" => "-",
      "u" => "..-",
      "v" => "...-",
      "w" => ".--",
      "x" => "-..-",
      "y" => "-.--",
      "z" => "--..",
      " " => " ",
      "1" => ".----",
      "2" => "..---",
      "3" => "...--",
      "4" => "....-",
      "5" => ".....",
      "6" => "-....",
      "7" => "--...",
      "8" => "---..",
      "9" => "----.",
      "0" => "-----"
    }
    @morse_dictionary = {
      '.-' => 'a',
      '-...' => 'b',
      '-.-.' => 'c',
      '-..' => 'd',
      '.' => 'e',
      '..-.' => 'f',
      '--.' => 'g',
      '....' => 'h',
      '..' => 'i',
      '.---' => 'j',
      '-.-' => 'k',
      '.-..' => 'l',
      '--' => 'm',
      '-.' => 'n',
      '---' => 'o',
      '.--.' => 'p',
      '--.-' => 'q',
      '.-.' => 'r',
      '...' => 's',
      '-' => 't',
      '..-' => 'u',
      '...-' => 'v',
      '.--' => 'w',
      '-..-' => 'x',
      '-.--' => 'y',
      '--..' => 'z',
      '.----' => '1',
      '..---' => '2',
      '...--' => '3',
      '....-' => '4',
      '.....' => '5',
      '-....' => '6',
      '--...' => '7',
      '---..' => '8',
      '----.' => '8',
      '-----' => '0',
      ' ' => ' '
    }
  end

  def english_to_morse(input)
    input.downcase.chars.each.map do |letter|
      letter = @english_dictionary[letter]
    end.join
  end

  def from_file(input)
    input = "./data/" + input
    File.open(input, "r") do |f|
      f.each_line.map do |line|
        english_to_morse(line.to_s)
      end.join
    end
  end

  def morse_to_english(input)
    input = input.split(/(  )/).each.map { |x| x.split(' ') }
    input.each.map do |array|
      array.each.map { |letter| letter = @morse_dictionary[letter] }
    end.join(" ")
  end
end
