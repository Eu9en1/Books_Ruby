# frozen_string_literal: true

require_relative 'JSON_parser'

# Конструктор объекта Автор
class Author
  attr_reader :id, :name, :letter

  def initialize(id, name, letter)
    @id = id
    @name = name
    @letter = letter
  end

  def to_string(json)
    a_books = JSONParser.read_books(json)
    author_books = []

    @books&.map do |auth|
      book_name = a_books.find_by_id(auth['id']).name
      author_books.append(book_name)
    end
    "Автор: #{@name}\n" \
    "id: #{@id}\n" \
    "Первая буква Автора: #{@letter}\n" \
    "Написанные книги: #{author_books}\n"
  end
end
