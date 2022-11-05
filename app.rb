require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  # CREATE PERSON METHOD
  def create_person
    puts 'Do you want to create a student (1) or teacher (2)? [Input the number]'
    input = gets.chomp.to_i
    case input
    when 1
      create_student
    when 2
      create_teacher
    else puts 'Invalid entry'
    end
  end

  # CREATE STUDENT METHOD
  def create_student
    puts 'student\'s age: '
    age = gets.chomp.to_i
    if age < 5 || age > 65 || age.nil?
      puts 'Sorry, a student must have a valid age'
      return
    end

    puts 'student\'s name: '
    name = gets.chomp

    puts 'does student have parent permission? [Y/N]'
    parent_permission = gets.chomp.capitalize
    case parent_permission
    when 'Y'
      true
    when 'N'
      false
    end

    student = Student.new(age, name, parent_permission)
    @people.push(student)
    puts 'Person created successfully!'
  end

  # CREATE TEACHER METHOD
  def create_teacher
    puts 'Teacher\'s age: '
    age = gets.chomp.to_i
    if age < 18 || age > 65 || age.class != Integer || age.nil?
      puts 'Sorry, a teacher must have a valid age'
      return
    end

    puts 'Teacher\'s name: '
    name = gets.chomp

    puts 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    puts 'Person created successfully!'
  end

  # LIST PEOPLE METHOD
  def list_all_people
    puts 'There are no people in the list. Kindly add at least one person' if @people.empty?
    @people.each_with_index do |person, index|
      puts "(#{index + 1}) [#{person.class}] => Id: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  # CREATE BOOK METHOD
  def create_a_book
    puts 'Create a new book'
    print 'Enter the book title: '
    title = gets.chomp
    print 'Enter the book author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts "#{title} book was added successfully"
  end

  # LIST BOOKS METHOD
  def list_books
    puts 'There are no books found, Kindly add at least one book' if @books.empty?
    @books.each_with_index do |book, _index|
      puts "(#{index + 1}) Book => Title: #{book.title}, Author: #{book.author}"
    end
  end

  # CREATE RENTAL METHOD
  def create_a_rental()
    puts 'Select a book from the following list by the book number: '
    list_all_books
    book_number = gets.chomp.to_i
    puts 'Book selected'
    puts 'Select a person from the following list by the person\'s number: '
    list_all_people
    person_number = gets.chomp.to_i
    puts 'Person selected'
    print 'Date: '
    date = gets.chomp
    puts 'Date of renting book is added'
    @rentals.push(Rental.new(date, @people[person_number - 1], @books[book_number - 1]))
    puts 'Rental book created successfully'
  end

  # LIST RENTALS FOR A GIVEN PERSON ID
  def list_all_rentals
    print 'Enter Person\'s ID: '
    id = gets.chomp.to_i
    puts 'List of all Rentals books: '
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Person: #{rental.person.name}
        Date: #{rental.date},
        Book '#{rental.book.title}' written by #{rental.book.author}"
      else
        puts 'Checking for person......'
        puts 'No rentals found for the given ID for person'
      end
    end
  end

  # Main menu list method
  def main_menu
    puts 'Main menu'
    puts 'Please choose an option by entering a number:
        1 - List all Books
        2 - List all People
        3 - Create a person
        4 - Create a book
        5 - Create a rental
        6 - List all rentals for a given person id
        7 - Exit Library'
    puts 'Waiting for Selection...'
  end

  # Handle main menu selction
  # rubocop:disable Metrics/CyclomaticComplexity
  def menu_selection
    main_menu
    selected = gets.chomp.to_i
    case selected
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_a_person
    when 4
      create_a_book
    when 5
      create_a_rental
    when 6
      list_all_rentals
    when 7
      puts 'Thank you for using OOP school Library'
      exit
    end
    menu_selection
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
