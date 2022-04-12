# frozen_string_literal: true

# Конструктор объекта Автор
class Author
  attr_reader :id, :name, :letter

  def initialize(id, name, letter)
    @id = id
    @name = name
    @letter = letter
  end

      def to_string(books)
      author_books = []
      books.books.map do |book|
        flag = false
        book.authors.map do |a|
          flag = true if a.to_a[0][1].to_i == @id.to_i
        end
        author_books.append(book.name) if flag
      end
      "Автор: #{@name}\n" \
      "id: #{@id}\n" \
      "Написанные книги: #{author_books}\n"
    end
end
