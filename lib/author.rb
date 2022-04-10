# frozen_string_literal: true

# Конструктор объекта Автор
class Author
  attr_reader :id, :name, :letter

  def initialize(id, name, letter)
    @id = id
    @name = name
    @letter = letter
  end

  def to_string(json)
    authors_list = JSONParser.read_authors(json)
    

    "Автор: #{@name}\n" \
      "id: #{@id}\n" \
      "Первая буква Автора: #{@letter}\n"
  end
end
