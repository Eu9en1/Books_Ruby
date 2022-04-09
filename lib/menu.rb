# frozen_string_literal: true

require_relative '../lib/book'
require_relative '../lib/JSON_parser'
require_relative '../lib/author'
require_relative '../lib/category'
require_relative '../lib/Books_collection'
require_relative '../lib/Publishing_house'
require_relative '../lib/Authors_collection'
require_relative '../lib/Categories_collection'
require_relative '../lib/Publishing_houses_collection'

# Стартовое меню
class Menu
  def self.start_menu
    json = JSONParser.read_json
    books = JSONParser.read_books(json)
    publishing_houses = JSONParser.read_publishing_houses(json)
    
    print_info(books, publishing_houses)
    
    loop do
      choise = menu_loop
      if choise == 3
        print("Работа программы завершена пользователем\n")
        break
      end
      if choise == 2
        puts(books.random_book(json))
        loop do
          choise = menu_loop_sec
          if choise == 3
            print("Работа программы завершена пользователем\n")
            abort
          end
          if choise == 2
            puts(books.random_book(json))
          end
          if choise == 1
            break
          end
        end
      end
      puts(books.random_book(json)) if choise == 1
    end
  end

  def self.print_info(books, publishing_houses)
    puts("Общее количество книг: #{books.count}")
    puts('Количество книг, доступных для предзаказа:'\
       "#{books.preorder_allow_count}")
    puts('Два издательства, чьих книг в магазине'\
       " на данный момент больше всего: #{publishing_houses.most_books(books)}")
  end

  def self.menu_loop
    print("1. Случайная книга\n")
    print("2. Случайный автор\n")
    print("3. Выход\n")
    print('Введите номер нужного пункта меню: ')
    choise = gets.to_i
    
    loop do
      break if [3, 2, 1].include?(choise)

      print('Номер пункта меню введен неверно, введите еще раз: ')
      choise = gets.to_i
    end

    choise
  end

  def self.menu_loop_sec
    print("1. Назад к первому меню\n")
    print("2. Другой случайный автор\n")
    print("3. Выход\n")
    print('Введите номер нужнного пункта меню: ')
    choise = gets.to_i
    
    loop do
      break if [3, 2, 1].include?(choise)

      print('Номер пункта меню введен неверно, введите еще раз: ')
      choise = gets.to_i
    end

    choise
  end

end
