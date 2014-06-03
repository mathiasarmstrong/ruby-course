
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
      puts self.borrowers[1]
      borrower.books.each{|book| book.id==book_id ? (return borrower.name) : nil}
    end
  end


  def check_in_book(book)
    person = self.get_borrower(book.id)
    book.check_in
    self.borrowers.each_with_index do |borrower, index| 
      puts "hello"
      if borrower.name == person 
        person = borrowers[index] 
        self.borrowers[index]=nil
        self.borrowers.compact!
      end
    end
    person.books.each_with_index{|borrowed_book, index| borrowed_book==book ? person.books[index]=nil : nil}
    
  end

  def available_books
    availablebooks=[]
    @books.each{|book| book.status=="available" ? availablebooks<<book : nil}
    return availablebooks
  end

  def borrowed_books
    borrowedbooks = []
    @books.each{|book| book.status!="available" ? borrowedbooks<<book : nil}
    return borrowedbooks
  end
end
