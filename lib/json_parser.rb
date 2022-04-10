# frozen_string_literal: true

require 'json'
require_relative 'book'
require_relative 'author'
require_relative 'category'
require_relative 'Publishing_house'
require_relative 'Books_collection'
require_relative 'Authors_collection'
require_relative 'Categories_collection'
require_relative 'Publishing_houses_collection'

# Чтение JSON-файла
class JSONParser
  def self.read_json
    json_data = File.read('./Books.json')
    JSON.parse(json_data)
  end

  def self.read_books(obj)
    books = []
    obj['books'].map do |object|
      element = Book.new(object['id'], object['attributes']['name'],
                         object['attributes']['amountTotal'],
                         object['attributes']['isbn'],
                         object['attributes']['lastReleaseDate'],
                         object['relationships']['category'],
                         object['relationships']['publishingHouse'],
                         object['relationships']['authors'])
      books.append(element)
    end
    BooksCollection.new(books)
  end

  def self.read_authors(obj)
    authors = []
    obj['internalAuthors'].map do |objects|
      element = Author.new(objects['id'], objects['authorName'],
                           objects['letter'])
      authors.append(element)
    end
    AuthorsCollection.new(authors)
  end

  def self.read_categories(obj)
    categories = []
    obj['categories'].map do |objects|
      element = Category.new(objects['id'], objects['categoryName'])
      categories.append(element)
    end
    CategoriesCollection.new(categories)
  end

  def self.read_publishing_houses(obj)
    publishing_houses = []
    obj['publishingHouses'].map do |objects|
      element = PublishingHouse.new(objects['id'],
                                    objects['publishingHouse'])
      publishing_houses.append(element)
    end
    PublishingHousesCollection.new(publishing_houses)
  end
end
