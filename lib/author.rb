# frozen_string_literal: true

# Конструктор объекта Автор
class Author
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end
end
