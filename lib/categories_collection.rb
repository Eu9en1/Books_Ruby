# frozen_string_literal: true

# Коллекция категорий
class CategoriesCollection
  attr_reader :categories

  def initialize(categories)
    @categories = categories
  end

  def find_by_id(id)
    categories.map do |category|
      return category if category.id == id
    end
  end
end
