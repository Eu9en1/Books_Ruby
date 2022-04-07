# frozen_string_literal: true

# Описание коллекции издательств
class PublishingHousesCollection
  attr_reader :publishing_houses

  def initialize(publishing_houses)
    @publishing_houses = publishing_houses
  end

  def find_by_id(id)
    publishing_houses.map do |publishing_house|
      return publishing_house if publishing_house.id == id
    end
  end

  def init_books(books)
    books.books.map do |book|
      @publishing_houses.map do |publishing_house|
        if publishing_house.id == book.publishing_house
          publishing_house.add_book(book)
        end
      end
    end
  end

  def most_books(books)
    init_books(books)
    first = first_place_books
    sec_max = 0
    sec_max_name = ''
    sec_max_ind = 1
    publishing_houses.map.with_index do |ph, i|
      if (ph.book_count > sec_max) && (i != first[2])
        sec_max = ph.book_count
        sec_max_name = ph.name
        sec_max_ind = i
      end
    end
    "#{first[1]} (#{first[0]}) и #{sec_max_name} (#{sec_max})"
  end

  def first_place_books
    max = 0
    max_name = ''
    max_ind = 0
    publishing_houses.map.with_index do |ph, i|
      if ph.book_count > max
        max = ph.book_count
        max_name = ph.name
        max_ind = i
      end
    end

    [max, max_name, max_ind]
  end
end
