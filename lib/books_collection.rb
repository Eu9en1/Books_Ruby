# frozen_string_literal: true

require_relative 'book'
# Коллекция книг
class BooksCollection
  attr_reader :books

  def initialize(books)
    @books = books
  end

  def random_book(json)
    @books.sample.to_string(json)
  end

  def count
    @books.count
  end

  def preorder_allow_count
    allowed = 0
    @books.map do |book|
      allowed += 1 if book.last_release_date.nil?
    end
    allowed
  end
end
