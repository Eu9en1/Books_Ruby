# frozen_string_literal: true

require_relative 'JSON_parser'
require_relative 'author'
require_relative 'category'
require_relative 'Publishing_house'
require_relative 'Authors_collection'
require_relative 'Categories_collection'
require_relative 'Publishing_houses_collection'

# Описание книги
class Book
  attr_reader :id, :name, :price, :isbn, :last_release_date, :category,
              :publishing_house, :authors

  def initialize(id, name, price, isbn, last_release_date,
                 category, publishing_house, authors)
    @id = id
    @name = name
    @price = price
    @isbn = isbn
    @last_release_date = last_release_date
    @category = category
    @publishing_house = publishing_house
    @authors = authors
  end

  def to_string(json)
    categories = JSONParser.read_categories(json)
    authors_col = JSONParser.read_authors(json)
    
    authors_names = []

    @authors&.map do |a|
      name = authors_col.find_by_id(a['id']).name
      authors_names.append(name)
    end

    "Категория: #{categories&.find_by_id(@category)&.name}\n" +
      "Автор(ы): #{authors_names}\n" .delete('[""]') +
      "Название: #{@name}\n" \
      "Стоимость: #{@price}\n" \
      "isbn: #{@isbn}\n" 
  end
end
