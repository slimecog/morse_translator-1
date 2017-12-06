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
end
