require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end

require "minitest/autorun"
require "minitest/pride"
require "pry"
require_relative "../lib/translator"

class TranslatorTest < Minitest::Test

  def test_test_it_exists
    t = Translator.new

    assert_instance_of Translator, t
  end

  def test_it_can_translate_english_to_morse
    t = Translator.new

    result = t.english_to_morse("hello world")

    assert_equal "......-...-..--- .-----.-..-..-..", result
  end

  def test_english_to_morse_is_case_insensitive
    t = Translator.new

    result = t.english_to_morse("HeLlO WoRlD")

    assert_equal "......-...-..--- .-----.-..-..-..", result
  end

  def test_it_works_with_numbers
    t = Translator.new

    result = t.english_to_morse("There are 3 ships")

    assert_equal "-......-.. .-.-.. ...-- ..........--....", result
  end

  def test_it_can_translate_from_a_file
    t = Translator.new

    result = t.from_file("input.txt")

    assert_equal ".. .--- ..-. .- ..-....-...", result
  end

  def test_it_can_translate_morse_to_english
    t = Translator.new

    result = t.morse_to_english("..  .- --  .. -.  .-  ..-. .. .-.. .")

    assert_equal "I am in a file", result
  end
end
