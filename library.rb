
class Book
  attr_reader :author, :title, :id, :status

  def initialize(title, author, id = nil)
    @author = author
    @title  = title
    @id = id
    @status='available'
  end

  def check_out
    if @status == 'available'
      @status = 'checked_out'
      return true
    else
      return false
    end
  end

  def check_in
    if @status != 'available'
      @status = 'available'
      return true
    else
      return false
    end
  end


end

class Borrower
  attr_reader :name,:books
  def initialize(name)
    @name = name
    @books=[]
  end
end

class Library
  attr_reader :books,:borrowers

  def initialize
    @books = []
    @borrowers=[]
  end


  def register_new_book(title, author)
    @books<<(Book.new(title,author,@books.length))
  end

  def check_out_book(book_id, borrower)
    puts borrower.books.length
    if borrower.books.length<1
      if @books[book_id].status == 'available' 
        borrower.books << @books[book_id]
        @books[book_id].check_out
        @borrowers<<borrower
        return @books[book_id]
      end
    end
  end

  def get_borrower(book_id)
    @borrowers.each do|borrower|
      borrower.books.each{|book| book.id==book_id ? (return borrower.name) : nil}
    end
  end


  def check_in_book(book)
    person = self.get_borrower(book.id)
    self.borrowers.each_with_index do |borrower, index| 
      if borrower.name == person 
        puts borrower
        person = borrowers[index] 
        self.borrowers[index]=nil
      end
    end

    person.books.each_with_index{|borrowed_book, index| borrowed_book==book ? person.books[index]=nil : nil}
    book.check_in
  end

  def available_books
  end

  def borrowed_books
  end
end
