# frozen_string_literal: true

# Описание издательства
class PublishingHouse
  attr_reader :id, :name, :books

  def initialize(id, name, books = [])
    @id = id
    @name = name
    @books = books
  end

  def add_book(book)
    @books.append(book)
  end

  def book_count
    books.count
  end
end
