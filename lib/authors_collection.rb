# frozen_string_literal: true

require_relative 'book'
# Список авторов
class AuthorsCollection
  attr_reader :authors

  def initialize(authors)
    @authors = authors
  end

  def find_by_id(id)
    @authors.map do |author|
      return author if author.id.to_i == id.to_i
    end
  end

  def random_author(json)
    @authors.sample.to_string(json)
  end
end
